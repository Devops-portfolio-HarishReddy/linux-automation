#!/bin/bash
set -euo pipefail

log() {
  echo "[$(date '+%F %T')] $1" | tee -a /var/log/toolkit.log
}


usage() {
  echo "Usage: $0 [source_dir] [backup_dir]"
  echo "Example: $0 /home/ubuntu/data /home/ubuntu/backups"
  exit 1
}

if [[ "$1" == "--help" || "$#" -ne 2 ]]; then
  usage
fi


SRC_DIR="$1"
BACKUP_DIR="$2"
DATE=$(date +%F)
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SRC_DIR"
find "$BACKUP_DIR" -type f -mtime +7 -delete
log "Backup completed successfully."


