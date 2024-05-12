#!/bin/bash

RANDOM_VALUE=$(shuf -i 200-500 -n 1)

# calculate total backup times by seconds
BACKUP_SUM=$(grep "^BACKUP_SUM=" /tmp/backup_data.txt | awk -F "=" '{print $2}')
if [ -z "$BACKUP_SUM" ]; then
    BACKUP_SUM=0
fi

# calculate count backup time
BACKUP_COUNT=$(grep "^BACKUP_COUNT=" /tmp/backup_data.txt | awk -F "=" '{print $2}')
if [ -z "$BACKUP_COUNT" ]; then
    BACKUP_COUNT=0
fi

# addition fake data
NEW_BACKUP_SUM=$((BACKUP_SUM + RANDOM_VALUE))
NEW_BACKUP_COUNT=$((BACKUP_COUNT + 1))

export PATH=$PATH:/sbin:/usr/sbin
IP_HOST=$(ip addr show enp0s8 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
echo $IP_HOST
# {job="pushgateway",instance="192.168.56.xxx"}
echo "mysql_backup_latency_by_seconds_sum $NEW_BACKUP_SUM" | curl --data-binary @- http://localhost:9091/metrics/job/pushgateway/instance/$IP_HOST
echo "mysql_backup_latency_by_seconds_count $NEW_BACKUP_COUNT" | curl --data-binary @- http://localhost:9091/metrics/job/pushgateway/instance/$IP_HOST

# override variable
sed -i "s/BACKUP_SUM=$BACKUP_SUM/BACKUP_SUM=$NEW_BACKUP_SUM/" /tmp/backup_data.txt
sed -i "s/BACKUP_COUNT=$BACKUP_COUNT/BACKUP_COUNT=$NEW_BACKUP_COUNT/" /tmp/backup_data.txt
