#!/bin/bash

sudo docker run --rm --entrypoint "" -v /opt/backup:/backup --network shvirtd-example-python_backend -e "TIMESTAMP=$(date +%Y%m%d_%H%M%S)" schnitzler/mysqldump sh -c "mysqldump --opt -h db -u root -p\"YtReWq4321\" \"--result-file=/backup/dump_\$TIMESTAMP.sql\" virtd"
