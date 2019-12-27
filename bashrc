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

alias compile_latex='latexmk -pvc -auxdir=tmp -outdir=tmp -pdf -halt-on-error -shell-escape'

alias pydebug="python -m ipdb -c continue"
alias load_csv='ipython -c "import sys; import pandas as pd; df = pd.read_csv(sys.argv[4]); print(df.head())" -i'
alias pip_update_all='pip freeze --local | grep -v "^\-e" | cut -d = -f 1  | xargs -n1 pip install --upgrade --user'

function pdfcrop_self {
    for var in "$@"; do
        echo "> $var"
        pdfcrop "$var" /tmp/foo.pdf && mv /tmp/foo.pdf "$var"
    done
}

function bak {
    for fname in "$@"; do
        fname_bak="${fname}.bak"
        echo "\"$fname\" -> \"$fname_bak\""
        mv "$fname" "$fname_bak"
    done
}

function retrieve_files {
    # input checks
    if [ $# -lt 2 ]; then
        echo "Usage: $0 <source> [<source>...] <target>"
        return 1
    fi

    source_dir_list=("$@")
    unset "source_dir_list[${#source_dir_list[@]}-1]"  # remove last argument

    target_dir="${@: -1}"  # target is last argument

    # prepare environment
    mkdir -p "$target_dir"

    # copy files
    for source_dir in "${source_dir_list[@]}"; do
        echo " > $source_dir"

        if [[ ! -d "$source_dir" ]]; then
            echo "\"$source_dir\" does not exist, skipping..."
            continue
        fi

        source_name=$(basename $(readlink -f "$source_dir"))
        for fname in $source_dir/*; do
            fname="$(basename $fname)"
            raw_fname="${fname%.*}"

            # robustly find file extension
            if [[ $fname == *.* ]] ; then
                fext=".${fname##*.}"
            else
                fext=""
            fi
            new_fname="${target_dir}/${raw_fname}_${source_name}${fext}"

            echo "$source_dir/$fname -> $new_fname"
            cp -r "$source_dir/$fname" "$new_fname"
        done
    done
}

function count_files {
    # check input
    if [[ $# -eq 0 ]]; then
        echo "Usage: ${FUNCNAME[0]} <directory>..."
        return 1
    fi

    # count files
    total=0
    for dir in "$@"; do
        # only consider directories
        if [[ ! -d "$dir" ]]; then
            continue
        fi

        # print count
        printf "%-25.25s : " "$dir"

        count=$(find "$dir" 2>/dev/null | wc -l)
        echo $count

        total=$((total + count))
    done
    echo -e "\nTotal: $total"
}
