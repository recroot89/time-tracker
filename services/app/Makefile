db-recreate:
	bin/rake db:drop db:create db:migrate db:seed

start:
	foreman start
	
server:
	bin/rails s

lint:
	bundle exec rubocop

fix:
	bundle exec rubocop --auto-correct

test:
	bin/rake db:test:prepare
	bin/rails test -d

.PHONY: test
