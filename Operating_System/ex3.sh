#!/bin/sh

echo $0 $1 $2 $3 $4 $5
echo "Number of arguments: $#"
echo "All arguments: $*"
echo "All arguments (as separate words): $@"
echo "Script name: $0"
echo "Exit status of the last command: $?"
echo "Current shell PID: $$"
echo "Current shell options: $-"
echo "Current shell environment variables:"
env | sort
echo "Current shell functions:"
declare -F
echo "Current shell aliases:"
alias | sort
echo "Current shell built-in commands:"
compgen -b | sort
echo "Current shell keywords:"
compgen -k | sort
echo "Current shell reserved words:"
compgen -r | sort
echo "Current shell variables:"
compgen -v | sort
echo "Current shell options:"
set | grep -E '^\w+=' | sort
echo "Current shell history:"
history | sort -n
echo "Current shell prompt variables:"
echo "PS1: $PS1"
echo "PS2: $PS2"
echo "PS3: $PS3"
echo "PS4: $PS4"
echo "Current shell locale settings:"
locale | sort
echo "Current shell timezone:"
echo $TZ
echo "Current shell terminal settings:"
stty -a
echo "Current shell process limits:"
ulimit -a
echo "Current shell resource limits:"
ulimit -aH
echo "Current shell disk usage:"
df -h
echo "Current shell memory usage:"
free -h
echo "Current shell CPU usage:"
top -b -n 1 | head -n 10
echo "Current shell network settings:"
ifconfig | sort
echo "Current shell routing table:"
netstat -rn | sort
echo "Current shell firewall settings:"
iptables -L | sort
echo "Current shell SELinux status:"
sestatus | sort
echo "Current shell AppArmor status:"
apparmor_status | sort
echo "Current shell system logs:"
dmesg | sort
echo "Current shell cron jobs:"
crontab -l | sort
echo "Current shell at jobs:"
atq | sort
echo "Current shell scheduled tasks:"
systemctl list-timers --all | sort
echo "Current shell services status:"
systemctl list-units --type=service --all | sort
echo "Current shell mount points:"
mount | sort
echo "Current shell file system types:"
cat /etc/fstab | sort
echo "Current shell user groups:"
groups $USER | sort
echo "Current shell user ID:"
id -u $USER
echo "Current shell group ID:"
id -g $USER
echo "Current shell user information:"
getent passwd $USER | sort
echo "Current shell group information:"
getent group $USER | sort
echo "Current shell user home directory:"
echo $HOME
echo "Current shell user shell:"
echo $SHELL
echo "Current shell user environment variables:"
env | grep "^$USER" | sort
echo "Current shell user aliases:"
alias | grep "^$USER" | sort
echo "Current shell user functions:"
declare -F | grep "^$USER" | sort
echo "Current shell user history:"
history | grep "^ *[0-9]*  $USER" | sort -n 