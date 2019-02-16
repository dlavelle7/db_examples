FROM postgres:11.0

RUN apt-get update && apt-get install vim -y

ENV POSTGRES_PASSWORD mysecretpassword

# postgres will execute anything in the initdb dir
COPY setup.sql /docker-entrypoint-initdb.d/

# TODO: Actually create example scripts
# TODO: All JOIN examples
# TODO: EXPLAIN example
COPY /scripts /scripts
