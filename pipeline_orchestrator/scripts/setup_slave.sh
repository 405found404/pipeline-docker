#!/bin/bash

# Update system and install Docker and Ansible
sudo apt update -y
sudo apt install -y docker.io python3-pip
pip3 install ansible

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add Ubuntu user to Docker group
sudo usermod -aG docker ubuntu