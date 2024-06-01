#!/bin/bash
# Script para realizar una copia de seguridad sql de la base de datos
echo
echo "##########################################################"
echo "Creación Copias De Seguridad Base De Datos Ministra Server"
echo "##########################################################"
echo
echo "Realizando copia...."
echo
# Realiza copia y guarda archivo backup_fecha_ejecución.sql en /opt/backup
/usr/bin/mysqldump --routines -u root -p'Xj3kBT4nhJ' stalker_db > /opt/backup/backup_$(date '+%Y-%m-%d').sql 2> /dev/null
echo "Copia realizada correctamente"
echo
