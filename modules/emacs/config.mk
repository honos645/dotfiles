EMACS_DIR = $(HOME)/.emacs.d

INSTALL_TARGETS += emacs-install
REMOVE_TARGETS += emacs-clean
DOT_TARGETS += $(EMACS_DIR)/init.elc $(EMACS_DIR)/init.el

.PHONY: emacs-install
emacs-install:
	mkdir -p $(EMACS_DIR)/backup
	ln -snf $(MODULE_DIR)/emacs/init.el $(EMACS_DIR)/init.el
	emacs --batch -f batch-byte-compile $(EMACS_DIR)/init.el

.PHONY: emacs-clean
emacs-clean:
	rm -rf $(HOME)/.emacs.d
