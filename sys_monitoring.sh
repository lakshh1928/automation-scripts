#!/bin/bash

set +x

{
echo "----- $(date) -----"
echo "CPU:"
top -bn1 | head -5 

echo " "

sleep 1

echo "Memory:"
free -h 

echo " "

sleep 1

echo "Disk:"
df -h 
} >> sys-report.txt
