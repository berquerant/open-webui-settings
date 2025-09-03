.PHONY: default
default: init up ## Entry point

.PHONY: help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: init
init: git-init setup build ## Initialize and build images

##@ Build

.PHONY: git-init
git-init: ## Initialize git submodules
	git submodule update --init --recursive

.PHONY: setup
setup: ## Prepare to build and start services
	./setup.sh

.PHONY: build
build: ## Build images
	./setup-mcp.sh
	./build.sh

##@ Services

.PHONY: reload
reload: down up ## Reload containers

.PHONY: up
up: ## Start services
	./run.sh up -d --remove-orphans

.PHONY: down
down: ## Stop services
	./run.sh down

##@ Clean

.PHONY: destroy
destroy: clean purge ## Remove generated changes and images

.PHONY: clean
clean: ## Remove generated sources
	./clean.sh

.PHONY: purge
purge: ## Remove created images
	./purge.sh
