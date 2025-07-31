#!/bin/bash

echo "Starting system update..."
apt update
apt upgrade -y
apt autoremove -y
echo "System update complete"
