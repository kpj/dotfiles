LINK := ln -fs

USE_VIM = yes
USE_MPD = yes
USE_BEET = yes

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
