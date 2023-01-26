#### cronjab after reboot

        (pyATS) cloud-user@chn-jenkins-agent-1:~$ crontab -l
        @reboot sleep 50;/opt/prometheus-2.41.0.linux-amd64/prometheus &
        @reboot sleep 60;py_doc.sh

#### List cron tab
        crontab -l
        
#### edit cron tab
        crontab -e


https://stackoverflow.com/questions/49793799/how-to-avoid-setting-up-a-cron-if-already-there

        if crontab -l |  grep "0 2 [*] [*] [*] /usr/sbin/logrotate /etc/logrotate.conf"; then
            logger -s -t INODE_INIT "Logrotate (logrotate.conf) Cron job already exists"
        else
            (crontab -l; echo "$CRON_STR") | crontab -
            logger -s -t INODE_INIT "Logrotate (logrotate.conf) Cron job newly added to run @2PM everyday"
        fi
