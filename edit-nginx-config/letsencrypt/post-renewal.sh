#!/bin/bash

echo "#################################################"
echo "#        let's encrypt post-review script       #"
echo "#################################################"

files=$(find /etc/nginx/white_lists/ -type f)
now=$(date)

for full_path in $files
do
    matched_string=$(sed -n "s/allow all/deny all/p" $full_path | wc -l)
    echo "$now: the file $full_path have $matched_string matched"
    sed -i "s/allow all/deny all/g" $full_path
    echo "$now: edited $full_path"
    echo "---"
done

systemctl restart nginx
echo "$now: nginx.service have just restared"
