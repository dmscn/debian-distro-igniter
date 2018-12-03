.DEFAULT_GOAL := help
.PHONY: help
PACKAGES := /packages

welcome:
	@printf "\033[35m    ____  _      __                _____ __             __           	\n"
	@printf "\033[35m   / __ \(_)____/ /__________     / ___// /_____ ______/ /____  _____	\n"
	@printf "\033[35m  / / / / / ___/ __/ ___/ __ \    \__ \/ __/ __ \`/ ___/ __/ _ \/ ___/	\n"
	@printf "\033[35m / /_/ / (__  ) /_/ /  / /_/ /   ___/ / /_/ /_/ / /  / /_/  __/ /    	\n"
	@printf "\033[35m/_____/_/____/\__/_/   \____/   /____/\__/\__,_/_/   \__/\___/_/     	\n"
	@printf "\033[m																		  	\n"
                                                               
help: welcome
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | grep ^help -v | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'