
#### ipv4 example

    oob-auto@oob-auto:~$ cat /etc/netplan/00-installer-config.yaml
    # This is the network config written by 'subiquity'
    network:
      ethernets:
        ens160:
          addresses:
          - 10.78.210.140/24
          gateway4: 10.78.210.1
          nameservers:
            addresses:
            - 64.104.123.245
            - 171.70.168.183
            - 173.36.131.10
            - 72.163.128.140
            search:
            - cisco.com
        ens192:
          addresses:
          - 192.168.100.140/24
          routes:
            - to: 101.105.0.0/16
              via: 192.168.100.254
            - to: 112.112.0.0/16
              via: 192.168.100.254
            - to: 113.113.0.0/16
              via: 192.168.100.254
            - to: 115.115.0.0/16
              via: 192.168.100.254
      version: 2
    oob-auto@oob-auto:~$
    
    
#### ipv6 example
