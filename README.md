# My Dotfiles
These are the dotfiles for my (Arch) Linux setup (optionally) deployed and managed
with [GNU Stow](https://www.gnu.org/software/stow/).

![alt text](previews/1.png "Desktop Preview")

# Features
* [calcurse](https://calcurse.org/)
* [compton](https://github.com/chjj/compton)
* [dunst](https://dunst-project.org/)
* [herbstluftwm](https://herbstluftwm.org/)
* [mpd](https://www.musicpd.org/)
* [ncmpcpp](https://rybczak.net/ncmpcpp/)
* [neomutt](https://neomutt.org/)
* [nvim](https://neovim.io/)
* [ranger](https://ranger.github.io/)
* [rofi](https://github.com/davatorium/rofi)
* [sxhkd](https://github.com/baskerville/sxhkd)
* [tmux](https://github.com/tmux/tmux/wiki)
* [xorg](https://www.x.org/wiki/)
* [zathura](https://pwmt.org/projects/zathura/)
* [zsh](https://www.zsh.org/)

# Usage

You have two options. Simply copy-pasta what you need from the relevant files,
or you can install and use [GNU Stow](https://www.gnu.org/software/stow/). If
you are unfamiliar with `stow` then follow the instructions below.

The files in this repo are organized as such so as to make deployment
convenient. Clone this repo to your home directory, enter the root of the 
directory and then run the following command:

```bash
$ stow <dir>
```

This will deploy the config files for application '`dir`' by creating symlinks.

__NOTE__: Deleting the original file in the 'repo' directory will break
the link without destroying the deployed link. Basically, always delete both
files when doing cleanup.
