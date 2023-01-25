.PHONY: clean help update 

TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
MODULE_DIR := $(TOP_DIR)/modules
SOURCE_DIR := $(TOP_DIR)/src

-include $(SOURCE_DIR)/*/*.mk
-include $(MODULE_DIR)/*/*.mk

DOT_TARGETS +=
INSTALL_TARGETS +=
REMOVE_TARGETS +=

.PHONY: list
list:
	@echo "help"

#.PHONY: init
init:
	ln -snf $(TOP_DIR) $(HOME)/.dotfiles
	mkdir -p $(TOP_DIR)/.backup

install: init $(DOT_TARGETS) $(INSTALL_TARGETS)

clean:
	@echo "clean dot file in home directory..."
	rm -rf $(HOME)/.dotfiles $(DOT_TARGETS)

remove:	$(REMOVE_TARGETS)
	rm -rf $(HOME)/.dotfiles $(DOT_TARGETS)

update:
	@echo "update"

#.PHONY: test
TEMP = tomato
test: init
	$(call _test,.profile)
