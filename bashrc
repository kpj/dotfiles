# link this file in ~/.bashrc using 'source ~/.bashrc_custom'


##################
# Custom Exports #
##################

export EDITOR=vim


##################
# Useful Aliases #
##################

alias ll='ls -lh'
alias ..='cd ..'

alias mpl='mpv --no-audio-display -playlist <(find "$PWD" -type f | shuf)'
alias uncl='unclutter -idle 1'
alias slideshow='feh -FZ *'
