rwx is a shorthand for the three main types of file permissions in Unix-like OS: read(r). write(w), and execute (x).
 chmod - change file permissions.
 chown - change file ownership.
 umask- sets the user file-creation mask, which determines the default permissions for new files and directories.

 #!/bin/bash

show_help() {
    echo "Usage: $0 --name <NAME> --env <ENV>"
    echo "Example: $0 --name harish --env dev"
}

NAME=""
ENV=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --name) NAME="$2"; shift ;;
        --env) ENV="$2"; shift ;;
        --help) show_help; exit 0 ;;
        *) echo "Unknown option: $1"; show_help; exit 1 ;;
    esac
    shift
done

echo "Deploying app for $NAME in $ENV environment..."

========================================================================================================================================

Imagine you’re a DevOps engineer.

You manage an app that runs on AWS EC2.

You need a simple tool to deploy, start, or stop the app in different environments (dev/staging/prod).

Instead of typing commands manually, you make a Bash CLI tool.


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


💡 Why This Matters (Real DevOps Skills)

Arguments (--env, --action) → same as Jenkins jobs (build --env=staging).

Logging to /var/log → like systemd services.

SSH/Deploy commands → exactly how you’d automate AWS EC2 or Docker container tasks.

Reusability → one script works for multiple environments.

