#!/usr/bin/env bash

# Script to load all saved Docker images from the workspace directory in docker.

set -e

directory=workspace

file_extension="tar"
for image in $(find "$directory" -name \*.$file_extension); do
  echo "Loading $image ..."
  docker load -i $image
done

exit 0
