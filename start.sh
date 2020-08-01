#!/bin/bash

echo "Starting kong-database..."

docker-compose up -d kong-database

STATUS="starting"

while [ "$STATUS" != "healthy" ]
do
    STATUS=$(docker inspect --format {{.State.Health.Status}} kong-database)
    echo "kong-database state = $STATUS"
    sleep 5
done


echo "Run database migrations..."

docker-compose up kong-migration

echo "Starting kong..."

docker-compose up -d kong

KONG_STATUS="starting"

while [ "$KONG_STATUS" != "healthy" ]
do
    KONG_STATUS=$(docker inspect --format {{.State.Health.Status}} kong)
    echo "kong state = $KONG_STATUS"
    sleep 5
done

echo "Kong admin running http://127.0.0.1:8001/"

echo "Starting konga"

docker-compose up konga

echo "Konga running http://127.0.0.1:1337/"