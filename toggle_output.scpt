tell application "System Preferences"
  activate
  set the current pane to pane id "com.apple.preference.sound"
  reveal anchor "Output" of pane id "com.apple.preference.sound"
end tell

tell application "System Events"
  tell application process "System Preferences"
    repeat until exists tab group 1 of window 1
    end repeat
    tell tab group 1 of window "Sound"
      if (selected of row 1 of table 1 of scroll area 1) then
        set selected of row 2 of table 1 of scroll area 1 to true
        set deviceselected to value of text field 1 of row 2 of table 1 of scroll area 1
      else
        set selected of row 1 of table 1 of scroll area 1 to true
        set deviceselected to value of text field 1 of row 1 of table 1 of scroll area 1
      end if
    end tell
  end tell
end tell

tell application "System Preferences" to quit

tell application "GrowlHelperApp"
  set the allNotificationsList to {"Sound Notification"}
  set the enabledNotificationsList to {"Sound Notification"}

  register as application "Toggle Sound Output" all notifications allNotificationsList default notifications enabledNotificationsList icon of application "Script Editor"

  notify with name "Sound Notification" title "Audio Output" description deviceselected application name "Toggle Sound Output"
end tell
