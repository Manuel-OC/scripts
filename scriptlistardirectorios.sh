#!/bin/bash

read -p "Introduce un directorio " ruta
echo ""

if [ -d "$ruta" ]
then
	for i in $(ls "$ruta")
	do
		if [ -f "$ruta/$i" ]
		then
			sudo ls -l "$ruta/$i" | awk '{print $3" "$9;}'
		else
			continue
		fi
	done
fi
