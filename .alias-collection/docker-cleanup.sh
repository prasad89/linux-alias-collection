#!/bin/bash

# Function to remove stopped containers
clean_containers() {
    echo "Cleaning up stopped containers..."
    docker container prune -f
}

# Function to remove unused images
clean_images() {
    echo "Cleaning up unused images..."
    docker image prune -a -f
}

# Function to remove unused volumes
clean_volumes() {
    echo "Cleaning up unused volumes..."
    docker volume prune -f
}

# Function to remove unused networks
clean_networks() {
    echo "Cleaning up unused networks..."
    docker network prune -f
}

# Main cleanup function
cleanup() {
    clean_containers
    clean_images
    clean_volumes
    clean_networks
    echo "Cleanup completed."
}

# Check if Docker is installed and running
if ! docker --version &>/dev/null; then
    echo "Docker is not installed or not running."
    exit 1
fi

# Prompt user for confirmation before cleanup
read -p "This will remove all stopped containers, unused images, volumes, and networks. Are you sure you want to proceed? (y/n): " choice
case "$choice" in
  y|Y )
    cleanup
    ;;
  n|N )
    echo "Cleanup aborted."
    ;;
  * )
    echo "Invalid choice. Cleanup aborted."
    ;;
esac
