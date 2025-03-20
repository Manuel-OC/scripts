#!/bin/bash

#Llama al fichero del cual no sabes que es "ejercicio"
#De manera burda va a probar la cabecera de los ficheros que hay
#en esta carpeta con el contenido de "ejercicio"

dd skip=1 bs=100 if=ejercicio of=contenido

for ((i=0 ; i<4 ; i++))
do

	dd count=1 bs=100 if=$i of=cabecera
	cat cabecera contenido > resultado$i

done
