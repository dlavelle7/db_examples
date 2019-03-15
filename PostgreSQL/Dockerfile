FROM postgres:11.0

RUN apt-get update && apt-get install vim -y

ENV POSTGRES_PASSWORD mysecretpassword

# postgres will execute anything in the initdb dir
COPY schema_and_fixtures.sql /docker-entrypoint-initdb.d/
