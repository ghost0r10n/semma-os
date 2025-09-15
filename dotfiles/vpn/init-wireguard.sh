#!/bin/bash

# WireGuard initialization script
echo "Initializing WireGuard configuration..."

# Create wireguard directory if it doesn't exist
sudo mkdir -p /etc/wireguard

# Copy template to config location
if [ ! -f /etc/wireguard/wg0.conf ]; then
    echo "Creating WireGuard config from template..."
    sudo cp ~/.config/vpn/wg0.conf.template /etc/wireguard/wg0.conf
    sudo chmod 600 /etc/wireguard/wg0.conf
    echo "Config created at /etc/wireguard/wg0.conf"
    echo "Edit it with: sudo nano /etc/wireguard/wg0.conf"
else
    echo "WireGuard config already exists at /etc/wireguard/wg0.conf"
fi

echo ""
echo "To generate keys:"
echo "  wg genkey | tee privatekey | wg pubkey > publickey"
echo ""
echo "To control VPN:"
echo "  sudo wg-quick up wg0    # connect"
echo "  sudo wg-quick down wg0  # disconnect"
echo "  wg show                 # check status"
