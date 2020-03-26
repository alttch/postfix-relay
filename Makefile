all: build pub

build:
	docker build -t altertech/relay-gmail:1 .

pub:
	docker push altertech/relay-gmail:1

run:
	docker-compose up

test: build run
