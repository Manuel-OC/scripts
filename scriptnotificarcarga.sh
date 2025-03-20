#!/bin/bash

uptime | awk '$10>0,2 {print "La carga del sistema es: "$10}' | mail -s "AVISO" mortcab191@g.educaand.es
