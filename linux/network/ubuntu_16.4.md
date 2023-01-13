https://www.snel.com/support/how-to-add-ipv6-on-ubuntu-16-04/

### systemctl restart networking.service

#### ipv4 and ipv6 static

    krishna@krishna-vm:~$ cat /etc/network/interfaces
    # interfaces(5) file used by ifup(8) and ifdown(8)
    auto lo
    iface lo inet loopback

    auto ens35
    iface ens35 inet static
          address 192.168.100.117
          netmask 255.255.255.0
          up route add -net 117.117.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 113.113.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 114.114.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 111.111.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 110.110.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 115.115.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 110.112.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 110.115.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 112.112.1.0 netmask 255.255.255.0 gw 192.168.100.254
          dns-nameservers 64.104.123.245 171.70.168.183 173.36.131.10 72.163.128.140

    iface ens35 inet6 static
          pre-up modprobe ipv6
          address fc00::3
          netmask 124
          gateway fc00::1
    krishna@krishna-vm:~$ cat /etc/network/interfaces.
    interfaces.backup  interfaces.d/
    krishna@krishna-vm:~$ cat /etc/network/interfaces.backup
    # interfaces(5) file used by ifup(8) and ifdown(8)
    auto lo
    iface lo inet loopback

    auto ens35
    iface ens35 inet static
          address 192.168.100.117
          netmask 255.255.255.0
          up route add -net 117.117.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 113.113.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 114.114.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 111.111.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 110.110.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 115.115.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 110.112.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 110.115.0.0 netmask 255.255.0.0 gw 192.168.100.254
          up route add -net 112.112.1.0 netmask 255.255.255.0 gw 192.168.100.254
          dns-nameservers 64.104.123.245 171.70.168.183 173.36.131.10 72.163.128.140

    iface ens35 inet6 static
          pre-up modprobe ipv6
          address fc00::3
          netmask 124
          gateway fc00::1

    auto ens34
    iface ens34 inet static
          address 192.168.159.150
          netmask 255.255.255.0

    iface ens34 inet6 static
          address 2002::c09f:9f03
          netmask 120
          gateway 2002::C09F:9F02
    krishna@krishna-vm:~$
