#!/usr/bin/env fish

#Check if slurp is already running
set pids (pgrep slurp)
if test -n "$pids"
    echo "slurp is running"
    exit
end

#Define the directory and ensure it exists
set screenshot_dir /tmp/images
mkdir -p $screenshot_dir

#Fixed filename
set screenshot_path $screenshot_dir/snipshot.png

wayfreeze --hide-cursor --before-freeze-cmd 'grim -g "$(slurp)" /tmp/images/snipshot.png ; killall wayfreeze'
wl-copy < $screenshot_path