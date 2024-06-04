test-help-message-header:
	test "$(shell $(MAKE) help | grep 'Available targets:')" = "Available targets:"

test-help-message-check:
	test "$(shell $(MAKE) help | grep '   check')" = "   check                   Runs the repository tests"

test-help-message-clean:
	test "$(shell $(MAKE) help | grep '   clean')" = "   clean                   Deletes all files created by Make"

test-help-message-help:
	test "$(shell $(MAKE) help | grep '   help')" =  "   help                    Provides this help message"

test-help-message-test:
	test "$(shell $(MAKE) help | grep '   test')" =  "   test                    Runs the repository tests"
