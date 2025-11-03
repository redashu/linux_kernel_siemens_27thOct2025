## Kernel Modules

### 🧩 Step 1 — View kernel and module info

Run:
```bash
uname -r
```

You'll get something like:
```
5.14.0-362.24.1.el9_3.x86_64
```

Now, list all available kernel modules for this kernel:
```bash
ls /lib/modules/$(uname -r)/kernel/
```

You'll see directories like:
```
arch  crypto  drivers  fs  kernel  net  sound
```

### 🧩 Step 2 — List currently loaded modules
```bash
lsmod | head -10
```

You'll see output similar to:
```
xfs                 999424  1
virtio_net           49152  0
virtio_blk           20480  2
virtio_pci           24576  0
virtio_ring          28672  3 virtio_net,virtio_blk,virtio_pci
```

> 🧠 These are virtio modules — they enable EC2 virtual hardware for networking and storage.
> Don't remove them! (critical for VM operation)

### 🧩 Step 3 — Pick a SAFE demo module

We'll use one that's always available but not required by EC2 runtime — for example:

- `loop` (used for loopback mounting ISO images)
- `dummy` (creates a fake network interface)

Let's check for loop:
```bash
lsmod | grep loop
```

If it's there, great! If not, insert it:
```bash
sudo modprobe loop
```

Confirm:
```bash
lsmod | grep loop
```

### 🧩 Step 4 — Remove and reload it

Remove:
```bash
sudo rmmod loop
```

Check kernel log:
```bash
dmesg | tail -n 5
```

You'll see a message like:
```
[  123.456789] loop: module unloaded
```

Reinsert it:
```bash
sudo modprobe loop
dmesg | tail -n 5
```

Now it shows:
```
[  130.789012] loop: module loaded
```

### 🧩 Step 5 — Get module details
```bash
modinfo loop
```

You'll see:
```
filename:       /lib/modules/5.14.0-362.24.1.el9_3.x86_64/kernel/drivers/block/loop.ko.xz
description:    Loopback block device
author:         Jens Axboe
license:        GPL
srcversion:     7D9A3F4B5E2F21...
```

### 🧩 Step 6 — (Optional) Write a Tiny Custom Module

If you want to impress them 💥

Create a file:
```bash
cat << 'EOF' > hello_module.c
#include <linux/module.h>
#include <linux/kernel.h>

int init_module(void) {
    printk(KERN_INFO "Hello Siemens kernel module loaded!\n");
    return 0;
}

void cleanup_module(void) {
    printk(KERN_INFO "Goodbye Siemens kernel module unloaded!\n");
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("ashu");
MODULE_DESCRIPTION("Simple demo module for training");
EOF
```

Create a simple Makefile:
```bash
cat << 'EOF' > Makefile
obj-m += hello_module.o

all:
    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
    make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
EOF
```

Build it:
```bash
sudo dnf install -y kernel-devel make gcc
make
```

Insert module:
```bash
sudo insmod hello_module.ko
```

Check kernel logs:
```bash
dmesg | tail -n 5
```

You'll see:
```
[  85.234567] Hello Siemens kernel module loaded!
```

Remove it:
```bash
sudo rmmod hello_module
dmesg | tail -n 5
```