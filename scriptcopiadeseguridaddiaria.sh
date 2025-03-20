#!/bin/bash

cd /home/usuario/curso-24-25/datos/facturacion

tar -c -v -f copia_diaria_$(date +%H-%M-%Y-%m-%d) *

mv copia_diaria_$(date +%H-%M-%Y-%m-%d) /home/usuario/copiaseguridad
