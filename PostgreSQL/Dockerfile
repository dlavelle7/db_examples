FROM postgres:11.0

RUN apt-get update && apt-get install vim -y

ENV POSTGRES_PASSWORD mysecretpassword

# postgres will execute anything in the initdb dir
COPY setup.sql /docker-entrypoint-initdb.d/

# TODO: Make this a mount point instead for quicker dev
COPY /scripts /scripts
