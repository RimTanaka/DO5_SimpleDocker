#!/bin/bash

docker build -t my_server:latest .
export DOCKER_CONTENT_TRUST=1
docker save -o serv.tar my_server:latest
dockle -i CIS-DI-0010 --input serv.tar
