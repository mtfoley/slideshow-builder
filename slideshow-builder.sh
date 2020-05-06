#!/bin/bash
# Simple script that converts a folder of images into a video slideshow
TOPIC=$1
AUDIO_FILE=$2
PIC_DIR="FILES_$TOPIC"
OUTPUT_VIDEO="video.mp4"
SLIDE_DURATION=0.2

[[ -d $PIC_DIR ]] || mkdir $PIC_DIR
cp $AUDIO_FILE $PIC_DIR/
cd $PIC_DIR
# Figure MP3 Length
DURATION=$(mp3info -p "%S" $AUDIO_FILE)
# Obtain image files
echo "Downloading Images..."
curl -sS "https://unsplash.com/napi/topics/$TOPIC/photos?page=1&per_page=25" | grep -Eoi '"full":"[^\"]+"' | sed -E 's/("full":")(.*)(photo.*)(\?.*)"/\2\3\4 -o \3.jpg/' | xargs -n 3 curl -s
PIC_COUNT=$(ls *.jpg | wc -l)
echo "Creating Slideshow with $PIC_COUNT Images & MP3 at $DURATION seconds..."
SLIDE_DURATION=$(echo "scale=3 ; $PIC_COUNT / $DURATION" | bc)
# Create Video
# -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2"
# this one has portrait orientation, skews images:  
ffmpeg -loglevel quiet -f image2  -r $SLIDE_DURATION -pattern_type glob -i '*.jpg' -i $AUDIO_FILE -vf "scale=w=1280:h=720:force_original_aspect_ratio=1,pad=1280:720:(ow-iw)/2:(oh-ih)/2" -c:v libx264 -preset slow -tune stillimage $OUTPUT_VIDEO
cp $OUTPUT_VIDEO "../$TOPIC.mp4"