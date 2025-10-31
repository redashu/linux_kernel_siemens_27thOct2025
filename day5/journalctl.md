# 🧠 1. What is journalctl?

`journalctl` is the CLI interface to systemd-journald, the logging system that replaced the old-style `/var/log/*.log` setup on most modern Linux systems (RHEL 7+, CentOS 7+, Ubuntu 16+, etc.).

systemd-journald collects logs from:

- System services (like httpd, sshd, NetworkManager, etc.)
- Kernel messages
- User processes
- Boot process and hardware
- Custom scripts (like your apache-mon.service)

It stores them in binary journal files and indexes by:

`BOOT_ID`, `UNIT`, `PID`, `UID`, `GID`, `SYSLOG_IDENTIFIER`, `PRIORITY`, `MESSAGE`, etc.

## ⚙️ 2. Basic Usage — see everything
```bash
journalctl
```

Shows all logs from all boots, starting from oldest.

- Press `Space` to scroll down
- Press `q` to quit

## 🧭 3. View the latest logs
```bash
journalctl -r
```

Shows logs in reverse (newest first).

Or follow logs live (like `tail -f`):

```bash
journalctl -f
```

## 🕒 4. Filter by time
View logs since last boot:
```bash
journalctl -b
```

View logs from previous boot:
```bash
journalctl -b -1
```

Logs since specific time:
```bash
journalctl --since "2025-10-30 09:00:00" --until "2025-10-30 10:00:00"
```

Or more human-friendly:
```bash
journalctl --since "2 hours ago"
journalctl --since yesterday
```

## 🔍 5. Filter by service / unit
### Apache (httpd)
```bash
journalctl -u httpd
```

Only logs related to the systemd service `httpd.service`

Add `-f` to follow live:

```bash
journalctl -u httpd -f
```

### SSH (sshd)
```bash
journalctl -u sshd
```

To see SSH logs during your last login attempt:

```bash
journalctl -u sshd --since "30 min ago"
```

## 💾 6. Filter by system components (kernel, storage, etc.)
### Kernel logs only
```bash
journalctl -k
```

### Storage / disks
```bash
journalctl | grep -E "sd[a-z]|nvme|mount|lvm"
```

or for specific LVM activity:

```bash
journalctl _COMM=lvm
```

For mount failures:

```bash
journalctl -p err | grep mount
```

## 🧩 7. Filter by priority/severity
| Priority Level | Name | Typical Usage |
|---|---|---|
| 0 | emerg | system unusable |
| 1 | alert | immediate action needed |
| 2 | crit | critical conditions |
| 3 | err | error conditions |
| 4 | warning | warning conditions |
| 5 | notice | normal but significant |
| 6 | info | informational |
| 7 | debug | debug messages |

Example: show only errors and critical issues

```bash
journalctl -p 0..3 -xb
```

or warnings and above:

```bash
journalctl -p warning
```

## 🧰 8. Filter by process or user
### By PID
```bash
journalctl _PID=1234
```

### By executable name (syslog identifier)
```bash
journalctl _COMM=httpd
journalctl _COMM=sshd
journalctl _COMM=mount
```

### By user (UID)
```bash
journalctl _UID=0      # root
journalctl _UID=1000   # normal user
```

## 🪣 9. Combine filters

You can mix multiple filters — this is where journalctl becomes really powerful.

Example:

```bash
journalctl -u httpd -p err --since today
```

👉 All Apache errors from today.

Another:

```bash
journalctl _COMM=sshd _HOSTNAME=web1 --since "1 hour ago"
```

👉 SSH logs from host web1 for the last hour.

## 🧾 10. Output control
### Show logs in human-readable format (default)
```bash
journalctl -u httpd
```

### Show compact output (great for scripting)
```bash
journalctl -u httpd --no-pager --output=short
```

### Show only the message field (remove metadata)
```bash
journalctl -u httpd -o cat
```

### Export logs to a text file
```bash
journalctl -u httpd --since yesterday > /tmp/httpd.log
```

## 🧱 11. Managing journal storage
### Check disk space used by journal
```bash
journalctl --disk-usage
```

### Limit journal size
```bash
sudo journalctl --vacuum-size=200M
```

### Delete logs older than 1 week
```bash
sudo journalctl --vacuum-time=1w
```

### Make logs persistent (so they survive reboot)
```bash
sudo mkdir -p /var/log/journal
sudo systemctl restart systemd-journald
```

## 🔒 12. Viewing logs from boot time / system startup

When debugging boot issues:

```bash
journalctl -b -p err
```

→ shows all errors from this boot.

Or for a specific boot (older):

```bash
journalctl --list-boots
journalctl -b -2
```

## ⚡ 13. Real-world use cases
### 🔹 Use Case 1 — Apache (httpd)

Check startup issues:

```bash
journalctl -u httpd -b -p err
```

Follow live requests/errors:

```bash
journalctl -u httpd -f
```

### 🔹 Use Case 2 — SSH Login tracking

List all SSH logins today:

```bash
journalctl -u sshd --since today | grep "Accepted"
```

Failed logins:

```bash
journalctl -u sshd | grep "Failed password"
```

### 🔹 Use Case 3 — Disk / Storage problems

Find mount failures:

```bash
journalctl -p err | grep mount
```

LVM volume events:

```bash
journalctl _COMM=lvm
```

File system corruption messages:

```bash
journalctl -k | grep -i ext4
```

## 🧮 14. Advanced filtering (boot & user mix)

Example: show all SSH logins by a specific user since reboot:

```bash
journalctl -u sshd _UID=1000 -b
```

## 🪶 15. Integration with other tools
| Task | Example |
|---|---|
| Export to text | `journalctl -u httpd > /tmp/httpd.log` |
| Export to JSON | `journalctl -u httpd -o json-pretty` |
| View in live monitoring | `journalctl -fu sshd` |
| Combine with grep | `journalctl -b | grep error` |

## 🚀 16. Daily workflow examples (DevOps style)

✅ **Apache debug**

```bash
journalctl -u httpd -p err --since "30 min ago"
```

✅ **SSH brute-force detection**

```bash
journalctl -u sshd | grep "Failed password" | wc -l
```

✅ **Storage or LVM issue investigation**

```bash
journalctl -k -p err | grep -E "sd|nvme|lvm|xfs|ext4"
```

✅ **Check your own monitoring service**

```bash
journalctl -u apache-mon -f
```

## 🧾 TL;DR Summary
| Category | Command | Description |
|---|---|---|
| Basic logs | `journalctl` | All logs |
| Service | `journalctl -u httpd` | Logs from a systemd unit |
| Live tail | `journalctl -fu sshd` | Live logs |
| Time filter | `--since "1 hour ago"` | Filter by time |
| Severity filter | `-p err` | Show only errors |
| Storage check | `--disk-usage` | Journal space |
| Export | `> file.log` or `-o json-pretty` | Save logs |
| Cleanup | `--vacuum-time=1w` | Delete old logs |