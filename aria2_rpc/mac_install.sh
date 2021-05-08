cp aria2.plist ~/Library/LaunchAgents/aria2.plist
chmod 644 ~/Library/LaunchAgents/aria2.plist
launchctl load ~/Library/LaunchAgents/aria2.plist
launchctl start aria2
