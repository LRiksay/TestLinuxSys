#!/bin/bash

echo "select this if you want ping: 1) "
echo "select this if you want backup catalog: 2) "
echo "select this if you want say good: 3) "
read -p "viberite nuzhny parametr: " pingo
case "$pingo" in
1)
echo "budet propingovan opredelenny sait"
read -p "hotite zapisat icmp dannie v textovy fail esli budet oshibka ili vivod (yes/no)? " text
case "$text" in
yes)
read -p "vvedite cite cotory vi chotite propingovat:? " pinjo
ping -c 5 "$pinjo" 2> error.txt
ping -c 5 "$pinjo" 1> text.txt
;;
no)
ping -c "$pinjo"
echo "propingovano"
;;
*)
;;
esac
esac


