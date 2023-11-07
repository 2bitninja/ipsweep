#!/bin/bash
# Created ipsweep to search for IP address.
# Usage  ./ipsweep.sh 192.168.1

#case $1 in
while getopts "hv" option
do case ${option} in 
    h)
        printf '%s\n' 'foo command help:
-h, --help: Show this help
-q, --quiet: Run without diagnostics
-v, --verbose: Add extra diagnostics'
        exit 0
        ;
    v) echo -e "This is version 0.0.01"
        ;;
esac
done

if [ -z "$1" ]
then    echo "You forgot an ip address!"
	echo "Syntax ./ipsweep.sh 192.168.1"
        exit 0
else

for ip in $(seq 1 2 )
	do ping -c1 $1.$ip |grep "64 bytes"|cut -d " " -f4 |tr -d ":" |tee -a iplist.txt
done
fi
echo -e "\nComplete. Results can be found in the file iplist.txt"
