#!/bin/bash
set -euo pipefail
SRC_DIR="/home/ubuntu/test_data"
BACKUP_DIR="/home/ubuntu/backups"
DATE=$(date +%F)

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz"

# Delete old backups 

find "$BACKUP_DIR" -type f -mtime +7 -delete

echo "Backup completed and old backups removed."

