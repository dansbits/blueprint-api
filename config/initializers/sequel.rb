require "sequel"

Sequel::Model.plugin :timestamps, update_on_create: true

Sequel.default_timezone = :utc

AppDb = Sequel.sqlite("./development.sql")