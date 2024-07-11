
#!/bin/bash
report="report.txt"

{ echo -e "CPU Usage"; mpstat; } | tee "$report"

 
{ echo -e "\nMemory Usage\n"; free -h; } | tee -a "$report"

{ echo -e "\nDisk Space\n"; df -h; } | tee -a "$report"

{ echo -e "\nNetwork Statistics\n"; ifconfig; } | tee -a "$report"
