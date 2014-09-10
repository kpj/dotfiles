LINK := ln -fs

USE_VIM = yes
USE_MPD = yes
USE_BEET = yes
USE_X = yes
USE_BASH = yes

.PHONY: install

install:
ifeq ($(USE_VIM),yes)
	$(LINK) $(PWD)/vimrc $(HOME)/.vimrc
endif
ifeq ($(USE_MPD),yes)
	$(LINK) $(PWD)/mpdconf $(HOME)/.mpdconf
endif
ifeq ($(USE_BEET),yes)
	$(LINK) $(PWD)/beetsconf $(HOME)/.config/beets/config.yaml
endif
ifeq ($(USE_X),yes)
	$(LINK) $(PWD)/Xdefaults $(HOME)/.Xdefaults
endif
ifeq ($(USE_BASH),yes)
	$(LINK) $(PWD)/bashrc $(HOME)/.bashrc_custom
endif
