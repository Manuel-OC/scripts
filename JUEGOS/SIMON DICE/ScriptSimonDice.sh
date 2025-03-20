#!/bin/bash

function SelectorDeDificultad () {
	dif=0
	local opc=0
	
	while [ $opc != "1" ] && [ $opc != "2" ] && [ $opc != "3" ] 
	do
		echo "Seleccione la dificultad"
		echo "1 Fácil"
		echo "2 Medio"
		echo "3 Difícil"
		read -e -p "->" opc
		
		case $opc in
			1) dif=10
			;;
			2) dif=100
			;;
			3) dif=1000
			;;
		esac
	done
}

function AlmacenarResultado () {
	local dificultad

	case $dif in
		10) dificultad="Fácil"
		;;
		100) dificultad="Medio"
		;;
		1000) dificultad="Difícil"
		;;
	esac
	
	echo "$1 - $2 - $dificultad - $(date)" >> ResultadosSimonDice.txt
	sort -k 3 -r ResultadosSimonDice.txt -o ResultadosSimonDice.txt
}

num=1
SelectorDeDificultad
array+=$(($((RANDOM))%$dif))

while true
do
	cont=0

	for i in "${array[@]}"
	do
		echo "$i "
	done
	
	echo "Por favor espere..."
	sleep $num

	clear
	
	while [ $cont -lt $num ]
	do
		read -e -p "Introduce el $(($cont+1))º número (son $num) -> " valor
		
		if [ ${array[$cont]} -ne $valor ] 2> /dev/null
		then
			echo "Era ${array[$cont]} no $valor, perdiste. Duraste $num turnos"
			read -e -p "Introduce tus siglas -> " siglas
			AlmacenarResultado $siglas $num
			exit 1
		fi
		cont=$(($cont+1))
	done

	array=("${array[@]}" $(($((RANDOM))%$dif)))
	num=$(($num+1))
done
