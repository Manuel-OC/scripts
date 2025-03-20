#!/bin/bash

function crearusuarios () {
	read -p "Cuantos usuarios desea crear?" cantidad
	
	for (( i=0 ; i<=$cantidad ; i=$(($i+1)) ))
	do
		if [ $i -gt 9 ]
		then
			sudo useradd -p "U$i""_""$((RANDOM%10))$((RANDOM%10))$((RANDOM%10))$((RANDOM%10))$((RANDOM%10))" -s /bin/bash "USER_$i"
			sudo chmod -R 700 /home/"USER_0$i"
		else
			sudo useradd -p "U0$i""_""$((RANDOM%10))$((RANDOM%10))$((RANDOM%10))$((RANDOM%10))$((RANDOM%10))" -s /bin/bash "USER_0$i"
			sudo chmod -R 700 /home/"USER_0$i"
		fi
	done
}

function eliminarusuarios () {
	read -p "Que usuarios quieres eliminar? " u
	
	read -p "Seguro.....? (y/n)" opc
	
	if [ $opc == "y" ]
	then
		echo "Borrando usuario $u ..."
		sudo userdel $u
		echo "Borrando directorio /home/$u ..."
		sudo rm -r "/home/$u"
		sudo rmdir "/home/$u"
	fi
}

function verusuarios () {
	tail -$cantidad /etc/passwd
}
