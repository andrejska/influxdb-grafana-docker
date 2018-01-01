#!/usr/bin/env bash

./run.sh "${@}" &
timeout 10 bash -c "until </dev/tcp/localhost/3000; do sleep 1; done"

curl 'http://admin:admin@localhost:3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' \
--data-binary '{"name":"js_performance","type":"influxdb","url":"http://influxdb:8086","access":"proxy","isDefault":true,"database":"js_performance","user":"admin","password":"admin"}'

curl 'http://admin:admin@localhost:3000/api/datasources' -X POST -H 'Content-Type: application/json;charset=UTF-8' \
--data-binary '{"name":"${DS_INFLUXDB_TELEGRAF}","type":"influxdb","url":"http://influxdb:8086","access":"proxy","isDefault":false,"database":"telegraf","user":"admin","password":"admin"}'

pkill grafana-server
timeout 10 bash -c "while </dev/tcp/localhost/3000; do sleep 1; done"

exec ./run.sh "${@}"
