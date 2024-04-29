#!/bin/bash

/usr/bin/mysqldump --routines -u root -p'Xj3kBT4nhJ' stalker_db > /opt/backup/backup_$(date '+%Y-%m-%d').sql
