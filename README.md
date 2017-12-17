# influxdb-grafana-docker
InfluxDB and Grafana orchestrated by docker-compose

## Start containers
`docker-compose up -d`

## Grafana
http://localhost:3000

## InfluxDB
`docker run --rm --network=influxdbgrafanadocker_default --link=influxdbgrafanadocker_influxdb_1 -it influxdb:1.4.2 influx --host influxdb`

## Features
* InfluxDB database `js_performance` configured as data source for Grafana
