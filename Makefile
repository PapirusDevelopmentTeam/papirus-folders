PREFIX ?= /usr
PROGNAME := papirus-folders

all:

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 755 $(PROGNAME) $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(PREFIX)/share/bash-completion/completions
	install -m 644 completion/$(PROGNAME) \
		$(DESTDIR)$(PREFIX)/share/bash-completion/completions
	mkdir -p $(DESTDIR)$(PREFIX)/share/zsh/vendor-completions
	install -m 644 completion/_$(PROGNAME) \
		$(DESTDIR)$(PREFIX)/share/zsh/vendor-completions

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PROGNAME)
	rm -f $(DESTDIR)$(PREFIX)/share/bash-completion/completions/$(PROGNAME)
	rm -f $(DESTDIR)$(PREFIX)/share/zsh/vendor-completions/_$(PROGNAME)

_get_version:
ifndef TAG
	$(error TAG is not defined. Pass via "make release TAG=v0.1.2")
endif

release: _get_version
	git tag -f $(TAG)
	git push origin
	git push origin --tags

undo_release: _get_version
	-git tag -d $(TAG)
	-git push --delete origin $(TAG)


.PHONY: all install uninstall _get_version release undo_release
