#!/bin/bash

set -e

echo "=== Creating QuickBite directories ==="

sudo mkdir -p /opt/quickbite/user-service

echo "=== Setting ownership ==="

sudo chown -R quickbite:quickbite /opt/quickbite

echo "=== Setting permissions ==="

sudo chmod 750 /opt/quickbite

echo "=== Verifying directory ==="

ls -ld /opt/quickbite
ls -la /opt/quickbite

echo "=== Directory setup completed ==="