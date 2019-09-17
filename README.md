# Time Tracker Rails Appication

[![CircleCI](https://circleci.com/gh/recroot89/time-tracker.svg?style=svg&circle-token=1129b2b3257ff82e3e36e3ea7aa1d5f909ed24f2)](https://circleci.com/gh/recroot89/time-tracker) [![Maintainability](https://api.codeclimate.com/v1/badges/0ed6722f043c09cb2575/maintainability)](https://codeclimate.com/github/recroot89/time-tracker/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/0ed6722f043c09cb2575/test_coverage)](https://codeclimate.com/github/recroot89/time-tracker/test_coverage)

### Manual Setup

Install ansible, docker, nodejs, yarn

Install ruby 2.6.4 with asdf (advanced), rvm (recommended) or rbenv

Clone the repo and go to project folder

```
cd time-tracker
```

Create a file `time-tracker/tmp/vault_password` and save the password inside it

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

Prepare postgresql (first run)

```
docker run -d -p 5432:5432 -e POSTGRES_USER=app --name ttdb postgres:9.6
```

Next time use: `docker start ttdb`

Create the database and fill with data

```
rails db:create db:migrate db:fixtures:load
```

Run server

```
rails s
```

Open `localhost:8080`
