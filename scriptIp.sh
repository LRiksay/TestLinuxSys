#!/bin/bash

read -p "Введите файл в котором лежат ip адресса: " files

if [ -f "$files" ]; then

while read -r host_name ip_name; do

if [ -z "$ip_name" ]; then
continue
fi

if ping -c 1 -w 1 "$ip_name" > /dev/null 2>&1; then

echo "Хост $host_name доступен"
else
echo "Хост $host_name недоступен"
fi

done < "$files"
else
echo "файл не найден!"
fi


