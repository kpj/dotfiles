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

Quickstart:

```bash
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply kpj
```

Or:

```bash
# ... install chezmoi

# retrieve dotfiles
$ chezmoi init git@github.com:kpj/dotfiles.git

# check which changes would be made
$ chezmoi diff

# apply them
$ chezmoi apply -v
```

### Update dotfiles from remote

```bash
$ chezmoi update -v
```
