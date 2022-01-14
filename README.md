# Dockerfile for apacheDS
A Dockerfile which creates a windows image with a running instance of apache DS. Created to help me with automated
testing of authentication towards LDAP.

    git clone git@github.com:rasmusrim/docker-apacheds.git
    cd docker-apacheds
    docker build . -t apacheds
    docker run -d -p 10389:10389 apacheds

You can now connect to LDAP at localhost:10389 with username "admin" and password "secret".