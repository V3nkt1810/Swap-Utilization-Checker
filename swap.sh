#!/bin/bash
 
if [ -z "$1" ]; then
    echo "Usage: $0 vuser.txt"
    exit 1
fi
 
server_list=$1
 
if [ ! -f "$server_list" ]; then
    echo "File $server_list not found!"
    exit 1
fi
 
while IFS= read -r server_name; do
    echo "---------------------------------------------"
    echo "Checking swap utilization on $server_name"
    echo "---------------------------------------------"
    
    ssh -q $server_name '
    for pid in $(ps -e -o pid --no-headers); do
        swap=$(grep -H Swap /proc/$pid/smaps 2>/dev/null | awk "{sum+=\$2} END {print sum}")
        if [[ $swap -gt 0 ]]; then
            pname=$(ps -p $pid -o comm --no-headers)
            user=$(ps -p $pid -o user --no-headers)
            echo "$swap $pname $pid $user"
        fi
    done | sort -nrk1 | head -5 | while read swap pname pid user; do
        if [[ $swap -ge 1048576 ]]; then
            echo "User: $user | Process: $pname (PID: $pid) is using Swap: $(bc <<< "scale=2; $swap/1048576") GB"
        else
            echo "User: $user | Process: $pname (PID: $pid) is using Swap: $(bc <<< "scale=2; $swap/1024") MB"
        fi
    done
    '
    echo End "\n"
done < "$server_list"
