import shutil
import subprocess
from datetime import datetime  

total, used, free = shutil.disk_usage("/")
free_gb = free // (2**30)

result = subprocess.run(["systemctl", "is-active", "nginx"], capture_output=True, text=True)
status = result.stdout.strip()

timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
log_message = f"{timestamp} | Disk: {free_gb}GB | Nginx: {status}\n"

LOG_FILE = "/var/log/health_checker.log"

with open(LOG_FILE, "a") as f:  
    f.write(log_message)

print("Запись в лог успешно выполнена!") 
