#!/bin/bash
# log_rotate.sh
set -euo pipefail
LOG_DIR="/var/log/custom"
ARCHIVE_DIR="/var/log/custom/archive"
mkdir -p "$ARCHIVE_DIR"

find "$LOG_DIR" -type f -mtime +3 -exec gzip {} \; -exec mv {}.gz "$ARCHIVE_DIR" \;

echo "Old logs archived to $ARCHIVE_DIR"
