#!/usr/bin/bash


if  [  "$1" == "linux" ]
then
	touch  /home/linuxexam/{a.txt,b.txt,c.txt}


elif  [ "$1" == "docker" ]
then
	mkdir -p /home/linuxexam/{aa,bb,cc}


elif  [ "$1" == "root" ]
then
	grep -E 'root|bash'  /etc/passwd

fi 
