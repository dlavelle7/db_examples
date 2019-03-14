# PostgreSQL Example

[WIP]

Examples of some PostgreSQL operations, using a M:M schema of students and
courses that they are enrolled in.

## Instructions

Running the container will set up database "example_db" with username
"test_user" and password "pass" for db operations.

1. Build the example postgres image:

```
docker build . -t pgimg
```

2. Run the built posgres image in a container (or in the background with `-d`).

Note:
Name the Docker container "pgcon" with the `--name` and remove the container
when it stops, with the `--rm` option, so the same name can be reused.

Note:
Mount the host directory `PostgreSQL/scripts` to to `/scripts` path in the
container with the `-v` option (beware the 1st character in the host path must
be `/` or `~` for a bindmount, otherwise you're naming a volume). Alternatively
you could use the `--mount` option.

```
docker run --name pgcon --rm -v "${PWD}"/scripts:/scripts pgimg
```

[TODO] connect directly to psql (\i to exectute)?

3. Execute sample operations, e.g:
```
docker exec -it pgcon psql example_db -U test_user -f scripts/joins.sql
```

## Drop a shell in the running postgres container:
```
docker exec -it pgcon bash
```

## Connect to the database via psql:
```
docker exec -it pgcon psql example_db -U test_user
```

## psql Cheatsheet

* `\l` list databases
* `\c <db_name>` change databases
* `\dt` list database tables
* `\d <table_name>` show table details
* `\x` turn on expanded display mode
