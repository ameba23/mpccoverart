#!/bin/bash


mpddir="$HOME/Musique/"

defaultimage="$HOME/dotfiles/hdd.jpg"

fname=$(mpc -f %file% current)
ffname=$(echo $fname | sed "s/^\/\/home/\/home/g") || ffname="fff"

if [[ $ffname = /home/* ]] ; then

  fulpath=$ffname
else
  
  fulpath=$mpddir$ffname
fi
found=1
ffmpeg -y -i "$fulpath" /tmp/cover.jpg || found=0

# if no errors
#if [[ $? -eq 0 ]]; then

if [[ $found = 0 ]] ; then 
    #covers="$(find "$(dirname "$fulpath")" -type d -exec find {} -maxdepth 1 -type f -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; )"
    covers="$(find "$(dirname "$fulpath")" -type d -exec find {} -maxdepth 1 -type f -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\)" \; )"
    # todo:  sort by size, use biggest
    src="$(echo -n "$covers" | head -n1)"
    if [[ -f $src ]] ; then
      /bin/cp "$src" /tmp/cover.jpg
    else
      # todo: if still no image found, search recursively into dirs?
      cp "$defaultimage" /tmp/cover.jpg
    fi
fi

