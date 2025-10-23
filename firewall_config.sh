#!/bin/bash
# firewall_config.sh
set -euo pipefail

ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

echo "Firewall configured: only SSH allowed."
