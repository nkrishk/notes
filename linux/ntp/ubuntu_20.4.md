
#### ntp for Ubuntu 20.4

    sudo apt-get install ntp
    
    sudo systemctl start ntp.service
    
    krishna@k-vm:~$ systemctl status ntp.service
    ● ntp.service - Network Time Service
         Loaded: loaded (/lib/systemd/system/ntp.service; enabled; vendor preset: enabled)
         Active: active (running) since Mon 2023-01-16 16:42:28 IST; 4s ago
           Docs: man:ntpd(8)
        Process: 60138 ExecStart=/usr/lib/ntp/ntp-systemd-wrapper (code=exited, status=0/SUCCESS)
       Main PID: 60147 (ntpd)
          Tasks: 2 (limit: 38529)
         Memory: 2.2M
         CGroup: /system.slice/ntp.service
                 └─60147 /usr/sbin/ntpd -p /var/run/ntpd.pid -g -u 132:138
    krishna@k-vm:~$
    
    sudo vi /etc/ntp.conf
