### creating directory structure 

<img src="t1.png">

### solution 

```
[test@ip-172-31-43-251 ~]$ mkdir  -p   ashuA/{b/{e/{j,i},f/j},c/g/k,d/h/k}
[test@ip-172-31-43-251 ~]$ tree  ashuA/
ashuA/
├── b
│   ├── e
│   │   ├── i
│   │   └── j
│   └── f
│       └── j
├── c
│   └── g
│       └── k
└── d
    └── h
        └── k

12 directories, 0 files

```

### task 2 

```
    1. create a shell script named  hello.sh under /tmp/ location  by using <linuxexam> user
    2. make sure you are able to run script like "/tmp/hello.sh"
    3. now from <linuxexam> user when you run a shell script like "/tmp/hello.sh linux" this it must perform below given operation
    4. it must create 3 files named  a.txt , b.txt , c.txt under home directory of <linuxexam> user
    5. now  from <linuxexam> user when you run a shell script like "/tmp/hello.sh docker" this it must perform below given operation
    6. it must create 3 directories named , aa , bb , cc make sure there is no error printing if they are already existing
    7. now if you run the same shell scripting from <exam1> user this script must work as it is 
    8. finally run this script again from. <linuxexam> user like "/tmp/hello.sh root" it must print below given things 
    9. output of that program must be all those lines  from /etc/passwd file which contain root and bash  keywords

```