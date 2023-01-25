REMOVE_TARGETS += bash-clean
DOT_TARGETS +=
BASH_TARGETS += $(HOME)/.bashrc $(HOME)/.bash_profile

bash-install: init
	. $(HOME)/.bash_profile

.PHONY: bash-clean
bash-clean:
	rm -rf .bashrc .bash_profile
