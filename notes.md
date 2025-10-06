rwx is a shorthand for the three main types of file permissions in Unix-like OS: read(r). write(w), and execute (x).
 chmod - change file permissions.
 chown - change file ownership.
 umask- sets the user file-creation mask, which determines the default permissions for new files and directories.

Understand user, group, and permission management in Linux

Learn real-world DevOps use cases (EC2 log file access, Jenkins secret folders, Docker volumes, etc.)

Perform hands-on tasks that replicate what happens in real production servers

🔹 1. Why User Management Is Crucial in DevOps

In real DevOps environments:

EC2s, Jenkins agents, and Docker containers each run under different users

Permissions decide who can read logs, edit configs, or deploy apps

Misconfigured permissions = downtime or security breach

Example:

Jenkins job fails to deploy → reason: Permission denied while writing /var/www/app/config.json

🔹 2. Creating Users & Groups
➤ Create a new user and group
sudo groupadd devops
sudo useradd -m -s /bin/bash -g devops harish
sudo passwd harish


-m: creates a home directory

-s /bin/bash: sets the default shell

-g: assigns a group

👉 In DevOps — you often create service users like:

jenkins (runs CI jobs)

docker (runs containers)

ansible (runs automation scripts)

🔹 3. Checking User Info
id harish
groups harish
cat /etc/passwd | grep harish


👉 This helps verify which group or role a user belongs to (important for debugging permissions).

🔹 4. File Ownership & Permissions
➤ Check permissions:
ls -l /var/log/syslog


You’ll see something like:

-rw-r----- 1 syslog adm 12345 Oct 6 10:00 /var/log/syslog


This means:

syslog user owns it

adm group can read it

Others cannot

➤ Change ownership:
sudo chown harish:devops /var/log/process_monitor.log

➤ Change permissions:
sudo chmod 640 /var/log/process_monitor.log


Explanation:

6 = read + write (for owner)

4 = read (for group)

0 = no access (for others)

🔹 5. Real-World DevOps Scenarios
🧩 Scenario 1 — Jenkins log file access

Jenkins runs as user jenkins

Log directory /var/log/jenkins owned by root

Jenkins job fails with:

Permission denied: cannot write to /var/log/jenkins/job.log


Fix:

sudo chown -R jenkins:jenkins /var/log/jenkins

🧩 Scenario 2 — Docker container volume

App container mounts /app/data from host

Host folder owned by root, app runs as non-root
Fix:

sudo chown -R 1000:1000 /app/data


(Container user ID 1000 now owns the data folder.)

🧩 Scenario 3 — EC2 Application logs

Developer connects via SSH but can’t read /var/log/app

Logs owned by appuser
Fix:

sudo usermod -aG appuser developer


Now developer gets read access via group membership.

🔹 6. Hands-On Task for Day 8
🧭 Task Steps

Create two users:

sudo useradd -m devuser
sudo useradd -m opsuser


Create a shared group:

sudo groupadd devops_team


Add both users to this group:

sudo usermod -aG devops_team devuser
sudo usermod -aG devops_team opsuser


Create a shared log directory:

sudo mkdir /var/log/devops_logs
sudo chown root:devops_team /var/log/devops_logs
sudo chmod 770 /var/log/devops_logs


Switch user and test:

sudo su - devuser
touch /var/log/devops_logs/test1.log
sudo su - opsuser
touch /var/log/devops_logs/test2.log


✅ Both users in devops_team should have access — just like multiple Jenkins or EC2 service accounts working together.

🧠 Extra Tip: Managing Privileges

To give a user temporary sudo access, edit the sudoers file:

sudo visudo


Add:

harish ALL=(ALL) NOPASSWD: /bin/systemctl restart nginx


→ Now Harish can restart Nginx without full root access (common DevOps practice).

💡 End-of-Day Summary
Concept	Real-World Use
Users & Groups	Separate Jenkins/Docker/Ansible accounts
chown & chmod	Manage file and log permissions
sudoers	Granular control for automation scripts
Shared group access	Multiple services working together securely

