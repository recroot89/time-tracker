db-recreate:
	bin/rails db:drop db:create db:migrate db:seed

start:
	docker start ttdb
	foreman start

run:
	docker start ttdb
	bin/rails s

lint:
	bundle exec rubocop

fix:
	bundle exec rubocop --auto-correct

test:
	bin/rake db:test:prepare
	bin/rails test -d

.PHONY: test
