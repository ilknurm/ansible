#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing now..."

    # Install necessary dependencies
    sudo yum install -y yum-utils

    # Add Docker repository
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

    # Install Docker packages
    sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Start Docker service
    sudo systemctl start docker

    echo "Docker has been installed and started."
else
    # Check Docker service status
    if sudo systemctl is-active --quiet docker; then
        echo "Docker is running."
    else
        echo "Docker is installed but not running. Starting Docker..."
        sudo systemctl start docker
        echo "Docker has been started."
    fi
fi

