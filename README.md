# Slideshow Builder

This bash script downloads photos from https://unsplash.com and prepares them for FFMPEG.
Adjustments made from [Video Slideshow Generator](https://github.com/eligundry/video-slideshow-generator)

The script will use `mp3info` utility to calculate audio file duration and then adjust frame rate of images to be be timed close to video stop. Falls back to 5 seconds per image.

The image files can be portrait or landscape orientation and they'll be rescaled with constant aspect ratio with black padding.

## Requirements

* [FFMPEG](http://www.ffmpeg.org/) - Latest version is needed!
* [MP3Info](http://www.ibiblio.org/mp3info/) - Built using version 0.8.5a

## Usage

```shell
$ ./slideshow-builder.sh MODE UNSPLASH-ITEM AUDIO_FILE.mp3
```

## Arguments

* __MODE__ - Either "topics" or "users"
* __UNSPLASH-ITEM__ - Depending on `mode`, this is the topic on Unsplash (e.g. nature) [Unsplash Nature Topic](https://unsplash.com/t/nature/), or username of the person whose photos the slideshow should include.
* __MP3INFO__ - The specified audio file to be used as background music. 

# Side Effects

Creates a folder named `FILE_{MODE}_{UNSPLASH-ITEM}` and downloads the images and a copy of audio file into that folder for `FFMPEG` to pick up from.