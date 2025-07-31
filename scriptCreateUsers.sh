#!/bin/bash


read -p "vvedite name polzovatelia kotoroe hotite sozdat: " user

if [ -n "$user" ]
then
useradd "$user" -m -d /home/"$user" -s /bin/bash
sleep 1
echo "sozdan $user s directoriey /home/$user"
sleep 1
echo "zadaite password for $user :"
passwd "$user"
sleep 1
read -p "dlya kakoi papki ti chochesh otkrit dostup for this $user" dostup
if [ -d "$dostup" ]
then
sleep 1
read -p "kakie prave ti hochesh naznachit $user 1 = execute 2 = write, 4 = read: " prava
chmod "$prava" "$user" "$dostup"
echo "you naznachil $prava for $user and $dostup : "
fi
echo "you create $user"
else
echo "name user ne mozhet bit pustim"
fi

