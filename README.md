# Deanin Ruby On Rails blog speedrun (in Docker env)

Youtube : What If We Tried A Ruby On Rails 7 Speedrun?
https://www.youtube.com/watch?v=vLU56oARLcs

## Dev env setup (pre-requisite)

```bash
docker volume create ruby-bundle-cache
```

## Initialize the app and open editor

```bash
rails new video --css bootstrap -j esbuild -d postgresql
cd video
# Start VisualStudio Code
code .
```

## Run some bootstrap commands

```bash
bundle add devise simple_form
rails g simple_form:install --bootstrap
rails g devise:install
rails g controller pages home
rails action_text:install
bundle install --gemfile /app/Gemfile
rails g migration AddRoleToUser role:integer
rails g scaffold post title views:integer user:belongs_to
```

## Setup docker compose and PostgreSQL server

Copy config files

```bash
touch .env Dockerfile.dev docker-compose-dev.yml
# Copy Docker config files from `docker-rails-bootstrap-template-2023`
#   - Dockerfile.dev
#   - docker-compose-dev.yml
```

Setup the database
Don’t forget to add the host and the username in your config/database.yml with the following inside the default: &default:

```yaml
# edit config/database.yml
host: db
username: postgres
```

Build the project

```bash
docker compose -f docker-compose-dev.yml build
```

Finally, to init your entire project with its services you should execute the following command:
```bash
docker compose -f docker-compose-dev.yml up
# --scale db=1
```

## Run migration

```bash
docker compose -f docker-compose-dev.yml run --rm -it web bash
rails db:create
rails db:migrate
# Edit db/seeds.rb and app/models/user.rb
rails db:seed
```

## Edit app and run commands

Follow video to edit app

```bash
rails g devise:views
```