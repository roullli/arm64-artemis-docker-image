# arm64-artemis-docker-image
Here is the description how to build docker image arm64 architecture in order to run on Raspberry Pi

I used this link to build the docker image but with a bit of modifications: (officialy from Apache)

https://github.com/apache/activemq-artemis/tree/master/artemis-docker

1st step

Download the latest version of Apache Artemis

Extarct it and create a docker folder inside.

navigat to the docker folder and copy the Dockerfile and launch.sh inside the folder.

then build the docker image by

docker build . 
