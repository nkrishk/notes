if [ x$1 == xconfig ]
then
    if [[ -f $2 ]]
    then
        while read line; do
            echo "scp log_delete_script.sh $line:~/log_delete_script"
            scp log_delete_script.sh $line:~/.
            sleep 5
            echo "Execute permisioon for the script"
            ssh -n $line 'chmod +x log_delete_script.sh;'
            sleep 5
            echo "Starting log delete script"
            ssh -n $line './log_delete_script.sh;'
        done < $2
    else
        echo "Error: File $2 not found"
    fi
    exit 0
fi
