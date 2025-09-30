# Day1 - Linux Basics
Commands praticed:  pwd, ls, cd, mkdir, touch, cat, chmod, ps, apt, ping
# Day2 - File permissions
rwx is a shorthand for the three main types of file permissions in Unix-like OS: read(r). write(w), and execute (x). chmod - change file permissions. chown - change file ownership. umask- sets the user file-creation mask, which determines the default permissions for new files and directories.
# Day3 - Linux process & Jobs
commands learned : ps aux,ps -ef,top,htop, kill, jobs, bg, fg, nohup, disown, nice.
Topics learner: foreground and background processes, cron Expressions and process priority
Bulit a script that monitors a process and auto-restarts if crashes.
# Day4 - Linux Users & Groups permissions
-rw-r--r-- → permissions
root → owner
root → group
commands: chmod, chgrp, chown.
# Day5 - networking referesher linux
commands: ifconfig, ip a, netstat, nc, iproute, tracert, ss -tulnp.
Real time issue faced: I encountered a network issue during testing when I intentionally moved the /etc/resolv.conf file to a backup, which led to a "Temporary failure in name resolution" error. When attempting to move the file back, a typo caused it to be moved to an incorrect, unintended location. After clearing my terminal, I had no record of the exact move command. I resolved the issue by using a system-wide search to locate the file, which had been accidentally named /rresolv.conf and placed in the root directory. I then moved it back to /etc to restore network functionality.
