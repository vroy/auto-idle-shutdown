#include <X11/extensions/scrnsaver.h>

main() {
  XScreenSaverInfo *info = XScreenSaverAllocInfo();
  Display *display = XOpenDisplay(NULL); //empty argument means to use $DISPLAY variable
  
  //check that X11 is running or else you get a segafult/coredump
  if (display != NULL) {
    XScreenSaverQueryInfo(display, DefaultRootWindow(display), info);
  }

  printf("%u\n", info->idle);
}
