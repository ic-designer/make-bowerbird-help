# Constants
WORKDIR_DEPS ?= $(error ERROR: Undefined variable WORKDIR_DEPS)

# Load Bowerbird Dependency Tools
BOWERBIRD_DEPS.MK := $(WORKDIR_DEPS)/bowerbird-deps/bowerbird_deps.mk
$(BOWERBIRD_DEPS.MK):
	@curl --silent --show-error --fail --create-dirs -o $@ -L \
https://raw.githubusercontent.com/ic-designer/make-bowerbird-deps/\
main/src/bowerbird-deps/bowerbird-deps.mk
include $(BOWERBIRD_DEPS.MK)


# Load Dependencies
$(call bowerbird::git-dependency,$(WORKDIR_DEPS)/bowerbird-githooks,\
		https://github.com/ic-designer/make-bowerbird-githooks.git,main,bowerbird.mk)
$(call bowerbird::git-dependency,$(WORKDIR_DEPS)/bowerbird-test,\
		https://github.com/ic-designer/make-bowerbird-test.git,main,bowerbird.mk)
