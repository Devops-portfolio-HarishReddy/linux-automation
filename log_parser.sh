#!/usr/bin/env bash
set -Eeuo pipefail

# Usage: log_parser.sh /path/to/access.log
LOG="${1:-/var/log/nginx/access.log}"
TOP_N="${2:-10}"

if [[ ! -f "$LOG" ]]; then
  echo "Log file not found: $LOG" >&2
  exit 2
fi

echo "Log Parser Report for: $LOG"
echo "Generated: $(date --rfc-3339=seconds)"
echo "----------------------------------------"

# 1) Top IPs
echo ""
echo "Top $TOP_N IPs:"
awk '{print $1}' "$LOG" | sort | uniq -c | sort -nr | head -n "$TOP_N"

# 2) Top Endpoints (extract request and then path)
echo ""
echo "Top $TOP_N Endpoints:"
awk -F'"' '{print $2}' "$LOG" | awk '{print $2}' | sort | uniq -c | sort -nr | head -n "$TOP_N"

# 3) Status code counts
echo ""
echo "Status codes (count):"
awk '{print $9}' "$LOG" | sort | uniq -c | sort -nr

# 4) 5xx errors details (count + sample lines)
echo ""
ERR5_COUNT=$(awk '$9 ~ /^5/ {print}' "$LOG" | wc -l)
echo "Total 5xx errors: $ERR5_COUNT"
if [[ "$ERR5_COUNT" -gt 0 ]]; then
  echo "Sample 5xx lines (first 10):"
  awk '$9 ~ /^5/ {print}' "$LOG" | head -n 10
fi

# 5) Top User Agents
echo ""
echo "Top $TOP_N User Agents:"
awk -F'"' '{print $6}' "$LOG" | sed 's/"/\\"/g' | sort | uniq -c | sort -nr | head -n "$TOP_N"

# 6) Unique visitor count (unique IPs)
echo ""
echo "Unique visitors (unique IPs):"
awk '{print $1}' "$LOG" | sort | uniq | wc -l

echo ""
echo "Report completed."

