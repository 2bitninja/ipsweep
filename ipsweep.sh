#!/bin/bash
# created to search for IP address.
if [ -z "$1" ]
then    echo "You forgot an ip address!"
	echo "Syntax ./ipsweep.sh 192.168.1"
else
	for ip in $(seq 1 254 )
	do ping -c1 $1.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" |tee -a iplist.txt
done
fi
echo -e "\nComplete. Results can be found in the file iplist.txt"
