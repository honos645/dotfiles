GIT_DIR = $(HOME)

INSTALL_TARGETS += git-install

.PHONY: git-install
git-install:
	touch $(HOME)/.gitconfig.local
	echo -e "[user]\n\tname = \n\temail = " >> $(HOME)/.gitconfig.local

.PHONY: git-clean
git-clean:

