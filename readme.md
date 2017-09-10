
Shell script to display cover art of currently playing track in mpd.

It extracts embedded images using ffmpeg.  If no image is found, it uses an image file from the same directory as the track.  If still no images is found, it uses a default image. (Todo: emboss track title onto default image using imagemagick)
