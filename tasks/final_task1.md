# 🧩 TASK #1 — Web Hosting with LVM, Virtual Hosts, Logging, and Samba Integration

## 🎯 Objective

Design and deploy a multi-user web hosting environment using Apache HTTPD, LVM-based storage, and Samba file sharing — simulating how enterprise Linux servers handle user-isolated web apps.

## 🧱 Scenario

You are a Linux administrator at Siemens Bangalore.
You've been asked to prepare a small internal web-hosting environment for two users (user1 and user2) where:

- Each user hosts their own static web app under `/var/www/user1` and `/var/www/user2`.
- These directories are mounted on a dedicated LVM logical volume (5GB).
- Each site uses a separate VirtualHost with its own domain:
    - `www.user1.com`
    - `www.user2.com`
- Each site maintains its own log files within its document root.
- The sites' code should also be accessible from Windows clients via Samba.

## 🧰 Tasks to Perform

### Step 1 — LVM Setup

- Identify an available disk (e.g., `/dev/sdb`) and create a 5GB partition.
- Create:
    - A Physical Volume (PV)
    - A Volume Group (VG) (name it `vg_webdata`)
    - A Logical Volume (LV) (name it `lv_www`) of full size.
- Format it with ext4 and mount it persistently at `/var/www` using `/etc/fstab`.

### Step 2 — Directory and User Setup

- Create directories `/var/www/user1` and `/var/www/user2`.
- Inside each, create a subdirectory called `logs`.
- Create sample `index.html` pages for both users.
- Adjust permissions so that both users can manage their own folders securely.

### Step 3 — Apache Virtual Hosts

- Install and enable the httpd service.
- Configure two VirtualHosts:
    - `www.user1.com` → `/var/www/user1`
    - `www.user2.com` → `/var/www/user2`
- Configure separate error and access logs for each VirtualHost stored under `/var/www/userX/logs/`.
- Update `/etc/hosts` to simulate DNS locally for both domains.

**Example:**
```
127.0.0.1   www.user1.com www.user2.com
```

- Start and enable httpd service.

### Step 4 — Testing

- Use the curl command to access both:
    ```bash
    curl http://www.user1.com
    curl http://www.user2.com
    ```
- Verify responses and ensure each site's access logs capture the requests in their respective `logs/` directories.

### Step 5 — Journalctl and Log Extraction

- Use `journalctl` to display logs related to httpd.
- Extract entries related to the curl requests (using grep or `--since`) and redirect them into the corresponding user's log folder.

**Example:**
```
/var/www/user1/logs/journal-httpd.log
```

### Step 6 — Samba Configuration

- Install and configure Samba to share `/var/www`.
- Create a Samba user named `simens` with password `hello124`.
- Ensure the share:
    - Allows Windows clients to upload or modify files under their respective user directories.
    - Restricts access appropriately.
- Restart and enable smb services.

### Step 7 — Verification

- Access shares from a Windows system using:
    ```
    \\<linux_server_ip>\www
    ```
    (Authenticate with `simens` / `hello124`)
- Upload a file into user1's directory and verify it appears on the Linux side.

## 🧩 Expected Outcome

✅ A fully functional setup where:

- `/var/www` is on LVM storage.
- `www.user1.com` and `www.user2.com` serve distinct web apps.
- Logs are maintained and separated properly.
- Journal logs are filtered and stored back into web roots.
- Windows clients can access the same web roots via Samba securely.
