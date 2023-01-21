## Ubuntu 14.4

#### TFTP tftpd-hpa  (tried) 

https://community.spiceworks.com/how_to/100006-install-and-configure-tftp-under-ubuntu-14-04

    sudo apt-get install tftpd-hpa
    sudo vim /etc/default/tftpd-hpa

        /etc/default/tftpd-hpa
        TFTP_USERNAME=tftp 
        TFTP_DIRECTORY=/tftpboot 
        TFTP_ADDRESS=0.0.0.0:69 
        TFTP_OPTIONS=-s -c -l

    sudo mkdir /tftpboot
    sudo chmod -R 777 /tftpboot 
    sudo chown -R nobody /tftpboot

    sudo service tftpd-hpa restart

#### TFTP tftpd ( not tried ) 

https://askubuntu.com/questions/581772/how-to-install-and-configure-a-tftp-server-on-14-04

Install following packages.

    sudo apt-get install xinetd tftpd tftp

Create ```/etc/xinetd.d/tftp```

    sudo vi /etc/xinetd.d/tftp

and put this entry

    service tftp
    {
    protocol        = udp
    port            = 69
    socket_type     = dgram
    wait            = yes
    user            = nobody
    server          = /usr/sbin/in.tftpd
    server_args     = /tftpboot
    disable         = no
    }
Create a folder ```/tftpboot``` this should match whatever you gave in server_args. mostly it will be ```tftpboot```

    sudo mkdir /tftpboot
    sudo chmod -R 777 /tftpboot
    sudo chown -R nobody /tftpboot
    Restart the xinetd service.

    sudo /etc/init.d/xinetd restart
    
You must allow udp port 69 in firewall.
