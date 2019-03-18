# Running youtube_dl in a docker container

## youtube_dl
https://github.com/ytdl-org/youtube-dl/

## Configuration

The Dockerfile contains the following `ENTRYPOINT`:

`ENTRYPOINT ["youtube-dl", "--extract-audio", "--no-call-home", "--ignore-errors", "--no-playlist", "--audio-format", "mp3"]`

This means, that **youtube_dl** is configured to download audio files only (`--exract-audio`) in the mp3 format (`--audio-format mp3`), playlists are ignored (`--no-playlist`), no information is fetched from the **youtube_dl** servers (`--no-call-home`).

This is my basic setup.

I then run **youtube_dl** in the container like described below in **Start the container**.


Of course, you can utilize the docker image with your own configuration like describe below in **Start the container**.


## Build the image
Please also see `start.sh`.

`docker build -t  normoes/youtubedl .`

## Start the container
Please also see `start.sh`.

`music` is the files should be downloaded into:

`docker run --rm -it -v $PWD/music:/data normoes/youtubedl $(cat music.txt)`

If the default configuration is OK for you but not enough, you can easily elaborate on this:

`docker run --rm -it -v $PWD/music:/data normoes/youtubedl --some-other-option blah $(cat music.txt)`


Should you need a complete different configuration, what's not unxexpected, then you can of course do this:

`docker run --rm -it -v --entrypoint="" $PWD/music:/data normoes/youtubedl youtube-dl ...`

This disables the `ENTRYPOINT` and gives you free reign over what you would like to do with **youtube_dl**. 

In this case, you need to add `youtube-dl` as the program to call right after the docker image name - Previously this was contained in the `ENTRYPOINT`.

For configuration options, please refer to the **youtube_dl README**:

https://github.com/ytdl-org/youtube-dl/blob/master/README.md#readme
