.DEFAULT_GOAL := help
.PHONY: help
PORT=8000
PACKAGES := ./packages
SCRIPTS := ./scripts

welcome:
	@printf "\033[0;31m \n"
	@printf "\033[0;31m     ____  _      __                ____            _ __            		\n"
	@printf "\033[0;31m    / __ \\(_)____/ /__________     /  _/___ _____  (_) /____  _____ 	\n"
	@printf "\033[0;31m   / / / / / ___/ __/ ___/ __ \\    / // __ \`/ __ \\/ / __/ _ \\/ ___/ 	\n"
	@printf "\033[0;31m  / /_/ / (__  ) /_/ /  / /_/ /  _/ // /_/ / / / / / /_/  __/ /     		\n"
	@printf "\033[0;31m /_____/_/____/\\__/_/   \\____/  /___/\\__, /_/ /_/_/\\__/\\___/_/      \n"
	@printf "\033[0;31m                                    /____/                          		\n"
	@printf "\033[0;31m \n"
	

start: ## Starts CLI
	@pip install -r pycli/requirements.txt
	@clear
	@make -s welcome
	@printf "\033[0m 🔥😈 The tool to ignite your dev environment 😈🔥\n"
	@printf "\033[0m\n"
	@python pycli start
	@clear
	@make welcome
	@printf "\n\n"
	@printf "\033[1;32m Please restart your computer to see the changes 🎉\n\n"
	@printf "\033[0m\n"

run-test-docker-image: build-test-docker-image ## Starts the application in test container
	@docker run -it --rm  --name debian-distro-ignter -p ${PORT}:8080 dmscn/debian-distro-ignter 

build-test-docker-image: ## Creates ubuntu test container
	@docker build -t dmscn/debian-distro-ignter .
                                                               
help: welcome
	@printf "\033[1;33m This are the commands you can use 🤔\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | grep ^help -v | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'