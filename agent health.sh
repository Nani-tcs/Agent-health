#!/bin/bash

# Define subnet
SUBNET="192.168.1.0/24"

# Path to your health check script
HEALTH_CHECK_SCRIPT="/path/to/health_check.sh"

# SSH username for the agents
USER="your-username"

# Discover live hosts in the subnet using nmap
LIVE_HOSTS=$(nmap -sn $SUBNET | grep "Nmap scan report" | awk '{print $5}')

# Loop through each live host and run health check
for IP in $LIVE_HOSTS
do
    echo "Running health check on $IP..."
    ssh $USER@$IP 'bash -s' < $HEALTH_CHECK_SCRIPT
done
