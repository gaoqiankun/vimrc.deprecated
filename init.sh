#! /usr/bin/env bash

dir=$(cd `dirname $0`;pwd)
home=$(cd;pwd)
vim_dir="${home}/.vim"

function pre_install {
  # git is required
  if [ ! -n `which git` ];then
    echo "git not fond, install git first please."
    exit
  fi

  if [ ! -n `which python3` ]; then
    echo "python3 not fond, install python3 first please."
    exit
  fi
}

function soft_link {
  ln -sf "${dir}/vimrc" ~/.vimrc

  # create ~/.vim if not exists
  [ ! -d "$vim_dir" ] && mkdir $vim_dir

  # link conf to ~/.vim/conf
  ln -sf "${dir}/conf" $vim_dir
}

function install_vundle {
  local vundle_dir="${vim_dir}/bundle/Vundle.vim"
  if [ ! -d "$vundle_dir" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
  fi
}

function install_ycm {
  ycm_dir="$home/.vim/bundle/youcompleteme"
  if [ ! -d "$ycm_dir" ]; then
    git clone https://github.com/ycm-core/YouCompleteMe.git $ycm_dir
  fi
  $ycm_dir/install.py --all
}

function install {
  soft_link
  install_vundle
  install_ycm

  vim +PluginInstall +qall
  vim +PluginClean +qall
  vim +PluginUpdate +qall
}

function post_install {
  echo ""
  echo "Everything done, ^-^.";
}

pre_install
install
post_install
