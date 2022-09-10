" winmanager -----------------------------------------------------------------
let g:winManagerWindowLayout='NERDTree|'
let g:winManagerWidth = 30
let g:defaultExplorer = 0
" there is a bug when exec WMToggle, two blank split pane will be opened
nnoremap <silent> wm :call WM_init()<cr>
" open winmanager if no file opened when vim start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | call WM_init() | endif

function! WM_init()
  if IsWinManagerVisible() | exec "WMToggle" | return | endif
  exec "WMToggle" | q | exec "FirstExplorerWindow"
endfunction

" nerdtree -------------------------------------------------------------------
let g:NERDTree_title='[NERD Tree]'
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
"Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeShowHidden=1

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

" nerdtree git plugin --------------------------------------------------------
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"checksyntax  need install checker by you self -------------------------------
"
" taglist --------------------------------------------------------------------
nmap tl :TlistToggle<cr>
set tags=./tags
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1            " exit vim when tlist window is the last one
let Tlist_Show_One_File = 1              " only show current file's taglists
let Tlist_GainFocus_On_ToggleOpen = 1    " foucs on show taglist window
let Tlist_php_settings = 'php;c:class;f:function;d:constant'
let Tlist_File_Fold_Auto_Close = 1
let Tlist_WinWidth = 30
let Tlist_Auto_Open = 0


" ctrlp ----------------------------------------------------------------------
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
map <leader>fp :CtrlPMRU<cr>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=30
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" ctrlsf ----------------------------------------------------------------------
nnoremap <leader>fa :CtrlSF<space>
nnoremap <leader>fq :CtrlSFQuickfix<space>
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_auto_close = 1
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_ignore_dir = ['.git', '.hg', '.svn', '.rvm']

" a --------------------------------------------------------------------------
nmap <leader>cd :A<cr>                           " toggle header and cpp file

" nerd commenter -------------------------------------------------------------
let g:NERDSpaceDelims = 1       " add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1   " use compact syntax for prettified multi-line comments
let g:NERDCommentEmptyLines = 1 " allow commenting and inverting empty lines

" make cursor back to position before close
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif

" supertab -------------------------------------------------------------------
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" multiple-cursors -----------------------------------------------------------
" use default key map

" indent guides --------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
:nmap <silent> <Leader>ig <Plug>IndentGuidesToggle
:nmap <silent> <Leader>ie <Plug>IndentGuidesEnable
:nmap <silent> <Leader>id <Plug>IndentGuidesDisable


" youcomeleteme --------------------------------------------------------------
nnoremap <leader>td :YcmCompleter GoToDefinition<cr>
nnoremap <leader>tr :YcmCompleter GoToDeclaration<cr>
let g:ycm_global_ycm_extra_conf =
  \ '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set completeopt=longest,menu
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_show_diagnostics_ui = 0        "disable error warnings and highlight

" vim-polyglot ---------------------------------------------------------------
" go to ~/.vim/bundle/vim-polyglot build

" git guntter ----------------------------------------------------------------
nmap <leader>tg :GitGutterToggle<cr>
let g:GitGutterLineHighlightsEnable = 1
nmap <leader>]g :GitGutterNextHunk<cr>
nmap <leader>[g :GitGutterPrevHunk<cr>

" airline status bar ---------------------------------------------------------
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


" trailing witespace ---------------------------------------------------------
autocmd BufWritePre * :FixWhitespace

" theme  ---------------------------------------------------------------------
colorscheme darkblue
hi Normal guibg=NONE ctermbg=NONE

" black -----------------------------------------------------------------
let g:black_linelength = 80
let g:black_fast = 0
autocmd BufWritePost *.py :Black

" ghcmd-vim ------------------------------------------------------------------
autocmd BufWritePost *.hs :GhcModCheckAndLintAsync

" neco ghc---------------------------------------------------------------------
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1
let g:necoghc_use_stack = 1

" syntastic -------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['']
