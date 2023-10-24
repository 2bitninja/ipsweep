#!/bin/bash
# created to search for IP address.

rm iplist.txt 2>/dev/null
if [ -z "$1" ]
then    echo "You forgot an ip address!"
	echo "Syntax ./ipsweep.sh 192.168.1"
else
	#for ip in $(seq 1 254 )
	for ip in $(seq 1 8 ) # use this line for testing
	#do ping -c1 $1.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" |tee -a iplist.txt
	#do echo -e "$(ping -c1 $1.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":")\t $(nslookup $1.$ip|grep -v find|cut -d = -f2)"|tee -a iplist.txt
	do echo -e "$(ping -c1 $1.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":")\t $(nslookup $1.$ip|cut -d = -f2)" |tee -a iplist.txt
done
fi
echo -e "\nComplete. Results can be found in the file iplist.txt"
