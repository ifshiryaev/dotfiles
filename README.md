# VIM + PLUGINS INSTALLATION

## Install vim
```sh
sudo apt install vim
```
*Note that in order to be able to copy text from vim you need vim to be compiled with +clipboard option (:version to check).
For example, install vim-gtk3 under Ubuntu 16.04 as by default it provides vim version without clipboard support* 

## Isntall vim config and submodules
[Based on](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
```sh
git clone http://github.com/ifshiryaev/dotfiles.git /path/to/repo
ln -s /path/to/repo/vim ~/.vim
ln -s /path/to/repo/vimrc ~/.vimrc
cd /path/to/repo
git submodule init
git submodule update
```

## Install vim plugins
1. Launch vim and type :PluginsInstall
2. To get YouCompleteMe working you should compile ycm-core (see documentation):
  * Install development tools and CMake:
```sh
sudo apt-get install build-essential cmake
```
  * Make sure you have Python headers installed:
```sh
sudo apt-get install python-dev python3-dev
```
  * Compiling YCM with semantic support for C-family languages:
```sh
cd /path/to/repo/vim/bundle/YouCompleteMe
python3 ./install.py --clang-completer
```
3. To get TagBar working install (if not installed) exuberant-ctags:
```
sudo apt-get install exuberant-ctags
```

### When new submodule is installed in remote
```sh
   git submodule update --init --recursive
```
### Update one bundled submodule
```sh
cd /path/to/submodule
git checkout master
git pull
```

### Update all bundled submodules
```sh
git submodule update --recursive --remote
```
*Not recommended, because this way all submodules are updated to the latest version on remote,
not to the pinned (worked and tested) version*

### Install a new bundle
```sh
git submodule add http://github.com/tpope/vim-fugitive.git vim/bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

### To remove a submodule
```sh
git submodule deinit /path/to/submodule
rm -rf .git/modules/path/to/submodule
git rm -f /path/to/submodule
```
 *Note: no trailing slash in the end of /path/to/submodule*

# TMUX INSTALLATION
Create simlink to tmux.conf file:
```sh
ln -s /path/to/repo/tmux ~/.tmux
ln -s /path/to/repo/tmux.conf ~/.tmux.conf
```
*To activate vim-like movements with tmux-yank plugin append the following to the ~/.bashrc file:*
```sh
export VISUAL=vim
export EDITOR="$VISUAL"
```
*If "tmux-yank dependencies not installed!" appears when coping from a terminal with y or Shift+y:*
```sh
sudo apt install xclip
```


# MISC

## INSTALL gnome-terminal-colors-solarized to activate solarized theme on vim
```sh
 git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
 cd gnome-terminal-colors-solarized
 ./install.sh
```
Append to the ~/.bashrc file:
```sh
eval `dircolors /path/to/dircolorsdb`
export TERM=screen-256color-bce
```
## INSTALL YAPF - python code style formatting utility
```sh
pip install yapf
```
## INSTALL clang-format - C/C++ code formatting utility
### Ubuntu
```sh
sudo apt install clang-format
```
### ArchLinux
[See AUR for more info](https://aur.archlinux.org/packages/clang-format-all-git/)
