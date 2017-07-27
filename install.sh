#!/bin/zsh

old_pwd=$(pwd)
echo old_pwd: $old_pwd

cd $(dirname $0)
dotfiles_dir=$(pwd)

echo dotfiles_dir: $dotfiles_dir

cd $HOME
echo HOME: $HOME

clone_or_pull() {
  if [ ! -d $2 ]; then
    echo git clone $1 to $2
    git clone --quiet $1 $2
  else
    echo git pull $1 in $2
    cd $2
    git pull --quiet --rebase
    cd $HOME
  fi
}

clone_or_pull https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

echo symlink to vimrc
ln -sf $dotfiles_dir/vimrc $HOME/.vimrc

echo vim plugin install
echo | echo | vim +PluginInstall +qall &>/dev/null

clone_or_pull https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

echo symlink to zshrc
ln -sf $dotfiles_dir/zshrc $HOME/.zshrc

echo symlink to smth.zsh-theme
ln -sf $dotfiles_dir/smth.zsh-theme $HOME/.oh-my-zsh/custom/smth.zsh-theme

cd $old_pwd

echo done
