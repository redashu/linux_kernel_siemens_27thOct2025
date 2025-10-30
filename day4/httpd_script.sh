#!/usr/bin/bash


echo "checking apache user PID status.."
echo "________________________________"
echo "________________________________"
echo "________________________________"
sleep 2
ps -u apache  -o cmd,pid,ppid,%cpu,%mem


echo "finding parent PID of httpd"
echo "________________________________"
echo "________________________________"
echo "________________________________"

httpd_pid=`pidof httpd  | cut -d" " -f5`

echo $httpd_pid

echo "memory consumption by HTTPD "
echo "________________________________"
echo "________________________________"
echo "________________________________"
echo "________________________________"

ps_mem -p $httpd_pid
