PREFIX ?= /usr
PROGNAME := papirus-folders

all:

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 755 $(PROGNAME) $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PROGNAME)

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
