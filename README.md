Description:
This repository provides a Bash script designed to monitor the swap memory utilization of processes on multiple Linux servers. It connects to each server via SSH, collects swap usage data, and lists the top 5 processes consuming the most swap memory. The script identifies high-swap-using processes and provides information such as the process name, PID, user, and the amount of swap memory used. It helps administrators quickly identify processes that may be causing memory issues due to excessive swap usage.

Key Features:

Multi-server Monitoring: Reads server names from a file and checks swap utilization on each server via SSH.
Top Swap Consumers: Identifies and reports the top 5 processes consuming the most swap memory on each server.
Human-readable Output: Converts swap memory usage to GB or MB for easier understanding.
User and Process Info: Displays details like process name, PID, and the user owning the process.
Easy-to-Use: Takes a text file of server names as an argument and automates the monitoring process.

Clone the repository:

git clone https://github.com/your-repo-name/swap-utilization-monitor.git
cd swap-utilization-monitor
Prepare a file with server names (one server name per line), e.g., vuser.txt.

Run the script with the server list as an argument:
./swap_monitor.sh vuser.txt
The script will SSH into each server, check the swap utilization of all processes, and display the top 5 processes consuming the most swap memory.

Example Output:
---------------------------------------------
Checking swap utilization on server1
---------------------------------------------
User: root | Process: apache2 (PID: 1234) is using Swap: 1.50 GB
User: mysql | Process: mysqld (PID: 5678) is using Swap: 0.75 GB
...
End

---------------------------------------------
Checking swap utilization on server2
---------------------------------------------
User: root | Process: java (PID: 9876) is using Swap: 2.20 GB
...
End

Requirements:
Linux-based systems: Designed for Unix/Linux environments with ssh and ps utilities available.
Access to Servers: SSH access to the target servers is required.

Dependencies: Basic Bash tools like ps, grep, and awk must be available on the servers being monitored.

Contributions:
Contributions and enhancements are welcome. Feel free to fork the repository and submit pull requests.

License:
This project is licensed under the MIT License – see the LICENSE file for details.

This description should work well for your Git repository, providing an overview of the script's purpose and usage. You can customize the repository name, server list file name, or any other details as per your needs.
