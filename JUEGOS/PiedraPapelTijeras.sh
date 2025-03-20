#!/bin/bash

function inicio(){
	echo "Bienvenido a Piedra, Papel o Tijera"
	echo "Se te mostrarán 3 opciones, debes elegir una mediante el número correspondiente"
	echo "El primero que llegue a 5 gana"
}

function juego () {
	marcadorA=0
	marcadorB=0

	while true
	do
		echo "Introduzca una opcion"
		echo "1 Piedra"
		echo "2 Papel"
		echo "3 Tijeras"
		read -p " --> " opca 
	
		case $opca in
			1) jugador="Piedra"
			;;
			2) jugador="Papel"
			;;
			3) jugador="Tijeras"
			;;
			*) echo "Elija la opción correcta"
			;;
		esac

		echo "Elejiste $jugador"
		
		opcb=$((RANDOM%3))
		if [ $opcb -eq 0 ]
		then
			maquina="Piedra"
		elif [ $opcb -eq 1 ]
		then
			maquina="Papel"
		elif [ $opcb -eq 2 ]
		then
			maquina="Tijeras"
		fi
		
		echo "La máquina eligió $maquina"
		
		actualizarmarcador
		
		if [ $marcadorA -eq 5 ] || [ $marcadorB -eq 5 ]
		then
			exit 0
		fi
		
		echo "El marcador va --> Maquina:$marcadorA - $marcadorB:Humano"
	done
}

function actualizarmarcador() {
	if [ $maquina != $jugador ]
	then
		if [ $maquina == "Piedra" ] && [ $jugador == "Tijeras" ]
		then
			marcadorA=$(($marcadorA+1))
		fi
		if [ $maquina == "Papel" ] && [ $jugador == "Piedra" ]
		then
			marcadorA=$(($marcadorA+1))
		fi
		if [ $maquina == "Tijeras" ] && [ $jugador == "Papel" ]
		then
			marcadorA=$(($marcadorA+1))
		fi
		
		
		
		if [ $maquina == "Piedra" ] && [ $jugador == "Papel" ]
		then
			marcadorB=$(($marcadorB+1))
		fi
		if [ $maquina == "Papel" ] && [ $jugador == "Tijeras" ]
		then
			marcadorB=$(($marcadorB+1))
		fi
		if [ $maquina == "Tijeras" ] && [ $jugador == "Piedra" ]
		then
			marcadorB=$(($marcadorB+1))
		fi
	fi
}

inicio
juego
