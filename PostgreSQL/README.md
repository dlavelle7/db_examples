# PostgreSQL Example

[WIP]

Examples of some PostgreSQL operations, using a M:M schema of students and
courses that they are enrolled in.

## Instructions

Running the container will set up database "example_db" with username
"test_user" and password "pass" for db operations.

1. Build the postgres image:

```
docker build . -t pgimg
```

2. Run the built posgres image in a container (or in the background with `-d`).
Note: Name the container "pgcon" with the `--name` and remove the container
when it stops, with the `--rm` option, so the same name can be reused:

```
docker run --name pgcon --rm pgimg
```

[TODO] connect directly to psql (\i to exectute)?

[TODO] Use "test_db" user for the psql instead of "postgres"

2. Execute sample operations, e.g:
```
docker exec -it <continer_uid> psql example_db -U postgres -f scripts/joins.sql
```

## Drop a shell in the running postgres container:
```
docker exec -it <continer_uid> bash
```

## Connect to the database via psql:
```
docker exec -it <container_uid> psql example_db -U test_user
```

## psql Cheatsheet

* `\l` list databases
* `\c <db_name>` change databases
* `\dt` list database tables
* `\d <table_name>` show table details
