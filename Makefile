LINK := ln -fs

USE_VIM = yes
USE_MPD = yes
USE_BEET = yes
USE_X = yes
USE_BASH = yes
USE_XBINDKEYS = yes
USE_MUTT = yes
USE_TMUX = yes
USE_IPYTHON = yes
USE_I3STATUS = yes

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
ifeq ($(USE_XBINDKEYS),yes)
	$(LINK) $(PWD)/xbindkeysrc $(HOME)/.xbindkeysrc
endif
ifeq ($(USE_MUTT),yes)
	$(LINK) $(PWD)/muttrc $(HOME)/.muttrc
endif
ifeq ($(USE_TMUX),yes)
	$(LINK) $(PWD)/tmux $(HOME)/.tmux.conf
endif
ifeq ($(USE_IPYTHON),yes)
	$(LINK) $(PWD)/ipython_config.py $(HOME)/.ipython/profile_default/ipython_config.py
endif
ifeq ($(USE_I3STATUS),yes)
	$(LINK) $(PWD)/i3status_config $(HOME)/.config/i3status/config
endif
