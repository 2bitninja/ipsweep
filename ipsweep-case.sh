#!/bin/bash
# Created ipsweep to search for IP address.
# Usage  ./ipsweep.sh 192.168.1

if [ -z "$1" ]
then    echo "You forgot an ip address!"
        echo "Syntax ./ipsweep.sh -p 192.168.1"
        exit 0
fi

while getopts "hvp:" option
do case ${option} in
        p)  for ip in $(seq 1 10 )
        do ping -c1 $OPTARG.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" |tee -a iplist.txt
        done
        echo -e "\nComplete. Results can be found in the file iplist.txt"
        ;;
        h) echo -e "Help Message\n--------------------\n-h, Shows this Message"
        echo -e "-v, gives version\n-p, [network] "
        ;;
        v) echo "version number"
        ;;
        \?) echo -e "you have entered an invalid option\n Usage ./ipsweep.sh -p 192.168.1"
                echo -e " ./ipsweep.sh [-p] [-h] [-v] "
        ;;
esac
done

