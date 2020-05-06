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
$ ./slideshow-builder.sh UNSPLASH-TOPIC AUDIO_FILE.mp3
```

## Arguments

* __UNSPLASH-TOPIC__ - The topic on Unsplash (e.g. nature) [Unsplash Nature Topic](https://unsplash.com/t/nature/)
* __MP3INFO__ - The specified audio file to be used as background music. 

# Side Effects

Creates a folder named `FILE_UNSPLASH-TOPIC` and drops images and a copy of audio file into that folder for `FFMPEG` to pick up.