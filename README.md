Auto-Idle-Shutdown
==================

This is a script that will check your idle time, and trigger a clean shutdown if you haven't touched your mouse or keyboard for the specified amount of time. It can also be configured to popup a warning message to remind you when your computer will be shutting down.

Requirements
------------

* Xscreensaver
* Ruby 1.8.6 or higher (only tested with 1.8.6)
* gcc
* zenity

Installation
------------

* Download this project however you prefer: github download link or git clone.
* Install the dependencies: `sudo apt-get install libxss-dev zenity`
* Install ruby if you don't already have it: `sudo aptitude install ruby build-essential libopenssl-ruby ruby1.8-dev`
* Compile idle.c: `gcc -o idle idle.c -lXss`

Usage
-----

Let me resume how the script works before you configure your crontab. I schedule the script to run every minute. It reads the amount of time since the last time the keyboard or mouse was touched using the small Xscreensaver C program called idle. Once it has the idle time, it compares it to the shutdown time to see if the time is elapsed and it's time to reboot. Of course if it is, it will send the shutdown signal for a clean shutdown. If it's not time to shutdown, it could be time to pop a notification to the user to remind him that his computer will reboot in approximately the speficied amount of time.

To set it up in your crontab, add the following two lines using contab -e: <pre>DISPLAY=:0
* * * * * cd /path/to/auto-idle-shutdown && ruby auto-idle-shutdown.rb >> auto-idle-shutdown.log 2>&1</pre>


If it does not work for some reason, you can try manually running it with --debug like this: `ruby auto-idle-shutdown.rb --debug`


Tested on
---------
I haven't had a chance to test this in other environments than the 2 listed below. Don't hesitate to provide feedback for other environments.

* Setup #1:
** 
** 

* Setup #2:
** 
** 

I used the following links to help me figure this out
-----------------------------------------------------

[http://coderrr.wordpress.com/2008/04/20/getting-idle-time-in-unix/](http://coderrr.wordpress.com/2008/04/20/getting-idle-time-in-unix/) - Core functionality

[http://coderrr.wordpress.com/2008/04/20/getting-idle-time-in-unix/#comment-1142](http://coderrr.wordpress.com/2008/04/20/getting-idle-time-in-unix/#comment-1142) - Improvements to the idle script to remove segfaults

[http://ubuntuforums.org/showthread.php?t=1332101](http://ubuntuforums.org/showthread.php?t=1332101) - Helped me figure out how to run the idle script through crontab
