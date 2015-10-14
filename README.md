#openSMILE Docker image

This repo contains a Docker file for containerizing [openSMILE](http://www.audeering.com/research/opensmile), an open-source audio feature extractor by [audEERING](http://www.audeering.com/).

The container is built on an Ubuntu base image.

For example, to extract features from a file called "voice.wav":

```
docker run --rm -v `pwd`:/data:rw opensmile:2.1.0 SMILExtract -I /data/voice.wav -C /openSMILE-2.1.0/config/IS13_ComParE.conf --csvoutput /data/features.csv
```

configure: WARNING: LibSemaineAPI not found!! Configuring only standalone feature extractor
configure: WARNING: Compiling WITHOUT PortAudio support!! Sound recording will probably be broken!
configure: WARNING: Disabling target SEMAINExtract beacuse libsemaineapi was not found or is not useable

