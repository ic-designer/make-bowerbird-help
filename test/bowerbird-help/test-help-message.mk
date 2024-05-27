# Constants
WORKDIR_TEST ?= $(error ERROR: Undefined variable WORKDIR_TEST)
override TEST_FILE.MK := $(lastword $(MAKEFILE_LIST))

#Targets
PHONY: test-help-message
test-help-message: \
		test-help-message-header \
		test-help-message-check \
		test-help-message-clean \
		test-help-message-help \
		test-help-message-test \

PHONY: test-help-message-header
test-help-message-header:
	@test "$(shell $(MAKE) help | grep 'Available targets:')" = "Available targets:"

PHONY: test-help-message-check
test-help-message-check:
	@test "$(shell $(MAKE) help | grep '   check')" = "   check                   Runs the repository tests"

PHONY: test-help-message-clean
test-help-message-clean:
	@test "$(shell $(MAKE) help | grep '   clean')" = "   clean                   Deletes all files created by Make"

PHONY: test-help-message-help
test-help-message-help:
	@test "$(shell $(MAKE) help | grep '   help')" =  "   help                    Provides this help message"

PHONY: test-help-message-test
test-help-message-test:
	@test "$(shell $(MAKE) help | grep '   test')" =  "   test                    Runs the repository tests"
