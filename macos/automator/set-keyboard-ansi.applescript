tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.keyboard"
	delay 0.4
end tell

tell application "System Events"
	tell process "System Preferences"
		tell tab group 1 of window "Keyboard"
			click button "Change Keyboard Type…"
			delay 0.4
		end tell
	end tell
	tell window "Keyboard Setup Assistant" of process "KeyboardSetupAssistant"
		click button "Continue"
		tell application "System Events" to keystroke "z" using command down
		delay 0.4
		click button "Skip" of sheet 1
		delay 0.4
		tell radio group 1 of group 1
			click radio button "ANSI (United States and others)"
		end tell
		click button "Done"
	end tell
end tell

tell application "System Preferences" to quit
