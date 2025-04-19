#!/bin/bash
# Advanced Nmap Scanner Script

echo "Hello! This is an advanced nmap scanner!"

# Ask for network/subnet
read -p "Enter the network range to scan for hosts (e.g., 192.168.1.0/24): " subnet

# Discover hosts
sudo nmap -sn $subnet -oG - | awk '/Up$/{print $2}' > live_hosts.txt

echo "Hosts found:"
cat live_hosts.txt

# Ask user which host to scan
read -p "Enter an IP address from the list above: " ip_address

# Ask user if they want to scan custom ports or default to most common 1000 prts
read -p "Do you want to specify a port range (y/n): " custom_ports
if ["$custom_ports" == "y" ]; then
	read -p "Enter port range (e.g., 1-1000, or specific ports like 22,80,443): " ports
	port_option="-p $ports"
else
	port_options="--top-ports 1000"
fi

# Output a timestamped file
timestamp=$(date +"%Y%m%d_%H%M%S")
output_file="full_scan_${ip_address}_$timestamp.txt"

#Final Nmap scan w/ OS detection, service versioning, TCP + UDP
echo" Starting advanced Nmap scan on $ip_address..."
sudo nmap -sS -sU -sV -O $port_option $ip_address -oN $output_file

echo"Scan complete. Results saved to: $output_file"
