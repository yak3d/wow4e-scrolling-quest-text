ADDON_NAME := ScrollingQuestText
FLAVOR ?= _classic_beta_
SRC_DIR := $(CURDIR)/ScrollingQuestText

ifeq ($(OS),Windows_NT)
	WOW_DIR ?= C:\\Program Files (x86)\\World of Warcraft
else
	UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	WOW_DIR ?= /Applications/World of Warcraft
else
	WOW_DIR ?= $(HOME)/Faugus/battlenet/drive_c/Program Files (x86)/World of Warcraft
endif
endif

DEST := $(WOW_DIR)/$(FLAVOR)/Interface/AddOns/$(ADDON_NAME)

ifeq ($(OS),Windows_NT)
	LINK_CMD := cmd //c mklink /J "$(shell cygpath -w "$(DEST)")" "$(shell cygpath -w "$(SRC_DIR)")"
else
	LINK_CMD := ln -sfn "$(SRC_DIR)" "$(DEST)"
endif

check-wow-dir:
	@test -d "$(WOW_DIR)" || { echo "WOW_DIR does not exist: $(WOW_DIR)"; exit 1; }

install: check-wow-dir
	mkdir -p "$(WOW_DIR)/$(FLAVOR)/Interface/AddOns"
	rm -rf "$(DEST)"
	$(LINK_CMD)
	@echo "Installed $(ADDON_NAME) -> $(DEST)"

uninstall: check-wow-dir
	rm -rf "$(DEST)"
	@echo "Removed $(DEST)"

.PHONY: install uninstall check-wow-dir
default: install

