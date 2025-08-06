#!/bin/bash
func1="1)"
function pinuj {
echo "budet propingovan opredelenny sait"
read -p "hotite zapisat icmp dannie v textovy fail esli budet oshibka ili vivod (yes/no)? " text
case "$text" in
yes)
read -p "vvedite cite cotory vi chotite propingovat:? " pinga
mkdir log/
cd log/
ping -c 5 "$pinga" 2> error.txt
ping -c 5 "$pinga" 1> text.txt
echo "error or text writing directory log"
;;
no)
read -p "vvedi cite cotory vy chotite propingovat:? " pingb
ping -c 5 "$pingb"
echo "propingovano"
;;
*)
;;
esac
}

function user {
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
read -p "dlya kakoi papki ti chochesh otkrit dostup for this $user: " dostup
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
}

function archive {
read -p "kakoy katalog you want archive: " archia
if [[ -d "$archia" ]]
then
sleep 1
echo "directoria $archia est"
echo "vvedi directory v kotoruy nuzhno save i nazvanie faila po primeru /mnt/backup/home.tar"
read -p "v kakuyi directoriy ti choches save archive? " save
tar -czvf "$save" "$archia"
else
echo "eto ne directoria"
fi
}


function funcA {
case "$pingo" in
1)
pinuj
;;
2)
user
;;
3)
archive
esac
}

echo "select this if you want ping: 1) "
echo "select this if you want backup catalog: 2) "
echo "select this if you want say good: 3) "
echo "select this if you want install isc-dhcp-server and repair setings: 4) "
read -p "viberite nuzhny parametr: " pingo
funcA

