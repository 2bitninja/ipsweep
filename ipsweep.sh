#!/bin/bash
# Created ipsweep to search for IP address.
# Usage  ./ipsweep.sh 192.168.1
# 20240927 Brackgrounded ping commands which greatly increased script completion speed. Removed tee cmd. 

if [ -z "$1" ]
 then echo "You forgot an ip address!"
      echo -e "Syntax ./ipsweep.sh 192.168.1\n"
      exit 0
 else
  echo -e "\nThese are the active IP Address for $1\n"
  
  for ip in $(seq 1 254 )
	do ping -c1 $1.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" >> iplist.txt &
  done

  echo -e " IP Adress \t Hostname\n==========================" > systems.txt
  for n in $(cat iplist.txt )
     do echo -e "$n \t $(nslookup $n | grep name |cut -d " " -f 3)" >> systems.txt
  done

fi
rm iplist.txt
cat systems.txt|sort -n
