#!/bin/bash

#
# Builds a Docker image.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/build-image.sh
#

set -u # Exit the script if any variables are undefined

# Ensure that the necessary environment variables are set
: "${CONTAINER_REGISTRY:?Environment variable CONTAINER_REGISTRY is required}"
: "${VERSION:?Environment variable VERSION is required}"

# Build the Docker image
docker build -t "$CONTAINER_REGISTRY/video-streaming:$VERSION" --file ./Dockerfile-prod .
