#! /usr/bin/env fish

#Check if slurp is already running
set pids (pgrep slurp)
if test -n "$pids"
    echo "slurp is running"
    exit
end

mkdir -p /tmp/images/

set img_tmp "/tmp/images/snip_ocr.png"

set region (slurp)

grim -g $region $img_tmp

set url (zbarimg -q --raw $img_tmp) 

if test -z $url 
	ocrs $img_tmp | wl-copy
else
	wl-copy $url
end


# old script just for ocr
#set img_tmp "/tmp/images/snip_ocr.png"; set region (slurpclr); grim -g $region $img_tmp; ocrs $img_tmp | wl-copy

