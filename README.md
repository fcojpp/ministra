<a name="top"></a>
# Ministra server para IPTV ![Badge](https://img.shields.io/badge/ESTADO-FINALIZADO-green)

***

Instalación servidor Ministra para red IPTV con contenedores Docker, para proyecto final de curso de ASIR en el IES Serpis (Valencia).

***

## Tabla de contenido:
* [Descripción general](#general)
* [Puesta en funcionamiento](#instalar)
* [Parada e inicio del sistema](#start_stop)
* [Realizar copia de seguridad de la base de datos](#copia)
* [Restaurar desde copia de seguridad archivo sql](#restaura)
* [Configuración programada de copias de seguridad sql](#cron)

<a name="general"></a>

### Descripción general

Para la puesta en servicio del servidor Ministra se necesita arrancar dos contenedores, uno con el servidor web y otro con la base de datos.

Se copiarán todos los archivos en una carpeta y nos situaremos dentro de ella.

Para modificar la contraseña del usuario root de Mysql se debe sustituir en 3 archivos:

`.env`
`/backup/copias.sh`
`custom.ini`

Se cambiarán los permisos de ejecución de los scripts:

    sudo chmod +x crear_copia.sh restaurar_copia.sh start.sh stop.sh ./backup/copias.sh ./backup/restaura_sql.sh

<a name="instalar"></a>

### Puesta en funcionamiento

Para la primera puesta en marcha del sistema se ejecutará la siguiente instrucción:

    docker compose up -d

La primera vez que se ejecuta tardará en estar listo aproximadamente 10 minutos, se puede verificar revisando los logs del contendor ministra-server, con la siguiente instrucción:

    docker logs --follow ministra-server

Deberá salir lo siguiente al final del log cuando esté operativo:

```
BUILD FINISHED

Total time: 9 minutes  50.95 seconds
```

Para acceder a la aplicación se uasará la siguiente dirección:

    http://ip_servidor/stalker_portal/server/adm/
    
El usuario por defecto es `admin` y la contraseña `1`.

<a name="start_stop"></a>

### Parada e inicio del sistema

Para parar los contenedores utilizaremos el script stop.sh que ejecutaremos con:

    ./stop.sh

Y para la puesta en marcha lo haremos con el script start.sh:

    ./start.sh

[Subir](#top)

<a name="copia"></a>

### Realizar copia de seguridad de la base de datos

Para realizar una copia de seguridad de la base de datos se ejecutará el siguiente comando:

    ./crear_copia.sh

<a name="restaura"></a>

### Restaurar desde copia de seguridad sql

Para restaurar la base de datos con uno de los ficheros generados, tenemos que ejecutar lo siguiente:

    ./restaurar_copia.sh

Mostrará un listado de las copias disponibles y se tendrá que indicar el nombre del archivo que se quiere restaurar.

<a name="cron"></a>

### Configuración programada de copias sql

Para configurar las copias de la base de datos sql automáticas se añadirá la siguiente línea al archivo /etc/crontab, con esto quedará configurada todos los días a las 1:00 horas:

    00 1   * * *   << aquí el usuario de tu server >> docker exec mysql-server ./opt/backup/copias.sh &> /dev/null

[Subir](#top)
