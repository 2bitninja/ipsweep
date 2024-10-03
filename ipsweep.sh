#!/bin/bash
# Created ipsweep to search for active IP addresses on a subnet.
# Usage: ./ipsweep.sh 192.168.1
# 20240927: Backgrounded ping commands to greatly increase script speed, removed tee command for simplicity.

# Check if the user provided a subnet
if [ -z "$1" ]; then 
    printf "You forgot an IP address!\n"
    printf "Syntax: ./ipsweep.sh 192.168.1\n\n"
    exit 1
fi

# Get the current date and time to append to the output filename
timestamp=$(date +"%Y%m%d_%H%M%S")

# Define the output file variable
output_file="systems_$timestamp.txt"

# Notify user of the subnet being scanned
printf "\nScanning active IP Addresses in the subnet %s\n\n" "$1"
printf "Please wait, this may take a few moments...\n\n"

# Prepare the output file with a header
printf " IP Address \t Hostname\n==========================\n" > "$output_file"

# Create a list of active IP addresses by pinging all possible hosts in the subnet
for ip in $(seq 1 254); do
    # Ping each IP address once and check if it's alive by looking for the "64 bytes" response
    if ping -c1 "$1.$ip" | grep -q "64 bytes"; then
        # Resolve hostname and write to the output file if the IP is alive
        printf "%s \t %s\n" "$1.$ip" "$(nslookup "$1.$ip" | grep name | cut -d ' ' -f 3)" >> "$output_file"
    fi &
done

# Wait for all backgrounded ping processes to finish
wait

# Display the sorted results
sort -n "$output_file" | cat
