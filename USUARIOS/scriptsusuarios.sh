#!/bin/bash

source /home/usuario/funcionesusuarios.sh

select opc in "Crear usuarios" "Eliminar usuarios" "Ver usuarios" "Salir"
do
	case $opc in
		"Crear usuarios") crearusuarios
		;;
		"Eliminar usuarios") 
			eliminarusuarios
		;;
		"Ver usuarios") verusuarios
		;;
		"Salir") exit 0
		;;
		*) echo "Opcion incorrecta"
	esac
done
