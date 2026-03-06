#!/bin/bash

set -e

echo "🔹 Updating system..."
sudo apt update -y

# --------------------------------------------------
# Java (OpenJDK 17)
# --------------------------------------------------
echo "🔹 Installing Java..."
sudo apt install -y openjdk-17-jdk
java -version

# --------------------------------------------------
# Maven
# --------------------------------------------------
echo "🔹 Installing Maven..."
sudo apt install -y maven
mvn -version

# --------------------------------------------------
# Jenkins
# --------------------------------------------------

# Docker
# --------------------------------------------------
echo "🔹 Installing Docker..."
sudo apt install -y ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg \
  --dearmor -o /etc/apt/keyring

