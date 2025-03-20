#!/bin/bash

read -p "Introduce el mensaje " men

#until false
#do
	while read linea
	do
		echo "$men" | mail -s "$(date)" $linea
	done < Correos.txt
#done
