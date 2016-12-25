# link this file in ~/.bashrc using 'source ~/.bashrc_custom'


##################
# Custom Exports #
##################

export EDITOR=vim


###########
# History #
###########

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend


##################
# Useful Aliases #
##################

alias ll='ls -lh'
alias ..='cd ..'

alias mpl='mpv --no-audio-display -playlist <(find "$PWD" -type f | shuf)'
alias uncl='unclutter -idle 1'
alias slideshow='feh -FZ *'

function compile_latex() {
    # consider latexmk -pvc
    fname="${1-main.tex}"
    cmd="latexmk -pdf -halt-on-error -shell-escape "$fname""
    $cmd
    while inotifywait -e modify "$fname" ; do $cmd ; done
}
