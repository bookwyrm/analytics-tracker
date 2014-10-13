# Notes on sharding

## Creating DBs

```
createdb analytics-tracker_development-0
createdb analytics-tracker_development-1
createdb analytics-tracker_development-2
createdb analytics-tracker_development-3
```

## Setting up schema

Dump existing schema as SQL and load into shard dbs.

```
pg_dump --file=db/schema.sql --schema-only --clean --dbname=analytics-tracker_development
psql --file=db/schema.sql analytics-tracker_development-0
psql --file=db/schema.sql analytics-tracker_development-1
psql --file=db/schema.sql analytics-tracker_development-2
psql --file=db/schema.sql analytics-tracker_development-3
```


