.DEFAULT_GOAL := help
.PHONY: help clear-pyc

build-container-image: ## Creates ubuntu container
	@docker build ../ -f Dockerfile -t testing

start: build-container-image ## Roda a aplicação
	@docker run -it --rm testing bash

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | grep ^help -v | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
