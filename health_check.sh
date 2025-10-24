#!/bin/bash
set -euo pipefail
usage() {
  echo "Usage: $0 [output_log]"
  echo "Example: $0 /var/log/system_health.log"
  exit 1
}

if [[ "$1" == "--help" || "$#" -ne 1 ]]; then
  usage
fi

LOGFILE="$1"

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


