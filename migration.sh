#!/bin/bash -ue

echo "Downloading and installing flyway..."
wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/8.0.0/flyway-commandline-8.0.0-linux-x64.tar.gz | \
    tar xz && sudo ln -s `pwd`/flyway-8.0.0/flyway /usr/local/bin
echo "flyway successfully installed"

flyway -url=jdbc:postgresql://$RDS_URL -user=$RDS_USER -password=$RDS_PASSWORD migrate