#!/bin/bash
# Ejecuta scrip restarua_sql dentro de contenedor mysql-server
docker exec -it mysql-server ./opt/backup/restaura_sql.sh
