
#### NTP demon

https://medium.com/@leandro.almeida/ntp-sync-your-centos-7-time-50339cf71758

    sudo yum  install ntp
    sudo systemctl start ntpd
    sudo systemctl enable ntpd
    firewall-cmd --permanent --add-service=ntp
    firewall-cmd --reload
    
    vim /etc/ntp.conf
    8.ntp.esl.cisco.com
    2.ntp.esl.cisco.com
    1.ntp.esl.cisco.com
