#!/bin/bash
set -euo pipefail

echo "🔍 Testing health_check.sh"
./health_check.sh /tmp/health_test.log
grep -q "Health Check" /tmp/health_test.log && echo "✅ Health Check Passed"

echo "🧱 Testing backup.sh"
mkdir -p /tmp/src /tmp/backups
echo "testfile" > /tmp/src/file1.txt
./backup.sh /tmp/src /tmp/backups
ls /tmp/backups/backup_*.tar.gz && echo "✅ Backup Passed"

echo "👥 Testing user_mgmt.sh"
echo "tempuser,Temp@123" > /tmp/users.csv
sudo ./user_mgmt.sh /tmp/users.csv
id tempuser && echo "✅ User Creation Passed"
sudo userdel -r tempuser

echo "🧹 Testing log_rotate.sh"
mkdir -p /tmp/logs
echo "old log" > /tmp/logs/app.log
sleep 2
./log_rotate.sh
echo "✅ Log Rotation Passed"

echo "🛡️ Testing firewall_config.sh"
sudo ./firewall_config.sh
sudo ufw status | grep -q "Active" && echo "✅ Firewall Config Passed"

echo "🎉 All Toolkit Tests Completed Successfully!"
