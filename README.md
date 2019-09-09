# Time Tracker Rails Appication

## Setup

Install ansible

Install docker

Install ruby 2.6.4 with asdf (advanced), rvm (recommended) or rbenv

Create a file `{project_folder}/tmp/vault_password` and save the password inside it

Install bundler gem

```
gem install bundler
```

Setup project environments

```
make ansible-dev-setup-env
```

Go to services/app

```
cd services/app
```

Install dependencies

```
bundle && yarn
```

Manually install rubocop

```
gem install rubocop
```

Run the database (run only once)

```
docker run -d -p 5432:5432 -e POSTGRES_USER=app --name ttdb postgres:9.6
```

Next time use: `docker start ttdb`

Prepare the database

```
rails db:create db:migrate db:fixtures:load
```

Run rails server

```
rails s
```

Open `localhost:8080`
