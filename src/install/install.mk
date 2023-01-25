DOT_SOURCES = $(wildcard $(MODULE_DIR)/*/dot.*)

define dot-rule
DOT_TARGETS += $1
$1: $2
	$(call backup,$2)
	ln -sf $$< $$@
endef

ifeq ($(shell basename `echo $(SHELL)`),bash)
	INSTALL_TARGETS += bash-install
	REMOVE_TARGETS += bash-clean
	DOT_SOURCES += $(wildcard $(SOURCE_DIR)/bash/dot.*) $(wildcard $(SOURCE_DIR)/shell/dot.*)
else
	INSTALL_TARGETS += bash-install
	REMOVE_TARGETS += bash-clean
	DOT_SOURCES += $(wildcard $(SOURCE_DIR)/bash/dot.*) $(wildcard $(SOURCE_DIR)/shell/dot.*)
endif

$(foreach source,$(DOT_SOURCES), \
	$(eval \
		$(call \
			dot-rule, \
			$(patsubst dot.%, $(HOME)/.%, $(notdir $(source))), \
			$(source) \
		) \
	) \
)


#.PHONY: dot-install
dot-install: init $(DOT_TARGETS)
	@echo "### dot-install end ###"
