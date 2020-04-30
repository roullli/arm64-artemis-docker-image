# arm64-artemis-docker-image
Here is the description how to build docker image arm64 architecture in order to run on Raspberry Pi

I used these two links to build the docker image but with a bit of modifications: (officialy from Apache)

https://github.com/EnMasseProject/artemis-docker-base
https://github.com/EnMasseProject/java-docker-base

Since the Dockerfile which were used in the first link was not compatible with arm64, I used the second link to build the java-base image.

So after cloning the first link, I copied the scripts folder to the artemis-base folder, then modified the Dockerfile as you can find it here.

Then the rest is same as first link.
