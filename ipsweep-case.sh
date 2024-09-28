#!/bin/bash
# Created ipsweep to search for IP address.
# Usage  ./ipsweep.sh 192.168.1
# 20240927 Brackgrounded ping commands which greatly increased script completion speed. Removed tee cmd.

if [ -z "$1" ]
then    echo "You forgot an ip address!"
        echo "Syntax ./ipsweep.sh -p 192.168.1"
        exit 0
fi

while getopts "hvp:" option
do case ${option} in
        p) echo -e "\nThese are the active IP Address for $2\n"  
	#for ip in $(seq 1 10 )
	for ip in $(seq 1 254 )
        #do ping -c1 $OPTARG.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" |tee -a iplist.txt
        do ping -c1 $OPTARG.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" >> iplist.txt &
        done

	echo -e " IP Adress \t Hostname\n==========================" > systems.txt
	for n in $(cat iplist.txt )
	  do echo -e "$n \t $(nslookup $n | grep name |cut -d " " -f 3)" >> systems.txt
	done
        #echo -e "\nComplete. Results can be found in the file iplist.txt"
        ;;
        h) echo -e "Help Message\n--------------------\n-h, Shows this Message"
        echo -e "-v, gives version\n-p, [network] "
        ;;
        v) echo "version 0.0001"
        ;;
        \?) echo -e "you have entered an invalid option\n Usage ./ipsweep.sh -p 192.168.1"
                echo -e " ./ipsweep.sh [-p] [-h] [-v] "
        ;;
esac

done
rm iplist.txt
cat systems.txt|sort -n
