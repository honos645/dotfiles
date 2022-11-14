DOT_SOURCES = $(wildcard $(MODULE_DIR)/*/dot.*)

define dot-rule
DOT_TARGETS += $1
$1: $2
	ln -sf $$< $$@
endef

$(foreach source,$(DOT_SOURCES), \
	$(eval \
		$(call \
			dot-rule, \
			$(patsubst dot.%, $(HOME)/.%, $(notdir $(source))), \
			$(source) \
		) \
	) \
)

.PHONY: dot-install
dot-install: $(DOT_TARGETS)
