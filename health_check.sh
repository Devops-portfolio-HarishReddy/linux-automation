#!/bin/bash
set -euo pipefail

LOGFILE="/var/log/system_health.log"

{

echo "===== Health Check - $(date) ====="
echo "CPU Load:"
uptime
echo
echo "Memomory Usage:"
free -h
echo
echo "Disk Usage"
df -hT
echo "==================================="
echo
} >> "$LOGFILE"

echo "Health report saved to $LOGFILE"


