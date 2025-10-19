#!/bin/bash

LOG_FILE="/var/log/deployment_tool.log"

show_help() {
    echo "Usage: $0 --env <dev|staging|prod> --action <deploy|start|stop>"
    echo "Example: $0 --env prod --action deploy"
}

ENV=""
ACTION=""

# Parse flags
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --env) ENV="$2"; shift ;;
        --action) ACTION="$2"; shift ;;
        --help) show_help; exit 0 ;;
        *) echo "Unknown option: $1"; show_help; exit 1 ;;
    esac
    shift
done

# Validate inputs
if [[ -z "$ENV" || -z "$ACTION" ]]; then
    echo "Error: Missing required flags." | tee -a $LOG_FILE
    show_help
    exit 1
fi

# Simulate actions
case $ACTION in
    deploy)
        echo "[$(date)] Deploying app to $ENV environment..." | tee -a $LOG_FILE
        # Example (real world, mocked here):
        # scp app.zip ec2-user@${ENV}_server:/var/www/
        ;;
    start)
        echo "[$(date)] Starting app in $ENV environment..." | tee -a $LOG_FILE
        # Example:
        # ssh ec2-user@${ENV}_server "systemctl start myapp"
        ;;
    stop)
        echo "[$(date)] Stopping app in $ENV environment..." | tee -a $LOG_FILE
        # Example:
        # ssh ec2-user@${ENV}_server "systemctl stop myapp"
        ;;
    *)
        echo "Error: Invalid action. Use deploy|start|stop" | tee -a $LOG_FILE
        exit 1
        ;;
esac
