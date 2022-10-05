#!/bin/bash

echo "Build docker container"

docker build . -t dsci-rstudio:4.2

if [[ $? = 0 ]] ; then
echo "Docker build successful"
else
echo "Docker build failed"
fi