# Using app-start to run app inside docker container
app-start:
	@rm -f /inventory-assignment/tmp/pids/server.pid && bundle exec rails server -p 3000 -b '0.0.0.0'

build:
	@docker-compose build

start:
	@docker-compose up

stop:
	@docker-compose down --remove-orphans

console:
	@docker-compose run web rails c

db-migrate:
	@docker-compose run web bundle exec rake db:migrate

db-seed:
	@docker-compose run web bundle exec rake db:seed

db-create:
	@docker-compose run web bundle exec rake db:create

db-setup: db-create db-migrate db-seed
