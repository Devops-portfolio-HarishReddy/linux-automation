#!/bin/bash
set -Eeuo pipefail

echo "Starting VM boostrap...."

# Detect Distro
if [ -f /etc/debian_version ]; then
	PKG_MANAGER="apt"
	UPDATE_CMD="sudo apt update -y"
	INSTALL_CMD="sudo apt install -y"
elif [ -f /etc/redhat-release ]; then
	PKG_MANAGER="dnf"
        UPDATE_CMD="sudo dnf update -y"
        INSTALL_CMD="sudo dnf install -y"
else
	echo "X unsupported OS. Exiting....."
	exit 1
fi

echo "Updating system packages....."
eval "$UPDATE_CMD"

echo "Installing essential tools....."
eval "$INSTALL_CMD git curl vim ufw nginx net-tools"

echo "Creating a Devops user...."

sudo useradd -m devopsuser || echo "user already exists"

sudo passwd -d devopsuser

sudo usermod -aG sudo devopsuser

echo "configuring firewall..."
sudo ufw allow 'Nginx full'
sudo ufw allow ssh
sudo ufw --force enable

echo "Starting and enabling Nginx..."
sudo systemctl enable --now nginx

echo "Bootstap completed successfully!"

