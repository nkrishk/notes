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
