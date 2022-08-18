# dotfiles

Dotfiles organized using [chezmoi](https://www.chezmoi.io/).


## Usage

### Update existing dotfile

```bash
# add a new file
$ chezmoi add <file>

# edit files
$ chezmoi edit <file>
$ chezmoi -v apply # -n

# commit changes
$ chezmoi cd
$ git diff
$ git add <file>
$ git commit
$ git push
```

### Use dotfiles on new machine

```bash
# retrieve dotfiles
$ chezmoi init https://github.com/kpj/dotfiles.git

# check which changes would be made
$ chezmoi diff

# apply them
$ chezmoi apply -v
```

### Update dotfiles from remote

```bash
$ chezmoi update -v
```
