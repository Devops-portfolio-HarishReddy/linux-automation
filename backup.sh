#!/bin/bash
set -euo pipefail

usage() {
  echo "Usage: $0 [source_dir] [backup_dir]"
  echo "Example: $0 /home/ubuntu/data /home/ubuntu/backups"
  exit 1
}

if [[ "$1" == "--help" || "$#" -ne 2 ]]; then
  usage
fi


SRC_DIR="/home/ubuntu/test_data"
BACKUP_DIR="/home/ubuntu/backups"
DATE=$(date +%F)

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz"

# Delete old backups 

find "$BACKUP_DIR" -type f -mtime +7 -delete

echo "Backup completed and old backups removed."

