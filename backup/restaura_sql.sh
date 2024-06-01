#!/bin/bash
# Script para restaurar la copia sql de Minsitra Server
clear
echo
echo "####################################################"
echo "Restarurar Copia De La Base De Datos Ministra Server"
echo "####################################################"
echo
# Listar archivos sql
echo "Archivos SQL disponibles:"
cd /opt/backup
ls -1 *.sql
echo
# Solicitar un nombre de fichero sql
read -p "Ingresa el nombre del archivo SQL que deseas restaurar:" archivo_sql
echo
read -p "Estas seguro que quieres restaurar:(s/n)" opcion
echo
case $opcion in
    s)
        # Verificar si el archivo existe
        if [ -f "/opt/backup/$archivo_sql" ]; then
        # Restaurar la base de datos desde el archivo sql seleccionado
        mysql -u root -p'Xj3kBT4nhJ' stalker_db < "/opt/backup/$archivo_sql" 2> /dev/null
        echo "Restauración completada!!!"
        echo
        else
        echo "El archivo $archivo_sql no existe en la carpeta."
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
