install:
	docker-compose exec php composer install
	docker-compose run --rm node yarn install

start:
	docker-compose up -d

stop:
	docker-compose down

migrate:
	docker-compose exec php bin/console doctrine:migration:migrate

migration:
	docker-compose exec php bin/console make:migration

assets_watch:
	docker-compose run --rm node yarn encore dev --watch

clear_cache:
	docker-compose exec php bin/console c:c