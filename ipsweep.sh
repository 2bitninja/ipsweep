#!/bin/bash
# Created ipsweep to search for IP address.
# Usage  ./ipsweep.sh 192.168.1

if [ -z "$1" ]
then    echo "You forgot an ip address!"
	echo -e "Syntax ./ipsweep.sh 192.168.1\n"
        exit 0
else
for ip in $(seq 1 14 )
	do ping -c1 $1.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" |tee -a iplist.txt
done
fi
echo -e "\nComplete. Results can be found in the file iplist.txt"
