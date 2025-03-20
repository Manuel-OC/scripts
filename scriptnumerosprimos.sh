#!/bin/bash

i=3

echo "2"

for (( ;  ; ))
do
	cont=0
	for (( j=3; j<$i; j=$(($j+2)) ))
	do
		if [ $(($i%$j)) -eq 0 ]
		then
			cont=$((cont+1))
			break;
		fi 
	done
	if [ $cont -eq 0 ]
	then
		echo $i
	fi
	i=$(($i+2))
done
