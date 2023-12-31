# !!! Only for contributors & maintainers !!!
# The commands in this file are only necessary to maintain the repository examples
# Each example project in `./examples` contains its own Makefile with specific
# commands for it.

project_name = melange-examples

DUNE = opam exec -- dune

.DEFAULT_GOAL := help

.PHONY: help
help: ## Print this help message
	@echo "List of available make commands";
	@echo "";
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}';
	@echo "";

.PHONY: create-switch
create-switch: ## Create opam switch
	opam switch create . 5.1.0 -y --deps-only --no-install

.PHONY: init
init: create-switch install ## Configure everything to develop this repository in local

.PHONY: install
install: ## Install development dependencies
	make -C examples/1-node install
	make -C examples/2-react install
	make -C examples/3-vite install

.PHONY: build
build: ## Build all examples
	make -C examples/1-node build
	make -C examples/2-react build
	make -C examples/3-vite build

.PHONY: test
test: ## Test all examples
	make -C examples/1-node test
	make -C examples/2-react test
	make -C examples/3-vite test

.PHONY: clean
clean: ## Clean all examples
	make -C examples/1-node clean
	make -C examples/2-react clean
	make -C examples/3-vite clean

.PHONY: format
format: ## Format the codebase with ocamlformat
	$(DUNE) build @fmt --auto-promote

.PHONY: format-check
format-check: ## Checks if format is correct
	$(DUNE) build @fmt

