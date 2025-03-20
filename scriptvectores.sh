#!/bin/bash

rellenar() {
	valores=()
	
	for i in {1..10}
	do
		read -p "Introduce el valor $i " v
		valores+=($v)
	done
}

function sumar() {
	sum=0

	for i in "${valores[@]}"
	do
		sum=$(($sum+$i))
	done	
	
	echo "La suma de todos los elementos es $sum"
}

function inverso() {
	echo "El array inverso es: "
	for i in {9..0}
	do
		echo -n "${valores[$i]}"
	done
	echo ""
}

function npares() {
	pares=0

	for i in "${valores[@]}"
	do
		if [ $(($i%2)) -eq 0 ] 
		then
			pares=$(($pares+1))
		fi
	done
	
	echo "Hay $pares números pares en el vector"
}

function sumaimpares() {
	sumimp=0

	for i in "${valores[@]}"
	do
		if [ $(($i%2)) -eq 1 ] 
		then
			sumimp=$(($sumimp+$i))
		fi
	done
	
	echo "La suma de los impares es $sumimp"
}

function media() {
	echo "La media es $(($sum/10))"
}

rellenar
sumar
inverso
npares
sumaimpares
media $sum
