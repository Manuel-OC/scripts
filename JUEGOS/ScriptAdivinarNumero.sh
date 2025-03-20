#!/bin/bash

read -s -p "Jugador 1 introduce un numero " num
turnos=0
int=$((num+1))

echo ""

while [ $num -ne $int ]
do
	read -p "Jugador 2 intenta adivinarlo " int
	
	if [ $int -lt $num ]
	then
		echo "Más"
	elif [ $int -gt $num ]
	then
		echo "Menos"
	fi

	turnos=$(($turnos+1))
done

echo "Acertaste era el $int, has tardado $turnos intentos"
sleep 10
