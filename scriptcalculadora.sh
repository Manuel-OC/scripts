#!/bin/bash

echo "1. Suma"
echo "2. Restar"

read -p "Introduce una operacion" op
read -p "Introduce un numero" x
read -p "Introduce un numero" y

if [ "$op" == '1' ]
then
	z=$(($x+$y))
elif [ "$op" == '2' ]
then
	z=$(($x-$y))
elif [ -z "$op" ]
then
	echo "No has introducido nada"
else
	echo "No has elegido ni suma ni resta"
fi

echo "$z"
