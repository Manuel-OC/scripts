#!/bin/bash

#Mete el fichero encriptado en la misma carpeta que el script y llamalo "cifrado" (sin comillas)
#Recuerda poner la contraseña que corresponda despues del -k del comando

i=0;

while read linea
do

	openssl enc -d -in cifrado $linea -out resultado$i -k 1234

	i=$((i+1))
	
	sleep 1s

done < algoritmos
