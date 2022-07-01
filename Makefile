up:
	@docker-compose up -d app

up-build:
	@docker-compose up -d --build app

start:
	@docker-compose start app db

stop:
	@docker-compose stop

info:
	@docker system df

destroy:
	@docker system prune -a --volumes

into-container:
	@docker-compose exec app bash

lint:
	@docker-compose exec -u application app bash -c  "cd cidenet_api;vendor/bin/php-cs-fixer fix --allow-risky=yes --using-cache no"

install:
	@docker-compose exec -u application app bash -c  "cd cidenet_api;composer cc"
	@docker-compose exec -u application app bash -c  "cd cidenet_api;composer install"

autoload:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo Autoload in cidenet_api && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_api;composer dump-autoload"

composer:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo $(ACTION) package $(PACKAGE) && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_api;composer $(ACTION) $(PACKAGE)"

artisan:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo run $(ACTION) in cidenet_api && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_api;php artisan $(ACTION)"

yarn:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo run $(ACTION) in cidenet_front && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_front;yarn $(ACTION)"


#Install complete the projects
install-all:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo run install node_modules in cidenet_front && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_front;yarn install"
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo run install vendor in cidenet_api && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_api;composer cc"
	@docker-compose exec -u application app bash -c  "cd cidenet_api;composer install"

#Run build production in cidenet_front
build-front:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo run build production in cidenet_front && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_front;yarn build"

#Run server production in cidenet_front
start-front:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo run server production in cidenet_front && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_front;yarn start"

serve-front: build-front start-front

# Run test in api
test:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo run test in cidenet_api && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_api;php artisan test"

# Create database and fake data in api
db-fake:
	@docker-compose exec -u application app bash -c  "tput setaf 2; echo run test in cidenet_api && tput sgr0;"
	@docker-compose exec -u application app bash -c  "cd cidenet_api;php artisan migrate:refresh --seed"

migration:
	@docker-compose exec -u application app bash -c  "cd cidenet_api;php artisan migrate"

download-submodules:
	@git submodule init
	@git submodule update
