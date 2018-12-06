.DEFAULT_GOAL := help
.PHONY: help
PACKAGES := ./packages
SCRIPTS := ./scripts

welcome:
	@printf "\033[0;31m																													\n"
	@printf "\033[0;31m	 (                        (                             \n"
	@printf "\033[0;31m )\ )          )          )\ )                )          \n"
	@printf "\033[0;31m(()/( (     ( /((        (()/((  (      (  ( /(  (  (    \n"
	@printf "\033[0;31m /(_)))\ (  )\())(   (    /(_))\))( (   )\ )\())))\ )(   \n"
	@printf "\033[0;31m(_))_((_))\(_))(()\  )\  (_))((_))\ )\ |(_|_))//((_|()\  \n"
	@printf "\033[0;31m |   \(_|(_) |_ ((_)((_) |_ _|(()(_)(_/((_) |_(_))  ((_) \n"
	@printf "\033[0;31m | |) | (_-<  _| '_/ _ \  | |/ _\` | ' \)) |  _/ -_)| '_|\n"
	@printf "\033[0;31m |___/|_/__/\__|_| \___/ |___\__, |_||_||_|\__\___||_|   \n"
	@printf "\033[0;31m	                     |___/                      				\n"
	@printf "\033[0m\n"
	

start: welcome ## Starts CLI
	@printf "\033[0m 🔥😈 The tool to ignite your dev environment 😈🔥\n"
	@printf "\033[0m\n"
	@python pycli start
	@printf "\n\n"
	@printf "\033[1;32m Please restart your computer to see the changes  🎉\n\n"
	@printf "\033[0m\n"

install-packages: ## Install apt packages
	@chmod +x ${SCRIPTS}/apt-packages-installation.sh
	@sh ${SCRIPTS}/apt-packages-installation.sh

install-nodejs: ## Start NodeJS installation
	@chmod +x ${SCRIPTS}/nodejs-installation.sh
	@sh ${SCRIPTS}/nodejs-installation.sh

install-python: ## Start Python environment installation
	@chmod +x ${SCRIPTS}/python-installation.sh
	@sh ${SCRIPTS}/python-installation.sh

install-docker: ## Start Docker environment installation
	@chmod +x ${SCRIPTS}/docker-installation.sh
	@sh ${SCRIPTS}/docker-installation.sh

install-vscode-extensions:
	@sh ${SCRIPTS}/vscode-install-extensions.sh
                                                               
help: welcome
	@printf "\033[1;33m This are the commands you can use 🤔\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | grep ^help -v | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'