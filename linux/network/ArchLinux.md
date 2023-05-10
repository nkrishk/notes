Network bring up 

    /etc/systemd/network/eth0.network


    [Match]
    Name=eth0

    [Network]
    Address=192.168.1.200/24
    Gateway=192.168.1.1
    DNS=192.168.1.1

https://unix.stackexchange.com/questions/738891/how-do-you-set-a-static-ip-address-on-arch-linux
