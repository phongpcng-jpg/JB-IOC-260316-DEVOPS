#!/bin/bash

set -e

echo "=== Updating package list ==="
sudo apt update

echo "=== Upgrading installed packages ==="
sudo apt upgrade -y

echo "=== Installing required packages ==="
sudo apt install -y openjdk-17-jdk git curl

echo "=== Creating quickbite group ==="
if ! getent group quickbite > /dev/null; then
    sudo groupadd quickbite
else
    echo "Group quickbite already exists."
fi

echo "=== Creating quickbite system user ==="
if ! id quickbite > /dev/null 2>&1; then
    sudo useradd -r -g quickbite -s /bin/false quickbite
else
    echo "User quickbite already exists."
fi

echo "=== Initial setup completed ==="