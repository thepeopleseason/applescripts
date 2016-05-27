-- outlook_pane.scpt
--
-- Switches the preview pane for Outlook to Below/Right/Hidden based on
-- command line argument. To be used with Slate window manager:
-- https://github.com/jigish/slate, to reposition outlook preview pane

on run argv
 set toggle to item 1 of argv

 set appname to "Microsoft Outlook"
 tell application appname
   activate
 end tell
 tell application "System Events"
   tell menu "Reading Pane" of menu item "Reading Pane" of menu "View" of menu bar item "View" of menu bar 1 of application process appname
     if (value of attribute "AXMenuItemMarkChar" of menu item toggle is not "✓")
       click menu item toggle
     end if
   end tell
  end tell
end run
