# ipsweep

The purpose of this script is to find what IP address are being used in a subnet. Basicly the script runs the ping command for each IP address and lists the devices that replyied to the ping request.

## How it works
Basicly the script runs the ping command for each IP address and lists the devices that replyied to the ping request. The script also looks up the DNS name of all the IP addresses it finds.
### Example
```bash
ipsweep.sh 192.168.1
```
### Example output
```bash
These are the active IP Address for 192.168.1
 IP Adress 	 Hostname
==========================
192.168.1.1 	 router.asus.com.
192.168.1.104 	 Samsung.
192.168.1.128 	 
192.168.1.136 	 
192.168.1.137 	 Joel.
192.168.1.143 	 MacBook-Pro.
192.168.1.169 	 
192.168.1.211 	 
192.168.1.36 	 

```
