# linux_kernel_siemens_27thOct2025

### linux kernel info 

<img src="k1.png">

### Interfaces in Linux kernel options 

<img src="k2.png">

### How to connect a remote linux machine 

<img src="k3.png">

### connect linux remote host using ssh command 

```
humanfirmware@darwin  ~  ssh  test@13.204.188.206     
test@13.204.188.206's password: 
Register this system with Red Hat Insights: rhc connect

```

### user ID concepts with all kind of users in linux kernel 

<img src="u1.png">

### basic commands 

```
[test@ip-172-31-43-251 ~]$ pwd
/home/test
[test@ip-172-31-43-251 ~]$ mkdir  hello
[test@ip-172-31-43-251 ~]$ ls
hello
[test@ip-172-31-43-251 ~]$ rmdir  hello
[test@ip-172-31-43-251 ~]$ mkdir  hello{1..10}
[test@ip-172-31-43-251 ~]$ ls
hello1  hello10  hello2  hello3  hello4  hello5  hello6  hello7  hello8  hello9
[test@ip-172-31-43-251 ~]$ rmdir  hello{1..10}
[test@ip-172-31-43-251 ~]$ mkdir  hi ashu hello 
[test@ip-172-31-43-251 ~]$ ls
ashu  hello  hi
[test@ip-172-31-43-251 ~]$ rmdir  hi ashu hello 
[test@ip-172-31-43-251 ~]$ 

```

### tips

```
[test@ip-172-31-43-251 ~]$ x=10
[test@ip-172-31-43-251 ~]$ 
[test@ip-172-31-43-251 ~]$ echo x
x
[test@ip-172-31-43-251 ~]$ echo $x
10
[test@ip-172-31-43-251 ~]$ for i  in   ashu oke name   
> do
> mkdir  $i 
> done
[test@ip-172-31-43-251 ~]$ ls
ashu  name  oke
[test@ip-172-31-43-251 ~]$ for i  in   ashu oke name   ; do rmdir   $i ; done
[test@ip-172-31-43-251 ~]$ 

```

### more basic kernel and os related commands 

```
[ec2-user@ip-172-31-43-251 ~]$ uname 
Linux
[ec2-user@ip-172-31-43-251 ~]$ uname -r
5.14.0-570.22.1.el9_6.x86_64


[ec2-user@ip-172-31-43-251 ~]$ 
[ec2-user@ip-172-31-43-251 ~]$ 
[ec2-user@ip-172-31-43-251 ~]$ 
[ec2-user@ip-172-31-43-251 ~]$ host
hostid       hostname     hostnamectl  
[ec2-user@ip-172-31-43-251 ~]$ hostname
hostname     hostnamectl  


[ec2-user@ip-172-31-43-251 ~]$ hostnamectl 
 Static hostname: ip-172-31-43-251.ap-south-1.compute.internal
       Icon name: computer-vm
         Chassis: vm 🖴
      Machine ID: 1298f4adc3574559a95b357877b7d476
         Boot ID: 5110cd1c24e0499b8338ff24c6961c92
  Virtualization: xen
Operating System: Red Hat Enterprise Linux 9.6 (Plow)         
     CPE OS Name: cpe:/o:redhat:enterprise_linux:9::baseos
          Kernel: Linux 5.14.0-570.22.1.el9_6.x86_64
    Architecture: x86-64
 Hardware Vendor: Xen
  Hardware Model: HVM domU
Firmware Version: 4.11.amazon
[ec2-user@ip-172-31-43-251 ~]$ cat  /etc/os-release 
NAME="Red Hat Enterprise Linux"
VERSION="9.6 (Plow)"
ID="rhel"
ID_LIKE="fedora"
VERSION_ID="9.6"
PLATFORM_ID="platform:el9"
PRETTY_NAME="Red Hat Enterprise Linux 9.6 (Plow)"
ANSI_COLOR="0;31"
LOGO="fedora-logo-icon"
CPE_NAME="cpe:/o:redhat:enterprise_linux:9::baseos"
HOME_URL="https://www.redhat.com/"
DOCUMENTATION_URL="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9"
BUG_REPORT_URL="https://issues.redhat.com/"

REDHAT_BUGZILLA_PRODUCT="Red Hat Enterprise Linux 9"
REDHAT_BUGZILLA_PRODUCT_VERSION=9.6
REDHAT_SUPPORT_PRODUCT="Red Hat Enterprise Linux"
REDHAT_SUPPORT_PRODUCT_VERSION="9.6"
[ec2-user@ip-172-31-43-251 ~]$ 


```


### file editors in linux kernel 

<img src="ed1.png">


### some info about  vim editor shortcuts 

<img src="vim1.png">