VIM + PLUGINS INSTALLATION

Based on http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

git clone http://github.com/ifshiryaev/dotfiles.git <path to repo>
ln -s <path to repo>/vim ~/.vim 
ln -s <path to repo>/vimrc ~/.vimrc
cd <path to repo>
git submodule init
git submodule update


INSTALL VIM PLUGINS

Launch vim and type :PluginsInstall

To get YouCompleteMe working you should compile ycm-core (see documentation):

Install development tools and CMake:
sudo apt-get install build-essential cmake

Make sure you have Python headers installed:
sudo apt-get install python-dev python3-dev

Compiling YCM with semantic support for C-family languages:
cd <path to repo>/vim/bundle/YouCompleteMe
./install.py --clang-completer


WHEN NEW SUBMODULE IS INSTALLED IN REMOTE

git submodule update --init --recursive

UPDATE ONE BUNDLED SUBMODULE

cd <path to submodule>
git checkout master
git pull

UPDATE ALL BUNDLED SUBMODULES

git submodule --recursive --remote

Not recommended, because this way all submodules are updated to the latest version on remote, 
not to the pinned (worked and tested) version


INSTALL A NEW BUNDLE

git submodule add http://github.com/tpope/vim-fugitive.git vim/bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."


TO REMOVE A SUBMODULE

git submodule deinit <path to submodule>
rm -rf .git/modules/<path to submodule>
git rm -f <path to submodule> 
# Note: no trailing slash in the end of <path to submodule>

TMUX INSTALLATION

Create simlink to tmux.conf file:

ln -s <path to repo>/tmux ~/.tmux
ln -s <path to repo>/tmux.conf ~/.tmux.conf
