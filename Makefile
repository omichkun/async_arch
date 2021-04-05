down:
	docker-compose down

restart:
	docker-compose down && docker-compose up -d

up:
	docker-compose up -d

build:
	docker-compose build

ps:
	docker-compose ps
