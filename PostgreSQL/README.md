# PostgreSQL Example

[WIP]

## Instructions

Running the container will set up database "example_db" with username
"test_user" and password "pass" for db operations.

1. Build the postgres image:

```
docker build . -t pgimg
```

2. Run the postgres container:

```
docker run pgimg -d
```

# TODO: container name like compose
# TODO: connect directly to psql (\i to exectute)?
3. Drop a shell in the running postgres container:

```
docker exec -it <continer_uid> bash
```

4. Execute SQL Scripts via psql command:

```
docker exec -it <container_uid> psql example_db -U test_user
```

## psql Cheatsheet

* `\l` list databases
* `\c <db_name>` change databases
* `\dt` list database tables
