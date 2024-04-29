<a name="top"></a>
# Ministra server para IPTV COPIA   ![Badge](https://img.shields.io/badge/ESTADO-EN%20CONSTRUCCION-yellow)

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

Copiaremos todos los archivos en una carpeta y nos situaremos dentro de ella.

Para modificar la contraseña del usuario root de Mysql se debe sustituir en 3 archivos:

`.env`
`/backup/copias.sh`
`custom.ini`

<a name="instalar"></a>

### Puesta en funcionamiento

Para la primera puesta en marcha del sistema ejecutaremos la siguiente instrucción:

    docker compose up -d

La primera vez que se ejecuta tardará en estar listo aproximadamente 10 minutos, lo podremos verificar revisando los logs del contendor ministra-server, con la siguiente instrución:

    docker logs ministra-server

Nos deberá salir lo siguiente al final del log cuando esté operativo:

```
BUILD FINISHED

Total time: 9 minutes  50.95 seconds
```

Para acceder a la aplicación usaremos la siguiente dirección:

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

Podemos realizar una copia de la base de datos ejecutando el siguiente comando:

    docker exec mysql-server ./opt/backup/copias.sh

<a name="restaura"></a>

### Restaurar desde copia de seguridad sql

Para restaurar la base de datos con uno de los ficheros generados, tenemos que ejecutar lo siguiente:

    ./restaurar_copia.sh

Nos mostrará un listado de las copias disponibles y tendremos que indicar el nombre del archivo que queremos restaurar, luego nos pedirá la contraseña de root de mysql por seguridad.

<a name="cron"></a>

### Configuración programada de copias sql

Para configurar las copias de la base de datos sql automáticas añadiremos la siguiente línea al archivo /etc/crontab, con esto la estaremos configurando todos los días a las 1:00 horas:

    00 1   * * *   << aquí el usuario de tu server >> docker exec mysql-server ./opt/backup/copias.sh &> /dev/null

[Subir](#top)
