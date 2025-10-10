# Day1 - Linux Basics
Commands praticed:  pwd, ls, cd, mkdir, touch, cat, chmod, ps, apt, ping
# Day2 - File Permissions
rwx is a shorthand for the three main types of file permissions in Unix-like OS: read(r). write(w), and execute (x). chmod - change file permissions. chown - change file ownership. umask- sets the user file-creation mask, which determines the default permissions for new files and directories.
# Day3 - Linux Process & Jobs
commands learned : ps aux,ps -ef,top,htop, kill, jobs, bg, fg, nohup, disown, nice.
Topics learner: foreground and background processes, cron Expressions and process priority
Bulit a script that monitors a process and auto-restarts if crashes.
# Day4 - Linux Users & Groups Permissions
-rw-r--r-- → permissions
root → owner
root → group
commands: chmod, chgrp, chown.
# Day5 - Networking Referesher Linux
commands: ifconfig, ip a, netstat, nc, iproute, tracert, ss -tulnp.
Real time issue faced: I encountered a network issue during testing when I intentionally moved the /etc/resolv.conf file to a backup, which led to a "Temporary failure in name resolution" error. When attempting to move the file back, a typo caused it to be moved to an incorrect, unintended location. After clearing my terminal, I had no record of the exact move command. I resolved the issue by using a system-wide search to locate the file, which had been accidentally named /rresolv.conf and placed in the root directory. I then moved it back to /etc to restore network functionality.

# Day6 - Bash basics
Learned variable, aruguements, conditions and loops
created a sample basic script to understand how this work(cli_tool.sh)
then later taking this sample script I have created an example script (deployment_tool.sh)

# Day7 - Networking
commands - *Ping - Check if a host is reachable and measure round-trip time, example: deployed an app in AWS EC2 but can’t access it. Ping the EC2’s IP to confirm network reachability.
*traceroute - See the path packets take to a destination. example: Users in India report slow app access. You run traceroute → See traffic is taking 20 hops before reaching AWS US region → You suggest deploying closer in Mumbai region.
*netstat or ss -See open ports & active connections, netstat -tulnp
-t → TCP

-u → UDP

-l → Listening

-n → Show numbers, not names

-p → Show process using the port

example: Jenkins not accessible on :8080. Use netstat → See Jenkins is running but firewall blocks external access.

*curl - Interact with APIs & test web servers, example After deploying Nginx, run curl http://localhost to confirm server returns 200 OK.

*telnet - Test TCP connectivity to a specific port. example command: telnet google.com 80, real world scenario: Database not reachable from app. Run telnet db-host 3306 → Connection refused → Security group/firewall issue.

*nslookup or dig: Test DNS resolution. example: You added a new domain in Route53 but app isn’t reachable. nslookup myapp.com shows old IP → DNS propagation delay.

# Day 8 - User, group and permission management in linux

commands - groupadd, useradd, usermod

why permissions are important: In linux each files has permissions, permission decide who can read logs, edit config or deploy. 

Misconfigured permissions = downtime or security breach

# Day 9 - Text Tools

Commands: grep, sed, awk, cut, sort, uniq, tr, xargs

These text tools are your daily weapons for debugging logs, extracting metrics, filtering large outputs, creating quick reports, and building lightweight pipelines inside shell scripts and CI jobs.

grep — filter lines by pattern

sed — stream editor (substitute, delete, transform)

awk — field-based processing & reporting (powerful)

cut — cut columns by delimiter or position

sort — sort lines

uniq — collapse duplicate adjacent lines

tr — translate or delete characters

xargs — build & run commands from STDIN
