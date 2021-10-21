start:
		rm -f /inventory-assignment/tmp/pids/server.pid && bundle exec rails server -p 3000 -b '0.0.0.0'

db-create:
		docker-compose run web bundle exec rake db:create
