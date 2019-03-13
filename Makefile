include scripts/mk/*.mk

.DEFAULT_GOAL := help

## Setup and install all repositories.
install: git-submodule-update install-components install-www docker-compose-up print-info

## Install stuar.tc - frontend node modules.
install-components:
	@$(call title,Installing stuar.tc - components)
	@$(call exec,docker-compose run --rm components npm i)
	@$(call exec,docker-compose run --rm components npm rebuild node-sass)

## Install stuar.tc - frontend node modules.
install-www:
	@$(call title,Installing stuar.tc - frontend)
	@$(call exec,docker-compose run --rm www npm i)

## Start the server(s).
up: docker-compose-up docker-compose-logs

## Stop the server(s).
down: docker-compose-down

## Restart the server(s).
restart: docker-compose-restart docker-compose-logs

## Test all repositories.
test: test-components test-www

## Test stuar.tc - components.
test-components:
	@$(call title,Testing stuar.tc - components)
	@$(call exec,docker-compose run --rm components npm run test)

## Test stuar.tc - frontend.
test-www:
	@$(call title,Testing stuar.tc - frontend)
	@$(call exec,docker-compose run --rm www npm run test)

## Stop and clean the server(s).
clean: down docker-compose-kill
	@$(call title,Deleting build artefacts and data)
	@$(call exec,rm -rf */.nuxt)

## Stop, clean and re-install the server(s).
clean-install: clean clean-modules install

## Stop, clean, re-install and restart the server(s).
clean-install-up: clean-install up

clean-modules:
	@$(call title,Deleting Node modules)
	@$(call exec,rm -rf */node_modules)

## Stop, clean and restart the server(s).
clean-restart: clean up

## Show server log(s).
logs: docker-compose-logs

print-info:
	@$(call title,stuart.tc - development environment)
	@$(call print,Welcome to the stuar.tc development environment.\n)
	@# @TODO - Add a check for server status.
	@$(call print,Your site may still be bootstrapping.)
	@$(call print,It is recommended to watch the logs using the following command:\n)
	@$(call command,make logs)

	@$(call title,Local development URLs)
	@$(call print,www: http://stuar.tc.localhost)
