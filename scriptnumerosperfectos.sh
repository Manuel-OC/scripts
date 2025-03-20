#!/bin/bash

read -p "Introduce el numero de perfectos " num
echo ""
i=2
sum=0
cont=1
encontrados=0

while [ $encontrados -le $num ]
do
	while [ $cont -le $(($i/2)) ]
	do
		if [ $(($i%$cont)) -eq 0 ]
		then
			sum=$(($sum+$cont))
		fi
		cont=$(($cont+1))
	done
	if [ $sum -eq $i ]
	then
		echo "$i SI ES PERFECTOS"
		encontrados=$(($encontrados+1))
	else
		echo "$i no es perfecto"
	fi
	i=$(($i+2))
	cont=1
	sum=0
done
