require "yaml"

#sleep(5)

DEBUG = ARGV.include?("--debug")

def debug(msg)
  puts msg if DEBUG
end

if !File.exists?("auto-idle-shutdown.conf")
  puts "Missing configuration file."
  exit!(1)
end
config = YAML::load( File.open("auto-idle-shutdown.conf") )

@shutdown = config["shutdown"].to_i # Already in minutes
debug "Status: Shutdown after #{@shutdown} minutes"
@notification = config["notification"].to_i # Already in minutes
debug "Status: Notify #{@notification} minutes before shutdown."

# ./idle returns in milliseconds.
@idle = `./idle`.to_i / 60000 # there's `60 * 1000 ms` in a minute
debug "Status: Idling for #{@idle}"

if @idle >= @shutdown
  debug "Shutting down."
elsif @idle >= (@shutdown - @notification)
  debug "Alerting user that PC will shut down in approximately #{@notification}."
  `zenity --warning --text="AUTO-IDLE-SHUTDOWN: Your PC will shut down in approximately 10 minutes if you don't touch your mouse or keyboard."`
else
  debug "Do nothing."
end
