#!/bin/bash
# Created ipsweep to search for IP address.
# Usage  ./ipsweep.sh 192.168.1

if [ -z "$1" ]
 then echo "You forgot an ip address!"
      echo -e "Syntax ./ipsweep.sh 192.168.1\n"
      exit 0
 else
  echo -e "This will take some time. Please Wait...\n\tIP Address will appear below when found\n"
  echo -e "IP Adress \t Hostname" > iplist.txt
  
  #for ip in $(seq 1 14 )
  for ip in $(seq 1 254 )
	do ping -c1 $1.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" |tee -a iplist.txt
  done

  echo -e "\n"
  echo -e " IP Adress \t Hostname\n==========================" > systems.txt
  for n in $(cat iplist.txt )
     do echo -e "$n \t $(nslookup $n | grep name |cut -d " " -f 3)" | tee -a systems.txt
  done

fi
rm iplist.txt
echo -e "\nComplete. Results can be found in the file systems.txt"
