#!/bin/bash
# Script para restaurar un archivo SQL en MySQL

# Ruta de la carpeta que contiene los archivos SQL
CARPETA_SQL="/opt/backup"

# Listar archivos SQL disponibles
echo "Archivos SQL disponibles:"
ls "$CARPETA_SQL"/*.sql

# Solicitar al usuario que seleccione un archivo SQL
echo "Ingresa el nombre del archivo SQL que deseas restaurar(solo el nombre del archivo):"
read ARCHIVO_SQL

# Verificar si el archivo existe
if [ -f "$CARPETA_SQL/$ARCHIVO_SQL" ]; then
    # Restaurar la base de datos desde el archivo SQL seleccionado
    mysql -u root -p stalker_db < "$CARPETA_SQL/$ARCHIVO_SQL"
    echo "Restauración completada."
else
    echo "El archivo $ARCHIVO_SQL no existe en la carpeta."
fi

