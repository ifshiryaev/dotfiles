VIM + PLUGINS INSTALLATION

Based on http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

git clone http://github.com/ifshiryaev/dotfiles.git <path to repo>/dotfiles
ln -s <path to repo>/dotfiles/vim ~/.vim 
ln -s <path to repo>/dotfiles/vimrc ~/.vimrc
cd <path to repo>/dotfiles
git submodule init
git submodule update

WHEN NEW SUBMODULE IS INSTALLED IN REMOTE

git submodule update --init --recursive

UPDATE ALL BUNDLED MODULES

git submodule foreach git pull origin master

INSTALL A NEW BUNDLE

git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."

TO REMOVE A SUBMODULE

    Delete the relevant section from the .gitmodules file.
    Delete the relevant section from .git/config.
    Run git rm --cached path_to_submodule (no trailing slash).
    Commit and delete the now untracked submodule files.
