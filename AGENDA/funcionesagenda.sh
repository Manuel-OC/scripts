function anadir () {
	read -p "Introduce nombre -> " nom
	read -p "Introduce teléfono -> " tlf
	read -p "Introduce dirección -> " dir
	
	echo "$nom:$dir:$tlf" >> agenda.txt
}

function buscar () {
	echo "1) Buscar por nombre"
	echo "2) Buscar por direccion"
	echo "3) Buscar por telefono"
	read -p "Elige una opción " op
	case $op in
		1) read -p "Introduce el nombre " nombre
		   awk -v valor="$nombre" 'BEGIN {FS=":"} $1 ~ valor' agenda.txt
		   cut -d: -f1 | grep "$nombre"
		;;
		2) read -p "Introduce el direccion " dir
		   awk -v valor="$dir" 'BEGIN {FS=":"} $2 ~ valor' agenda.txt
		   cut -d: -f2 | grep "$dir"
		;;
		3) read -p "Introduce el nombre " tlf
		   awk -v valor="$tlf" 'BEGIN {FS=":"} $3 ~ valor' agenda.txt
		   cut -d: -f3 | grep "$tlf"
		;;
	esac
}

function listar () {
	cat agenda.txt
}

function ordenar () {
	sort -k 1 agenda.txt -o agenda.txt
}

function borrar () {
	read -p "Seguro que quiere eliminar todos los datos?(S/N) " elec
	
	if [ $elec == "S" ] 
	then
		echo "" > agenda.txt
	fi
}
