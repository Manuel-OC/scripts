#!/bin/bash

read -p "Introduce la ruta absoluta a la carpeta que quieres comprobar" carpeta
read -p "Introduce el tamaño máximo que puede tener la carpeta" max

if [ -d "$carpeta" ]
then
	#tam=$(sudo du -sb "$carpeta"  | awk '{print $1}')
	tam=$(sudo du -sBG "$carpeta" | awk '{print $1}' | sed s/G//)
		
	if [ $tam -gt $max ]
	then
		sudo rm -r "$carpeta"/*
	else
		echo "El tamaño de la carpeta $carpeta es $tam, menor que $max"
	fi
else 
	echo "La carpeta "$carpeta" no existe"
fi


