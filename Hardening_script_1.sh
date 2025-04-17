

\#\!/bin/bash

\# Variable for the report output file, choose an output file name  
REPORT\_FILE="hardening\_script1.sh”

\# Output the hostname  
echo "Gathering hostname..."  
\# Placeholder for command to get the hostname  
echo "Hostname: $(hostname)" \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Output the OS version  
echo "Gathering OS version..."  
\# Placeholder for command to get the OS version  
echo "OS Version: $(cat /etc/os-release)" \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Output memory information  
echo "Gathering memory information..."  
\# Placeholder for command to get memory info  
echo "Memory Information: $(free \-h)" \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Output uptime information  
echo "Gathering uptime information..."  
\# Placeholder for command to get uptime info  
echo "Uptime Information: $(uptime)" \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Backup the OS  
echo "Backing up the OS..."  
\# Placeholder for command to back up the OS  
*sudo tar \-cvpzf /baker\_street\_backup.tar.gz \--exclude=/baker\_street\_backup.tar.gz \--exclude=/proc \--exclude=/tmp \--exclude=/mnt \--exclude=/sys \--exclude=/dev \--exclude=/run /*

echo "OS backup completed." \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Output the sudoers file to the report  
echo "Gathering sudoers file..."  
\# Placeholder for command to output sudoers file  
echo "Sudoers file:$(sudo cat /etc/sudoers)" \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Script to check for files with world permissions and update them  
echo "Checking for files with world permissions..."

find /home \-type f \-perm 777 \-exec chmod 770 {} \\;

\# Placeholder for command to find and update files with world permissions  
echo "World permissions have been removed from any files found." \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Find specific files and update their permissions  
echo "Updating permissions for specific scripts..."

\# Engineering scripts \- Only members of the engineering group  
echo "Updating permissions for Engineering scripts."

\# Placeholder for command to update permissions

find /home  \-type f \-iname '\*engineering\*' \-exec chown :engineering {} \+  
           find /home \-type f  \-iname '\*engineering\*' \-exec chmod 770 {} \+ 

echo "Permissions updated for Engineering scripts." \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Research scripts \- Only members of the research group  
echo "Updating permissions for Research scripts..."  
\# Placeholder for command to update permissions

Find /home \-type f \-iname '\*research\*' \-exec chown :research {} \+  
           Find /home \-type f iname'\*research\*' \-exec chmod 770 {} \+ 

echo "Permissions updated for Research scripts" \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

\# Finance scripts \- Only members of the finance group  
echo "Updating permissions for Finance scripts"  
\# Placeholder for command to update permissions

find /home type f  \-iname '\*finance\*' \-exec chown :finance {} \+  
           Find /home type f  \-iname '\*finance\*' \-exec chmod 770 {} \+ 

echo "Permissions updated for Finance scripts." \>\> $REPORT\_FILE  
printf "\\n" \>\> $REPORT\_FILE

echo "Script execution completed. Check $REPORT\_FILE for details."

