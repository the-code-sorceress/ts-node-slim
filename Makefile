.DEFAULT_GOAL := restart

.PHONY: restart
restart: down up

.PHONY: up
up:
	$(MAKE) node_modules
	docker-compose up -d 
	$(MAKE) logs

.PHONY: down
down:
	docker-compose down --remove-orphans

.PHONY: shell
shell:
	docker exec -it ts-node-slim-compiler sh

.PHONY: logs
logs:
	docker-compose logs -f --tail=100

node_modules:
	docker run --rm -v "$(shell pwd)":/app -w "/app" node:15.3-alpine3.12 npm install

.PHONY: hello-world
hello-world:
	docker exec -it ts-node-slim-compiler sh -c "node ./dist/index.js"

.PHONY: test
test:
	docker exec -it ts-node-slim-compiler sh -c "npm run test"