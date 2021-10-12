#!/bin/bash -ue

echo "Downloading and installing flyway..."
wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/8.0.0/flyway-commandline-8.0.0-linux-x64.tar.gz | \
    tar xvz && sudo ln -s `pwd`/flyway-8.0.0/flyway /usr/local/bin
echo "flyway successfully installed"

flyway --version