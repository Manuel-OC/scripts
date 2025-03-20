#!/bin/bash
#Llama al fichero que quieres decodificar 10 veces "jpg0"
for (( i=0 ; i<10 ; i++ ))
do
	j=$((i+1))
	base64 -d jpg$i > jpg$j
done
