#!/bin/bash

function buscarred () { 
	ifconfig | grep -A 1 "enp5s0" | tail -1 | cut -d ' ' -f10 > red.txt 
}

function buscarmascara () { 
	ifconfig | grep -A 1 "enp5s0" | tail -1 | awk '{print $4}' > mascara.txt 
}

function buscarbroadcast () { 
	ifconfig | grep -A 1 "enp5s0" | grep "inet" | cut -d ' ' -f16 > broadcast.txt 
}

function libres () {
	lista=()
	
	case $(cat mascara.txt) in 
	"255.255.255.0") 
		dirdered=$(cut -d '.' -f1,2,3 red.txt)
	;;
	*)
		echo "Lo siento, la red no es /24"
	;;
	esac
	
	for i in {1..254}
	do
		ping -c 1 "$dirdered.$i" &> /dev/null
		
		if [ $? != "0" ]
		then
			echo "$dirdered.$i está libre"
			lista=("${lista[@]}" "$dirdered.$i")
		else
			echo "$dirdered.$i está ocupada"
		fi
	done
}

function mostrarlibres() {
	echo "Lista de IPs libres en tu red: "
	
	for i in "${lista[@]}"
	do
		echo "$i "
	done
}

buscarred
echo "IP -> $(cat red.txt)"
buscarmascara
echo "Máscara -> $(cat mascara.txt)"
buscarbroadcast
echo "Broadcast -> $(cat broadcast.txt)"
libres
mostrarlibres
