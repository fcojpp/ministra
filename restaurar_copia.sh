#!/bin/bash
# Script para restaurar la copia sql de Minsitra Server

# Ruta de la carpeta que contiene los archivos sql dentro del contenedor
CARPETA_SQL="/opt/backup"

# Listar archivos sql
echo "Archivos SQL disponibles:"
ls "$CARPETA_SQL"/*.sql
echo
# Solicitar un nombre de fichero sql a restaurar
read -p "Ingresa el nombre del archivo SQL que deseas restaurar(solo el nombre del archivo):" ARCHIVO_SQL
echo
# Confirmar la restauración
read -p "Estas seguro que quieres restaurar:(s/n)" opcion
echo
case $opcion in
    s)
        # Verificar si el archivo existe
        if [ -f "$CARPETA_SQL/$ARCHIVO_SQL" ]; then
        # Restaurar la base de datos desde el archivo SQL seleccionado
        mysql -u root -p'Xj3kBT4nhJ' stalker_db < "$CARPETA_SQL/$ARCHIVO_SQL"
        echo "Restauración completada!!!"
        else
        echo "El archivo $ARCHIVO_SQL no existe en la carpeta."
        fi
        ;;
    n)
        echo "Saliendo ..."
        exit 0
        ;;
    *)
        echo "Opción inválida. Intentalo de nuevo."
        ;;
esac
