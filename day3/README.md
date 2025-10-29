# linux_kernel_siemens_27thOct2025

### ACL 

<img src="acl1.png">

### commands of ACL 

```
root@ip-172-31-40-92 ~]# ls -ld /OK/
drwxrwx--T+ 2 root tech 6 Oct 29 04:36 /OK/
[root@ip-172-31-40-92 ~]# 
[root@ip-172-31-40-92 ~]# setfacl  -m  g:manager:wx  /OK/ 
[root@ip-172-31-40-92 ~]# getfacl /OK/
getfacl: Removing leading '/' from absolute path names
# file: OK/
# owner: root
# group: tech
# flags: --t
user::rwx
user:u3:r-x
group::rwx
group:manager:-wx
mask::rwx
other::---


===>

setfacl -x u:u3  /bin/mkdir  

setfacl -b  /bin/mkdir  
```

### CronJOBS 

<img src="cron1.png">

### status of crond 

```
 systemctl status crond
● crond.service - Command Scheduler
     Loaded: loaded (/usr/lib/systemd/system/crond.service; enabled; preset: enabled)
     Active: active (running) since Wed 2025-10-29 04:34:36 UTC; 1h 25min ago
   Main PID: 1165 (crond)
      Tasks: 2 (limit: 48572)
     Memory: 2.2M
        CPU: 1.240s
     CGroup: /system.slice/crond.service

```
### some crontab commands 

```
[root@ip-172-31-40-92 ~]# crontab  -l 
no crontab for root
[root@ip-172-31-40-92 ~]# crontab -u u3  -l 
no crontab for u3
[root@ip-172-31-40-92 ~]# 


```
### crontab file 

```
cat /etc/crontab 
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin
MAILTO=root

# For details see man 4 crontabs

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed

```


### remote copy 

<img src="rc.png">

### using scp 

```
scp  -i  Downloads/ashu-delvex.pem     a.py   ec2-user@13.201.121.49:/home/ec2-user/
a.py                                                                                                     100%  237     5.2KB/s   00:00    
 humanfirmware@darwin  ~  scp    a.py   test@13.201.121.49:/tmp/          
test@13.201.121.49: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).
scp: Connection closed
 ✘ humanfirmware@darwin  ~  scp    a.py   test@13.201.121.49:/tmp/
test@13.201.121.49's password: 
a.py                                                 

```

### software installer 

```
  rpm  -q   vim 
   80  rpm  -q   date
   81  rpm  -q   httpd
   82  dnf install httpd -y &>/dev/null 
   83  rpm  -q   httpd
   84  rpm  -qi   httpd
   85  rpm  -ql   httpd
   86  rpm  -qc  httpd
   87  rpm  -ql   httpd
   88  history 
   89  rpm  -e   httpd
   90  dnf remove httpd 

```


### creating repo 

```
root@ip-172-31-40-92 yum.repos.d]# cd /etc/yum.repos.d/
[root@ip-172-31-40-92 yum.repos.d]# ls
el.repo  redhat-rhui-beta.repo.disabled  redhat-rhui-client-config.repo  redhat-rhui-eus.repo.disabled  redhat-rhui.repo
[root@ip-172-31-40-92 yum.repos.d]# 
[root@ip-172-31-40-92 yum.repos.d]# 

vim ashu.repo 

```


