#!/bin/bash

source /opt/shvirtd-example-python/.env

sudo docker run --rm --entrypoint "" -v /opt/backup:/backup --network shvirtd-example-python_backend -e "TIMESTAMP=$(date +%Y%m%d_%H%M%S)" -e "MYSQL_USER=$MYSQL_ROOT_USER" -e "MYSQL_PASSWORD=$MYSQL_ROOT_PASSWORD" schnitzler/mysqldump sh -c "mysqldump --opt -h db -u \"\$MYSQL_USER\" -p\"\$MYSQL_PASSWORD\" \"--result-file=/backup/dump_\$TIMESTAMP.sql\" virtd" \
