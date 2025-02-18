# Incremental Backup Script

This script performs **incremental backups** of files from a specified source directory, saving only new or modified files since the last backup. The backup files are stored in `.tar.gz` format and organized by date and time.

## 📌 Features

- **Detects** new or modified files since the last backup.
- **Creates** compressed `.tar.gz` archives with timestamps.
- **Prevents** file duplication to optimize storage space.
- **Automatically** creates the backup directory if it does not exist.

## 📂 Directory Structure

```
/path/to/source/directory      # Directory containing files to be backed up
/path/to/backup/directory      # Directory where backup files will be stored
    ├── incremental_backup_YYYY-MM-DD_HH-MM-SS.tar.gz
    ├── incremental_backup_YYYY-MM-DD_HH-MM-SS.tar.gz
    └── ...
```

## How to Use
### 1. Setup

1. Open the script in a text editor:
   ```bash
   nano backup_script.sh
   ```
2. Modify the following variables to match your system:
   ```bash
   source_dir="/path/to/source/directory"
   backup_dir="/path/to/backup/directory"
   ```

### 2. Grant Execution Permission

Before running the script, make sure it has execution permissions:
```bash
chmod +x backup_script.sh
```

### 3. Run the Script

Execute the script to start the backup process:
```bash
./backup_script.sh
```

### 4. Automate with Cron (Optional)

To schedule the backup script to run daily at 2 AM, add the following line to your crontab (`crontab -e`):
```bash
0 2 * * * /path/to/backup_script.sh
```
The cron expression is made up of five fields that represent the following time units:

    - Minute (0): The script will run when the minute is 0 (i.e., at the top of the hour).
    - Hour (2): The script will run at 2 AM.
    - Day of the Month (*): The asterisk (*) means the script will run every day of the month.
    - Month (*): The asterisk (*) means the script will run every month of the year.
    - Day of the Week (*): The asterisk (*) means the script will run on every day of the week.

## 🛠 Troubleshooting

- **Error:** `The source directory does not exist.`
  - Check if the directory path is correct.
  - Ensure you have read permissions.

- **No new or modified files found**
  - The script only backs up changed files. If no changes exist, it skips the backup.

