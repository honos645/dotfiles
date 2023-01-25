TOP_BACKUP_DIR := $(HOME)/.dotfiles/.backup
TODAY = ${shell date '+%Y-%m-%d'}
BACKUP_DIR = $(TOP_BACKUP_DIR)/$(TODAY)

define backup
	mkdir -p $(BACKUP_DIR)
	if [ $(shell ls -t $(TOP_BACKUP_DIR)/ | head -2 | wc -l) -eq 2 ]; then \
		cp -rd $(TOP_BACKUP_DIR)/$(shell ls -t $(TOP_BACKUP_DIR) | head -2 | sort | head -1)/* $(BACKUP_DIR)/ ;\
	fi ;\
	cp -ruf $(HOME)/$1 $(BACKUP_DIR)/`echo "$(HOME)/$1" | sed -e 's/\//-/g'` ;\
	rm -rf $(HOME)/$1
endef

