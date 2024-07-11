#!/bin/bash
logsFile="mylog.log"
    old_alerts=$(stat -c %s "$logsFile")
    while true; do
        new_alerts=$(stat -c %s "$logsFile")
        if [ "$new_alerts" -gt "$old_alerts" ]; then
            tail -c +"$old_alerts" "$logsFile" | egrep -o '(^error:|^warning:).*' | while read -r line; do
                echo "$line"
            done
            old_alerts="$new_alerts"
        fi
    done



