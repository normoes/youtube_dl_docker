FROM debian:stable-slim

RUN apt-get update -q && apt-get install -y --no-install-recommends python3 python3-pip libav-tools \
    # && pip install --upgrade pip \
    && pip3 install youtube_dl 

VOLUME ["/data"]

WORKDIR "/data"

ENTRYPOINT ["youtube-dl", "--extract-audio", "--no-call-home", "--ignore-errors", "--no-playlist", "--audio-format", "mp3"]

CMD []

