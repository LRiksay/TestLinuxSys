#!/bin/bash
function other {
clear
echo "установка и включение утилиты 1)"
echo "просмотр статуса данной утилиты 2)"
echo "настройка iptables в разработке 3)"
echo "считать все правила брандмауэра с /etc/ufw/ и произвести перезагрузку после применить к iptables? 4)"
read -p "выберите нужный параметр? " did
case "$did" in
1)
ufw apt install
ufw enable
;;
2)
ufw status
;;
3) echo "в разработке"
;;
4) ufw reload
;;
esac
read -p "если вы хотите перейти на в главное меню напшите - menu, или перейти на предыдущий раздел - prev: " mep
case "$mep" in
menu)
al
;;
prev)
other
;;
*)
;;
esac

}
function portable {
read -p " Что вы хотите сделать, y - открыть порт, n - закрыть (y/n) ?: " alden
case "$alden" in
y)
read -p "какой порт вы хотите открыть ?: " allow
#nuzno napisat if else
ufw allow "$allow"
echo "$порт allow успешно закрыт"
ufw status
;;
n)
read -p "какой порт вы хотите закрыть ?: " deny
ufw deny "$deny"
echo "порт $deny успешно закрыт"
ufw status
;;
*)
;;
esac
read -p "если вы хотите перейти на в главное меню напшите - menu, или перейти на предыдущий раздел - prev: " mep
case "$mep" in
menu)
al
;;
prev)
portable
;;
*)
;;
esac

}

function ipt {
read -p " y - открыть, n -закрыть порт у определенного ip address? (y/n) " ipr
case "$ipr" in
y)
read -p "введите айпи адресс который вы хотите открыть? " allowip
read -p "введите порт который вы хотите открыть? " allowport
ufw allow from "$allowip" to any port "$allowport"
echo "$allowport для $allowip успешно открыт"
ufw status
;;
n)
read -p "для какого ip addressa вы хотите закрыть порт ?: " ipdeny
read -p "введите порт который вы хотите закрыть? " ipdeny
ufw deny from "$ipdeny" to any port "$ipdeny"
echo "порт $ipdeny успешно закрыт для $ipdeny"
ufw status
;;
*)
;;
esac
read -p "если вы хотите перейти на в главное меню напшите - menu, или перейти на предыдущий раздел - prev: " mep
case "$mep" in
menu)
al
;;
prev)
ipt
;;
*)
;;
esac

}


function al {
echo "вас приветствует команда по управлению ufw - это утилита для настройки брандмаэура в системах Linux"
sleep 1
echo "управление утилитой ufw 1) "
echo "открытие-закрытие определенного порта 2) "
echo "закрытие - открытие порта для определенного айпи адреса 3) "
echo "чтобы заблокировать определенную подсеть нажмите 4) "
echo "проверить статус ufw 5) "
read -p "выберите нужный параметр и введите число " chislo
if [ "$EUID" -eq 0 ]
then
case "$chislo" in
1)
other
;;
2)
sleep 1
portable
;;
3)
sleep 1
ipt
;;
4)
echo "в разработке"
;;
5)
#if [ "$EUID" -eq 0 ]
#then;
echo "статус открытия закрытия портов"
ufw status

al
#else
#echo "у вас нету прав для просмотра статуса"
;;
*)
;;
esac
else
echo "у вас нету прав для просмотра статуса открытия закрытия портов, если у вас есть root права введите sudo и данный скрипт"
fi
}
al




