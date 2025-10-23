#!/bin/bash
# toolkit.sh
set -euo pipefail

while true; do
  echo "========= Linux Automation Toolkit ========="
  echo "1. Run Health Check"
  echo "2. Run Backup"
  echo "3. Bulk User Creation"
  echo "4. Rotate Logs"
  echo "5. Configure Firewall"
  echo "6. Exit"
  echo "============================================"
  read -rp "Choose an option: " choice

  case $choice in
    1) ./health_check.sh ;;
    2) ./backup.sh ;;
    3) ./user_mgmt.sh ;;
    4) ./log_rotate.sh ;;
    5) ./firewall_config.sh ;;
    6) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option!" ;;
  esac
done
