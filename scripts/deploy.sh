#!/bin/bash

set -e

IMAGE="week9-cicd-app:2.0"
CONTAINER="week9-production"

echo "Starting deployment..."

if docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
    echo "Removing existing container..."
    docker stop "$CONTAINER" || true
    docker rm "$CONTAINER" || true
fi

echo "Starting new application container..."

docker run -d \
    --name "$CONTAINER" \
    -p 8081:80 \
    "$IMAGE"

echo "Deployment completed successfully."
