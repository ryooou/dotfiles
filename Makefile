# Variables
DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
BACKUP_DIR := $(DOTPATH)/var/backups/$(shell date +'%Y-%m-%d/%H%M%S')
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore .travis.yml
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

# Targets
all:

list: ## Show dotfiles.
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

init: ## Setup this dotfile.
	@bash $(DOTPATH)/etc/scripts/init.sh
	@make fresh

fresh: ## Fresh symlinks and Homebrew.
	@bash $(DOTPATH)/etc/scripts/symlink.sh $(DOTPATH)/zsh/.zprezto $(HOME)/.zprezto $(BACKUP_DIR)
	@$(foreach val, $(DOTFILES), bash $(DOTPATH)/etc/scripts/symlink.sh $(abspath $(val)) $(HOME)/$(val) $(BACKUP_DIR);)
	@brew bundle --global

update-submodules: ## Update submodules.
	@git submodule update --init --recursive

help: ## Show help for this dotfiles.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
