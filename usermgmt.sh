#!/bin/bash
# user_mgmt.sh
set -euo pipefail
usage() {
  echo "Usage: $0 [csv_file]"
  echo "Example: $0 users.csv"
  exit 1
}

if [[ "$1" == "--help" || "$#" -ne 1 ]]; then
  usage
fi

FILE="$1"


if [[ ! -f "$FILE" ]]; then
  echo "CSV file not found! (Expected: users.csv)"
  exit 1
fi

while IFS=, read -r username password; do
  if id "$username" &>/dev/null; then
    echo "User $username already exists."
  else
    useradd -m "$username"
    echo "$username:$password" | chpasswd
    echo "User $username created."
  fi
done < "$FILE"

