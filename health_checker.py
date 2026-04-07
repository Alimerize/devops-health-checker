import shutil
import subprocess

total, used, free = shutil.disk_usage("/")
free_gb = free // (2**30)

result = subprocess.run(["systemctl", "is-active", "nginx"] , capture_output=True, text=True)
status = result.stdout.strip()


