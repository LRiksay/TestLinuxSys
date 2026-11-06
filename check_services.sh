#!/bin/bash

LOG_FILE=/var/log/service_monitor.log
function check_service() {
local service_name="$1"
if systemctl is-active --quiet "$service_name"; then
echo "[OK] Service $service_name working" | tee -a "$LOG_FILE" 
else
echo"[ALERT] Service $service_name down! trying restart..." | tee -a "$LOG_FILE"

if systemctl restart "$service_name" &>> "$LOG_FILE"; then
echo "[SUCCESS] service $service_name success working" | tee -a "$LOG_FILE"
else
echo "[ERROR] service $service_name don't working, look log file" | tee -a "$LOG_FILE"
fi
fi
}

services="nginx ssh cron"

for srv in "$services"
do
check_service "$srv"
done

