#!/bin/bash

source funcionesagenda.sh

select opc in "Añadir" "Buscar" "Listar" "Ordenar" "Borrar" "Salir"
do
	case $opc in
		"Añadir")
			anadir
		;;
		"Buscar")
			buscar
		;;
		"Listar")
			listar
		;;
		"Ordenar")
			ordenar
		;;
		"Borrar")
			borrar
		;;
		"Salir")
			exit 1
		;;
		*)
			echo "Opción incorrecta"
		;;
	esac
done
