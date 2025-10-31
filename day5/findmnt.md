## 🔍 Basic Usage of findmnt 

### 1. View all mounted filesystems
```bash
findmnt
```

➡️ Shows a tree view of all current mounts (like disks, partitions, NFS, tmpfs, etc.)

**Example output:**
```
TARGET                    SOURCE         FSTYPE OPTIONS
/                         /dev/nvme0n1p2 ext4   rw,relatime
├─/boot/efi               /dev/nvme0n1p1 vfat   rw,relatime
├─/home                   /dev/nvme0n1p3 ext4   rw,relatime
└─/run/user/1000          tmpfs          tmpfs  rw,nosuid,nodev,relatime,size=163840k,mode=700,uid=1000,gid=1000
```

### 2. List output in a simpler format
```bash
findmnt -l
```

The `-l` (list) flag shows output in a flat list instead of a tree.

### 3. Show only device name, target (mount point), and filesystem type
```bash
findmnt -o SOURCE,TARGET,FSTYPE
```

This helps you focus only on key info:
```
SOURCE          TARGET       FSTYPE
/dev/nvme0n1p2  /            ext4
/dev/nvme0n1p1  /boot/efi    vfat
/dev/nvme0n1p3  /home        ext4
```

### 4. Find a specific mount point or device

You can search for a specific mount point or device:

```bash
findmnt /home
```

or

```bash
findmnt /dev/nvme0n1p3
```

### 5. View fstab entries (configured but not necessarily mounted)
```bash
findmnt --fstab
```

This reads from `/etc/fstab` — showing what's configured to mount at boot.

### 6. Show temporary (runtime) mounts only
```bash
findmnt --mtab
```

This shows what's currently mounted (reads from `/proc/self/mounts`).

## 🧠 Quick Summary Table

| Command | Description |
|---------|-------------|
| `findmnt` | Display all mounted filesystems (tree view) |
| `findmnt -l` | Flat list view |
| `findmnt -o SOURCE,TARGET,FSTYPE` | Custom columns |
| `findmnt /mount/point` | Show specific mount |
| `findmnt --fstab` | Show static fstab entries |
| `findmnt --mtab` | Show currently active mounts |

