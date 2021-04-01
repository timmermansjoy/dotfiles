# dotfiles

This project is heavily inspired by @holman [dotfiles](https://github.com/holman/dotfiles). this project added [`oh-my-zsh`](https://ohmyz.sh/) and changed the whole structure

## install

install zsh

```sh
apt update
apt install zsh
```

```sh
git clone https://github.com/timmermansjoy/dotfiles.git ~/.dotfiles
~/.dotfiles/scripts/dotfiles-install.sh
```

afterwards set zsh as the default shell

```sh
chsh -s $(which zsh)
```

## folders

The most notable folders are:

- `scripts`: scripts that you can run manually, to either install this dotfiles project or install/update the dependencies it specifies
- `basic`: each subfolder contains configuration for some basic component (like a default text editor or a default shell)
  - `bin/`: files are added to `$PATH` and made available everywhere, and are executed in a child process.
  - `shell`: configurations for my shell ([zsh](http://zsh.sourceforge.net/))
- `specific`: each subfolder contains configuration for some specific technology (like Git, Pyhton, ...):
  - `oh-my-zsh`: my configuration for [oh-my-zsh](https://ohmyz.sh/)

## special files

- `*/index.zsh`: files called `index.zsh` get loaded into your environment when a shell is loaded
- `*/*.symlink`: files ending in `*.symlink` get symlinked (without the `*.symlink` extension) into your `$HOME` when you run `scripts/dotfiles-install.sh`

## highlights

Here are some of the most useful software included in this dotfiles:

- utilities:
  - `weather [place]` shows the weather for that place, default is Hasselt
- commands:
  - `e`: opens the selected favorite text editor
  - `update`: runs all `*/update.sh` files
- functions:
  - `extract <file>`: knows how to unzip several formats
- aliases:
  - `dotfiles`: opens the favorite editor and this folder. if installed propperly

## references

- https://github.com/holman/dotfiles
