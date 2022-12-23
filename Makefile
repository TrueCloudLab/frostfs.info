#!/usr/bin/make -f
SHELL = bash

PUBDIR = public
HUGO_VERSION = 0.91.0
HUGO_BIN ?= bin/hugo

.PHONY: all clean
all: public

bin/hugo:
	@wget -q https://github.com/gohugoio/hugo/releases/download/v$(HUGO_VERSION)/hugo_extended_$(HUGO_VERSION)_Linux-64bit.tar.gz -O - |\
	tar -xz -C bin/ hugo;

clean:
	@rm -rf $(PUBDIR)
	@rm -rf tmp
	@rm -rf bin/hugo

public: submodules bin/hugo
	@$(HUGO_BIN)

server: submodules bin/hugo
	@$(HUGO_BIN) server --disableFastRender

submodules:
	@git submodule init
	@git submodule update --recursive --remote
