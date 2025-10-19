#!/usr/bin/env fish

#Check if slurp is already running
set pids (pgrep slurp)
if test -n "$pids"
    echo "slurp is running"
    exit
end

# Set the file path
set tmpfile /tmp/images/clipboard.png

# Save clipboard image to the file
wl-paste -t image/png > $tmpfile

# Check if the file is not empty
if test -s $tmpfile
    # Open the image with swappy
    satty -f $tmpfile
else
    echo "No image found in clipboard."
    rm -f $tmpfile
end

