#!/bin/bash

#Pedimos el nombre del servicio por teclado
read -p "Introduce el nombre del servicio" servicio

#Buscamos su PID a partir de su nombre exacto con pgrep y lo guardamos en la variable ejecucion
ejecucion=$(pgrep -x "$servicio")

#Si la variable ejecucion está vacía...
if [ -z $ejecucion ] 
then
	#...activo el servicio (si sale error lo mando al pozo pa no verlo)
	sudo service "$servicio" start 2> /dev/null
	
	#Si sale error después de la instrucción anterior...
	if [ $? -ne 0 ] 
	then
		#...mostramos que el servicio no existe
		echo "El servicio "$servicio" no existe"
		exit 1
	fi
#Si la variable ejecución no está vacía...
else
	#...mostramos un mensaje indicando que el servicio ya está ejecutándose
	echo "El servicio "$servicio" ya está en ejecución"
fi
