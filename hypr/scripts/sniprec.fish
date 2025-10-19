##!/usr/bin/env fish

#Check if slurp is already running
set pids (pgrep slurp)
if test -n "$pids"
    echo "slurp is running"
    exit
end

# Define temporary directory for video
set temp_dir /tmp/videos

# Create the temp directory if it doesn't exist
mkdir -p $temp_dir

# Check if wf-recorder is running
if pgrep -x "wf-recorder" > /dev/null
    echo "wf-recorder is running. Killing it..."
    # Kill wf-recorder process
    pkill -x "wf-recorder"
    echo "wf-recorder has been killed."
    play /home/nick/sounds/RecStop.mp3
    exit
else
    echo "wf-recorder is not running."
end

#Check if the file exists in the specified directory
if test -f "$temp_dir/sniprec.mp4"
   echo "sniprec.mp4 found in $temp_dir. Deleting it..."
    rm "$temp_dir/sniprec.mp4"
    echo "sniprec.mp4 has been deleted."
else
    echo "sniprec.mp4 not found in $temp_dir."
end

# Use slurp to select a region
set region (slurp) ; or exit 

play /home/nick/sounds/RecStart.mp3 &

# Set the output video file path
set output_file "$temp_dir/sniprec.mp4"

# Start recording with wf-recorder using the selected region
wf-recorder -g $region -aalsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFiSpeakersink.monitor -f $output_file

# Once recording is stopped, copy the video to the clipboard using wl-copy
wl-copy -t text/uri-list "file://$output_file"

#notification
notify-send "Video recorded"