#!/bin/bash
PROCESS="nginx"
if ! pgrep="$PROCESS" > /dev/null
then
	echo "$(date):$PROCESS not running, restarting...." >> /var/log/process_monitor.log
	sudo systemctl start $PROCESS
else
	echo "$(date):$PROCESS running." >> /var/log/process_monitor.log
fi
