# adaptivize-wallpaper — install helper
#
#   make install       symlink the script into ~/.local/bin (tracks git pulls)
#   make install-copy  copy the script into ~/.local/bin instead
#   make uninstall     remove it
#
# Override the destination:  make install BINDIR=/usr/local/bin

PROG   := adaptivize-wallpaper
PREFIX ?= $(HOME)/.local
BINDIR ?= $(PREFIX)/bin
SRC    := $(CURDIR)/$(PROG)
DEST   := $(BINDIR)/$(PROG)

.PHONY: help install link install-copy uninstall

help:
	@echo "Targets:"
	@echo "  make install       symlink $(PROG) into $(BINDIR) (updates on git pull)"
	@echo "  make install-copy  copy $(PROG) into $(BINDIR)"
	@echo "  make uninstall     remove $(PROG) from $(BINDIR)"
	@echo
	@echo "Current BINDIR: $(BINDIR)  (override with 'make install BINDIR=...')"

install: link

link: $(SRC)
	@mkdir -p "$(BINDIR)"
	@ln -sf "$(SRC)" "$(DEST)"
	@echo "Linked $(DEST) -> $(SRC)"

install-copy: $(SRC)
	@mkdir -p "$(BINDIR)"
	@install -m 0755 "$(SRC)" "$(DEST)"
	@echo "Copied $(SRC) -> $(DEST)"

uninstall:
	@rm -f "$(DEST)"
	@echo "Removed $(DEST)"
