# sinatra_api_template

## Prerequisites
1. Sqlite 3
2. Ruby version 3.1.2

## Running locally
Seed the database
```
sqlite3 development.sql ".read setup_db.sql"
```

Install dependencies and start the server
```
bundle install
rackup
```