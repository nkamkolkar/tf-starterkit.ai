#!/bin/bash

# --- DANGER ZONE: DOCKER HARD RESET SCRIPT ---
# This script will completely reset the Docker environment.
# It will remove ALL containers, images, volumes, and networks
# that are not currently running. USE WITH CAUTION.
# This is a good practice for starting from a clean slate on a VM.

echo "WARNING: This script will remove ALL Docker containers, images, volumes, and networks."
echo "Any unsaved data in your Docker volumes will be permanently lost."
read -p "Are you sure you want to continue? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Aborting Docker hard reset."
    exit 1
fi

echo "--- Starting Docker Hard Reset ---"

# Step 1: Stop and remove all running containers
echo "Stopping and removing all running containers..."
docker ps -q | xargs -r docker stop
docker ps -a -q | xargs -r docker rm

# Step 2: Remove all Docker networks
echo "Removing all Docker networks..."
docker network ls -q | xargs -r docker network rm

# Step 3: Remove all unused images, volumes, and networks
echo "Pruning the Docker system. This may take a few moments..."
docker system prune --all --volumes --force

# Step 4: Restart the Docker daemon to reset its state
echo "Restarting the Docker daemon to ensure a clean state..."
sudo systemctl restart docker

echo "--- Docker Hard Reset Complete ---"
echo "Your Docker environment is now clean. You can now safely run 'docker compose up -d'."

exit 0
