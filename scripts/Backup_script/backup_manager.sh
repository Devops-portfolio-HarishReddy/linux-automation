#!/usr/bin/env bash
set -Eeuo pipefail

# === CONFIG ===
SOURCE_DIR="$HOME/test_data"         # folder to back up (change as needed)
BACKUP_DIR="$HOME/linux-automation/backups"
RETENTION_DAYS=7                   # keep backups for 7 days
DATE_STR=$(date +%F_%H-%M-%S)
ARCHIVE_NAME="backup_${DATE_STR}.tar.gz"
TMP_DIR="/tmp/backup_temp"

# === PREPARE ===
mkdir -p "$BACKUP_DIR" "$TMP_DIR"
echo "Starting backup for: $SOURCE_DIR"
echo "Backup will be stored in: $BACKUP_DIR/$ARCHIVE_NAME"

# === CREATE BACKUP ===
tar -czf "$TMP_DIR/$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
mv "$TMP_DIR/$ARCHIVE_NAME" "$BACKUP_DIR/"
echo "Backup created successfully."

# === VERIFY BACKUP ===
if tar -tzf "$BACKUP_DIR/$ARCHIVE_NAME" >/dev/null 2>&1; then
  echo "Verification OK: Archive integrity confirmed."
else
  echo "Verification FAILED: Archive corrupted!" >&2
  exit 1
fi

# === APPLY RETENTION POLICY ===
echo "Deleting backups older than $RETENTION_DAYS days..."
find "$BACKUP_DIR" -type f -mtime +"$RETENTION_DAYS" -name "*.tar.gz" -print -delete

echo "Backup completed successfully at $(date)"
