.PHONY: install clean remove help update list

TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
MODULE_DIR = $(TOP_DIR)/modules
SOURCE_DIR = $(TOP_DIR)/src

-include $(SOURCE_DIR)/*/*.mk
-include $(MODULE_DIR)/*/*.mk

DOT_TARGETS +=
INSTALL_TARGETS +=
REMOVE_TARGETS +=

list:
	@echo "help"

install: $(INSTALL_TARGETS) $(DOT_TARGETS)
	ln -snf $(TOP_DIR) $(HOME)/.dotfiles

clean:
	@echo "clean dot file in home directory..."
	rm -f $(HOME)/.dotfiles $(DOT_TARGETS)

remove:	$(REMOVE_TARGETS)
	rm -f $(HOME)/.dotfiles $(DOT_TARGETS)

update:
	@echo "update"

#.PHONY: test
test:
	@echo "$(DOT_TARGETS)"
