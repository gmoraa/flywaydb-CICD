#!/bin/bash -ue

PW=mysecretpassword
HOST_PORT=5434

echo "Creating test Postgres container"
CONTAINER_ID=$(docker container run \
     -p "127.0.0.1:$HOST_PORT:5432/tcp" \
     -e POSTGRES_PASSWORD=$PW \
     -d \
     postgres:11-alpine)

function cleanup {
    echo
    echo "Cleaning up container"
    docker container rm -f "$CONTAINER_ID" >> /dev/null
}
trap cleanup EXIT

echo "Running migrations..."
echo

export FLYWAY_URL="jdbc:postgresql://127.0.0.1:$HOST_PORT/postgres"
export FLYWAY_USER=postgres
export FLYWAY_PASSWORD=$PW

flyway migrate
flyway validate