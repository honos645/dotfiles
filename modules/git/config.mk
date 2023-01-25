INSTALL_TARGETS += git-install
REMOVE_TARGETS += git-clean

git-install: init
	@touch $(HOME)/.gitconfig.local
	@echo -e "[user]\n\tname = \n\temail = " >> $(HOME)/.gitconfig.local

.PHONY: git-clean
git-clean:
	@rm -rf $(HOME)/.gitconfig
