-- This script does not aim to automate configuration of keyboard layout.
-- I spent so much damn time trying to wrap my head and the code around it,
-- However, it went all waste of time. I hate this piece of shit.
-- The same script worked without problem on MBP 2018 16 inch, but it didn't with my MBP 2021 14.
-- So, I decided to limit the scope of automation.
-- With this one, it just tries to automate to the point rest of todo is just select the keyboard layout. Should be better than nothing.
-- Again, I hate apple script.

tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.keyboard"
	delay 0.6
end tell

tell application "System Events"
	tell process "System Preferences"
		tell tab group 1 of window "Keyboard"
			click button "Change Keyboard Type…"
			delay 0.6
		end tell
	end tell
end tell

tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.keyboard"
end tell
