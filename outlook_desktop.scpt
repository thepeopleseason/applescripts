-- outlook_desktop.scpt
--
-- Switches the desktop for Outlook to All/This Desktop based on
-- command line argument. To be used with Slate window manager:
-- https://github.com/jigish/slate, to reposition outlook preview pane

on run argv
  set toggle to item 1 of argv
  if toggle is "all" then
    set menuval to "All Desktops"
  else
    set menuval to "This Desktop"
  end if

  tell application "System Events" to tell UI element "Microsoft Outlook" of list 1 of process "Dock"
    if not (exists) then return
    perform action "AXShowMenu"
    click menu item "Options" of menu 1
    click menu item menuval of menu 1 of menu item "Options" of menu 1
  end tell
end run
