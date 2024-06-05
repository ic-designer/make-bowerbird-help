# Config
.SUFFIXES:
MAKEFLAGS += --jobs
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
MAKEFLAGS += --no-print-directory
MAKEFLAGS += --shuffle
MAKEFLAGS += --warn-undefined-variables

# Constants
NAME := bowerbird-help
VERSION := $(shell git describe --always --dirty --broken 2> /dev/null)
WORKDIR_ROOT := $(CURDIR)/.make
WORKDIR_TEST = $(WORKDIR_ROOT)/test/$(NAME)/$(VERSION)
WORKDIR_DEPS = $(WORKDIR_ROOT)/deps

# Includes
include make/deps.mk
include bowerbird.mk

 # Targets
.NOTPARALLEL: private_clean
.PHONY: private_clean
private_clean:
	@echo "INFO: Cleaning directories:"
	@$(if $(wildcard $(WORKDIR_ROOT)), rm -rfv $(WORKDIR_ROOT))
	@$(if $(wildcard $(WORKDIR_TEST)), rm -rfv $(WORKDIR_TEST))
	@echo "INFO: Cleaning complete."
	@echo

$(eval $(call bowerbird::generate-test-runner,private_test,test/,test*.mk))
