# Process Monitoring Script

This is a simple Bash script that checks whether a specific process is running on a Linux system. The script allows you to monitor any process by passing the process name as an argument. If the process is running, the script will output a confirmation message with the current date and time. If the process is not running, the script will notify you that the process is inactive.

## Features:
- Monitors a process by name.
- Displays the status of the process (whether it's running or not).
- Outputs the date and time when the check is performed.

## How to Use:
1. **Download or Clone the Script:**
   - You can either download or clone this script to your system.

2. **Make the script executable:**
   After downloading or cloning the script, navigate to the script directory and run the following command to make the script executable:
   ```bash
   chmod +x process_tracker.sh
   ```

3. **Run the script:**
   Execute the script by providing the name of the process you want to monitor. For example, to check if `nginx` is running, run:
   ```bash
   ./monitor_process.sh nginx
   ```

   Replace `nginx` with any other process name you want to check.

## How It Works:

- The script first checks if a process name is provided by the user (`$1`).
- It then uses `pgrep` to search for processes that match the provided name.
- If the process is running, it outputs the message "Process is running" along with the current date and time.
- If the process is not running, it outputs the message "Process is not running" along with the current date and time.

### Key Commands in the Script:

To help understand the script better, it's useful to explain the functioning of some commands that might cause confusion. Below are the key commands used in the script:

#### 1. **`pgrep "$1"`:**
   - `pgrep` is a command that searches for processes based on the name (or other attributes) provided. 
   - The `$1` is a positional parameter that represents the **first argument** passed to the script. For example, if you run the script like this: `./monitor_process.sh nginx`, `$1` would be `nginx`, so `pgrep` would search for any process whose name contains "nginx".
   - If a process with that name is found, `pgrep` returns its process IDs (PIDs).

#### 2. **`&>`:**
   - The `&>` operator is used for **redirecting both standard output (stdout) and standard error (stderr)** to a specified location.
   - In this case, `&> /dev/null` redirects the output (both normal and error messages) to **`/dev/null`**, effectively discarding it. This ensures that the script does not display any output from `pgrep`, only the result of whether the process exists or not.
   - Example: `pgrep "$1" &> /dev/null` ensures that no output from `pgrep` is shown in the terminal, and it only checks if the process is running.

#### 3. **`if [ -z "$1" ]`:**
   - This checks if the first argument (`$1`) is **empty**. If no argument is provided, the script will notify the user and exit.
   - `-z` is a condition that checks if the string length is zero, meaning no argument was passed.

