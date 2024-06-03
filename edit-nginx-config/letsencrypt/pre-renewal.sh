#!/bin/bash

echo "#################################################"
echo "#         let's encrypt pre-review script       #"
echo "#################################################"

files=$(find /etc/nginx/white_lists/ -type f)
now=$(date)

for full_path in $files
do
    matched_string=$(sed -n "s/deny all/allow all/p" $full_path | wc -l)
    echo "$now: the file $full_path have $matched_string matched"
    sed -i "s/deny all/allow all/g" $full_path
    echo "$now: edited $full_path"
    systemctl restart nginx
    echo "$now: nginx.service have just restared"
    echo "---"
done

systemctl restart nginx
echo "$now: nginx.service have just restared"
