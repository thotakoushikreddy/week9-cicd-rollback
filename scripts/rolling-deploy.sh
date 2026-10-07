#!/bin/bash

set -e

NEW_CONTAINER="week9-production-new"
OLD_CONTAINER="week9-production"

echo "Starting rolling deployment..."

docker run -d \
    --name "$NEW_CONTAINER" \
    -p 8082:80 \
    week9-cicd-app:2.0

echo "New version started."

sleep 5

curl -f http://localhost:8082

echo "New version verified."

if docker ps -a --format '{{.Names}}' | grep -q "^${OLD_CONTAINER}$"; then
    docker stop "$OLD_CONTAINER" || true
    docker rm "$OLD_CONTAINER" || true
fi

docker stop "$NEW_CONTAINER"

docker rm "$NEW_CONTAINER"

docker run -d \
    --name "$OLD_CONTAINER" \
    -p 8081:80 \
    week9-cicd-app:2.0

echo "Rolling deployment completed."
