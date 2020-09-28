# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

```
docker-compose run --rm api_rails bundle install
```

any other command
`docker-compose run api_rails [command]`

Start rails console
```
docker-compose run --rm api_rails rails console
```

Run rspec
```
docker-compose run --rm api_rails rspec
```

Tail rails server log
```
docker-compose run --rm api_rails tail log/development.log
```

Generates
```
docker-compose run --rm api_rails rails generate active_admin:install
```

* Configuration

`docker-compose build`
`docker-compose up -d api_rails`

* Database creation

`docker-compose run api_rails rails db:create`

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
