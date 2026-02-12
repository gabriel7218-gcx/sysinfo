#!/bin/sh                                                    
echo " _____         _____     ___     "
echo "|   __|_ _ ___|     |___|  _|___ "
echo "|__   | | |_ -|-   -|   |  _| . |"
echo "|_____|_  |___|_____|_|_|_| |___|"
echo "      |___| Made by Gabriel7218  "
echo ""
echo "Hostname: $(cat /proc/sys/kernel/hostname)"
echo "Kernel: $(uname -r)"
CPU=$(grep 'system type' /proc/cpuinfo 2>/dev/null | sed 's/.*: //')

if [ -z "$CPU" ]; then
    CPU=$(grep 'model name' /proc/cpuinfo | head -n1 | sed 's/.*: //')
fi

echo "CPU: $CPU"
echo "Architecture: $(uname -m)"
echo "Uptime: $(uptime | sed 's/.*up \([^,]*\),.*/\1/')"
echo "RAM: $(free -h | grep Mem | awk '{print $3 " / " $2}')"
echo "Free storage: $(if [ -d /overlay ]; then df -h /overlay; else df -h /; fi | awk 'NR==2 {print $4}')"
echo ""
