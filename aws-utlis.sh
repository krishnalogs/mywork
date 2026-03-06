#!/bin/bash
set -e

echo "Updating system..."
sudo apt update -y
sudo apt install -y curl unzip tar git

########################################
# Install AWS CLI v2 (Latest)
########################################
echo "Installing AWS CLI v2..."

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip
unzip -o awscliv2.zip
sudo ./aws/install --update

aws --version

########################################
# Install kubectl (Latest Stable)
########################################
echo "Installing kubectl..."

KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)

curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

kubectl version --client

########################################
# Install eksctl (Latest)
########################################
echo "Installing eksctl..."

ARCH=amd64
PLATFORM=$(uname -s)_${ARCH}

curl -sL https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz \
| tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin

eksctl version

########################################
# Install Helm (Latest)
########################################
echo "Installing Helm..."

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

helm version

########################################
echo "===================================="
echo "All DevOps tools installed successfully"
echo "===================================="

echo "Installed versions:"
aws --version
kubectl version --client
eksctl version
helm version
