EMACS_DIR := $(HOME)/.emacs.d

INSTALL_TARGETS += emacs-install
REMOVE_TARGETS += emacs-clean

emacs-install: init
	#emacs --batch -f batch-byte-compile $(EMACS_DIR)/init.el

.PHONY: emacs-clean
emacs-clean:
	rm -rf $(HOME)/.emacs.d
