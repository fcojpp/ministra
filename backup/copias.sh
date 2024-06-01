#!/bin/bash
# Script que se ejecuta dentro del contenedor mysql-server, guarda una copia sql en /opt/backup con el nombre backup_fecha_ejecución.sql 
/usr/bin/mysqldump --routines -u root -p'Xj3kBT4nhJ' stalker_db > /opt/backup/backup_$(date '+%Y-%m-%d').sql
