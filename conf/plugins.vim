" vundle manage plugins --------------------------------------------------
filetype  off     "required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"=================================== Base ====================================
Plugin 'VundleVim/Vundle.vim'             " let Vundle manage Vundle, required
Plugin 'winmanager'                       " winmanager
Plugin 'scrooloose/nerdtree'              " file tree
Plugin 'xuyuanp/nerdtree-git-plugin'      " nerd tree show git status flags
Plugin 'taglist.vim'
Plugin 'ctrlpvim/ctrlp.vim'               " search file
Plugin 'dyng/ctrlsf.vim'                  " search keyword
Plugin 'scrooloose/nerdcommenter'         " comment tool
Plugin 'ervandew/supertab'                " Perform insert mode completions with Tab
Plugin 'terryma/vim-multiple-cursors'     " multi cursor
Plugin 'nathanaelkane/vim-indent-guides'  " make indent visiablity
Plugin 'sheerun/vim-polyglot'             " syntax higglighting plugins for most languages
Plugin 'kshenoy/vim-signature'            " toggle, display and navigate marks
Plugin 'airblade/vim-gitgutter'           " show git diff  flag on guntter
Plugin 'powerline/fonts'                  " powerline fonts
Plugin 'vim-airline/vim-airline'          " a cool menu bar
Plugin 'vim-airline/vim-airline-themes'   " themes for airline menu bar
Plugin 'bronson/vim-trailing-whitespace'  " auto trailing whitespace at the EOL
Plugin 'shougo/vimproc.vim'               " a great asynchronous execution library for Vim
Plugin 'vim-syntastic/syntastic'          " syntax checking hacks for vim
Plugin 'valloric/youcompleteme'           " a code-completion engine
"============================ Language specific =============================
">>>> Python
Plugin 'ambv/black'                       " The uncompromising Python code formatter
">>>> Haskell
Plugin 'eagletmt/ghcmod-vim'              " haskell linter
Plugin 'eagletmt/neco-ghc'                " haskell completion
Plugin 'nbouscal/vim-stylish-haskell'     " haskell code formater
Plugin 'rust-lang/rust.vim'               " Vim support form rust-lang

call vundle#end()           " required
filetype plugin indent on   " required

runtime! conf/plugins/setting.vim
