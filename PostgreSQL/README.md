# PostgreSQL Example

[WIP]

Examples of some PostgreSQL operations, using a M:M schema of students and
courses that they are enrolled in.

## Instructions

Running the container will set up database "example_db" with username
"test_user" and password "pass" for db operations.

1. Build and run the postgres image:

```
docker build . -t pgimg && docker run pgimg -d
```

# TODO: container name like compose
# TODO: connect directly to psql (\i to exectute)?
2. Drop a shell in the running postgres container:

```
docker exec -it <continer_uid> bash
```

3. Connect to the database via psql:

```
docker exec -it <container_uid> psql example_db -U test_user
```

## psql Cheatsheet

* `\l` list databases
* `\c <db_name>` change databases
* `\dt` list database tables
* `\d <table_name>` show table details
