# Ipsweep

Ipsweep is a script designed to search for available IP space or to identify assets on a certain subnet. It helps network administrators and security professionals easily discover active devices within a network.

## Features
- Scans a specified subnet to find active IP addresses.
- Resolves DNS names for active IP addresses.
- Lists devices that responded to ping requests.

## Prerequisites
- Bash shell
- `ping` command
- `nslookup` command

## Installation
To install Ipsweep, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/2bitninja/ipsweep.git
   ```
Navigate to the directory:

cd ipsweep

Make the script executable:

chmod +x ipsweep.sh

## Usage
To use the Ipsweep script, run the following command:
   ```bash
   ipsweep.sh <subnet>
   ```
Replace <subnet> with the desired subnet to scan (e.g., 192.168.1).
## Example
   ```bash
   ipsweep.sh 192.168.1
   ```
### Output
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


## Contributing
We welcome contributions! Please read our [Contributing Guidelines](CONTRIBUTING.md) for more information.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
