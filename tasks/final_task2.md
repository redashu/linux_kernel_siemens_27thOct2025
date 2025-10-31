# 🧩 TASK #2 — Linux System Monitoring Automation

## 🎯 Objective

You are required to design and schedule an automated system monitoring report generator using cron.
The script should collect various system statistics every 5 minutes and append the results to a report file at `/opt/cron/reports.txt`.

## 🧱 Requirements

Create a shell script in `/opt/cron/` that collects and stores:

- Top 5 processes consuming highest CPU and highest memory.
- RAM consumption details (private/shared) in human-readable format.
- Total number of users currently logged in via SSH.
- All failed SSH login attempts, including client IP and username (extract from system logs).
- Top 2 disk mount points consuming the most storage.

Each report entry should contain:

- A timestamp.
- Clear separation between different sections.
- All outputs appended, not overwritten.

Schedule the script using cron to run every 5 minutes.

Make sure the script and directory have proper permissions so it can be executed by cron.

Reports must be saved in `/opt/cron/reports.txt`.

## 🧠 Evaluation Criteria

- Proper use of Linux commands and filters (`ps`, `grep`, `awk`, `df`, `journalctl`, etc.).
- Correct and readable report formatting.
- Efficient cron scheduling without redundant executions.
- Clean, secure handling of logs and permissions.

## ⚙️ Deliverables

- Path of your script file
- Cron job entry line
- Screenshot or snippet of your `/opt/cron/reports.txt` output (showing at least two executions)

## 🧩 Optional Challenge

- Include detection of new failed SSH attempts only since the last run.
- Send the report via email or message once daily.
