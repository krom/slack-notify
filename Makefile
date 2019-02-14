
DOCKER_REGISTRY ?= "kudlayry"

.PHONY: build
build:
	mkdir -p bin/
	go build -o bin/slack-notify ./main.go

.PHONY: docker-build
docker-build:
	docker build -t $(DOCKER_REGISTRY)/slack-notify:latest .

.PHONY: docker-push
docker-push:
	docker push $(DOCKER_REGISTRY)/slack-notify

