include MANIFEST
TARGETS=$(dotfiles:%=$(HOME)/.%)
CWD=$(shell pwd)

$(HOME)/.%: %
	@if [ -e $@ ]; then mv $@ $@.bak; fi
	@echo "Installing $<"
	@ln -sf $(CWD)/$< $@

install: $(TARGETS)
	git submodule update --init --recursive
	vim +NeoBundleInstall +qall

uninstall:
	rm -f $(TARGETS)

update:
	git pull
	git submodule sync
	git submodule update --init --recursive
	vim +NeoBundleUpdate +qall

.PHONY: install uninstall update
