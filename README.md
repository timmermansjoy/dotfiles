# dotfiles

This project is heavily inspired by @holman [dotfiles](https://github.com/holman/dotfiles). this project added [`oh-my-zsh`](https://ohmyz.sh/) and changed the whole structure

These dotfiles work both on MacOS and Linux (tested on Ubuntu)

## What is in this project

I'm a Machine learning engineer that mainly works with MacOS and Linux. I use a lot of different technologies and I want to be able to use them all in the same way. This project is a collection of configuration files that I use to make sure I can be up and running with a new machine in no time. It also contains some useful scripts and aliases that I use on a daily basis.

Feel free to use this project as a starting point for your own dotfiles. If you have any questions, feel free to open an issue.

## install

all you have to do is clone the reposetory in `~/.dotfiles` the script should do the rest

```sh
git clone https://github.com/timmermansjoy/dotfiles.git ~/.dotfiles
~/.dotfiles/scripts/dotfiles-install.sh
```

afterwards set zsh as the default shell if it isn't already.

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
- `Linux`: in `packages.txt` are programs that will get installed while running the script

## special files

- `*/index.zsh`: files called `index.zsh` get loaded into your environment when a shell is loaded
- `*/*.symlink`: files ending in `*.symlink` get symlinked (without the `*.symlink` extension) into your `$HOME` when you run `scripts/dotfiles-install.sh`
- `*/update.sh`: files called update.sh will get executed when running the `update` command

## highlights

Here are some of the most useful software included in this dotfiles:

- `zsh-syntax-highlighting` will highlight your commands to make sure they will work
- `zsh-autosuggestions` tries to autocomplete commadns you have input previously, you can complete with `right-arrow`
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
