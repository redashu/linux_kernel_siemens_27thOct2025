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

