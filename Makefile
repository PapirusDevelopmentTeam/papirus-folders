PREFIX ?= /usr
PROGNAME := papirus-folders

all:

install:
	install -m 755 -D -t $(DESTDIR)$(PREFIX)/bin $(PROGNAME)
	install -m 644 -D -t $(DESTDIR)$(PREFIX)/share/applications/ $(PROGNAME).desktop

post-install:
	# build cache database of MIME types handled by desktop files
	update-desktop-database -q || true

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(PROGNAME)
	rm -f $(DESTDIR)$(PREFIX)/share/applications/$(PROGNAME).desktop

push:
	git push origin

_get_version:
ifndef TAG
	$(error TAG is not defined. Pass via "make release TAG=v0.1.2")
endif

release: _get_version push
	git tag -f $(TAG)
	git push origin --tags

undo_release: _get_version
	-git tag -d $(TAG)
	-git push --delete origin $(TAG)


.PHONY: all install uninstall _get_version push release undo_release
