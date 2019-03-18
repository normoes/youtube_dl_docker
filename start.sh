#!/bin/bash


docker build -t  normoes/youtubedl .

docker run --rm -it -v $PWD/music:/data normoes/youtubedl $(cat music.txt)
