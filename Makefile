include make-production.mk
include make-app.mk
include make-ansible.mk

.ONESHELL:
app-install:
	gem install bundler
	make ansible-dev-setup-env
	docker run -d -p 5432:5432 -e POSTGRES_USER=app --name ttdb postgres:9.6
	cd services/app
	bundle && yarn 
	bin/rails db:create db:migrate db:seed 
	bin/rails s
