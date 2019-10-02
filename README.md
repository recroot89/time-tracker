# Time Tracker Rails Appication

[![CircleCI](https://circleci.com/gh/recroot89/time-tracker.svg?style=svg&circle-token=1129b2b3257ff82e3e36e3ea7aa1d5f909ed24f2)](https://circleci.com/gh/recroot89/time-tracker) [![Maintainability](https://api.codeclimate.com/v1/badges/0ed6722f043c09cb2575/maintainability)](https://codeclimate.com/github/recroot89/time-tracker/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/0ed6722f043c09cb2575/test_coverage)](https://codeclimate.com/github/recroot89/time-tracker/test_coverage)

### Setup

1. Install ansible, docker, nodejs, yarn and ruby 2.6.4 with asdf (advanced), rvm (recommended) or rbenv

2. Clone the repo and go to project folder

```
cd time-tracker
```

3. Create a file `time-tracker/tmp/vault_password` and save the password inside it

4. Install the app

```
make app-install
```

5. Next time use `make run` or with foreman: `make start`

6. Open `localhost:8080`
