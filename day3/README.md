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
