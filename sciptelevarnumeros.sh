#!/bin/bash

read -p "Introduce un numero " num
echo ""
i=1

while [ $i -le $num ]
do
	echo $(($i*$i))
	i=$(($i+1))
done
