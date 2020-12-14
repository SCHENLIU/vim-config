" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'austintaylor/vim-indentobject'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-pastie'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/greplace.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'rkulla/pydiction'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
"set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

"TAG AUTO OPEN
let Tlist_Auto_Open=1

"pydiction
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 5


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Go crazy!
set nocursorline " don't highlight current line

" keyboard shortcuts
inoremap jj <ESC>

" highlight search
"set hlsearch
"nmap <leader>hl :let @/ = ""<CR>

set cursorline

" Disambiguate ,a & ,t from the Align plugin, making them fast again.
"
" This section is here to prevent AlignMaps from adding a bunch of mappings
" that interfere with the very-common ,a and ,t mappings. This will get run
" at every startup to remove the AlignMaps for the *next* vim startup.
"
" If you do want the AlignMaps mappings, remove this section, remove
" ~/.vim/bundle/Align, and re-run rake in maximum-awesome.
function! s:RemoveConflictingAlignMaps()
  if exists("g:loaded_AlignMapsPlugin")
    AlignMapsClean
  endif
endfunction
command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
silent! autocmd VimEnter * RemoveConflictingAlignMaps
set autochdir
set tags=tags;
set tags+=~/anaconda2/tags

"airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='bubblegum'

let g:airline#themes#cool#palette = {}

" NORMAL
let s:N1   = [ '#585858' , '#E4E4E4' , 59  , 188 ]
let s:N2   = [ '#E4E4E4' , '#0087AF' , 188 , 31 ]
let s:N3   = [ '#EEEEEE' , '#005F87' , 231  , 24]
let g:airline#themes#cool#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
"let g:airline#themes#cool#palette.normal_modified = {
      "\ 'airline_c': [ '#ffffff' , '#5f005f' , 255     , 53      , ''     ] ,
      "\ }

" INSERT
let s:I1 = [ '#585858' , '#E4E4E4' , 59  , 188  ]
let s:I2 = [ '#E4E4E4' , '#47AF00' , 188 , 70  ]
let s:I3 = [ '#EEEEEE' , '#2E8700' , 231  , 28 ]
let g:airline#themes#cool#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
"let g:airline#themes#cool#palette.insert_modified = {
      "\ 'airline_c': [ '#ffffff' , '#5f005f' , 255     , 53      , ''     ] ,
      "\ }
"let g:airline#themes#cool#palette.insert_paste = {
      "\ 'airline_a': [ s:I1[0]   , '#d78700' , s:I1[2] , 172     , ''     ] ,
      "\ }

" REPLACE
let s:R1 = [ '#585858' , '#E4E4E4' , 59  , 188  ]
let s:R2 = [ '#E4E4E4' , '#AF5F00' , 188 , 130  ]
let s:R3 = [ '#EEEEEE' , '#875300' , 231  , 94  ]
let g:airline#themes#cool#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
"let g:airline#themes#cool#palette.replace.airline_a = [ s:I2[0]   , '#af0000' , s:I2[2] , 124     , ''     ]
"let g:airline#themes#cool#palette.replace_modified = g:airline#themes#cool#palette.insert_modified

" VISUAL
let s:V1 = [ '#585858' , '#E4E4E4' , 59 , 188 ]
let s:V2 = [ '#E4E4E4' , '#AF2800' , 188 , 124 ]
let s:V3 = [ '#EEEEEE' , '#872800' , 231  , 88  ]
let g:airline#themes#cool#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
"let g:airline#themes#cool#palette.visual_modified = {
      "\ 'airline_c': [ '#ffffff' , '#5f005f' , 255     , 53      , ''     ] ,
      "\ }

" INACTIVE
let s:IA1 = [ '#585858' , '#E4E4E4' , 59 , 188 , '' ]
let s:IA2 = [ '#E4E4E4' , '#466D79' , 188 , 60 , '' ]
let s:IA3 = [ '#EEEEEE' , '#324E59' , 231 , 59 , '' ]
let g:airline#themes#cool#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
"let g:airline#themes#cool#palette.inactive_modified = {
      "\ 'airline_c': [ '#875faf' , '' , 97 , '' , '' ] ,
      "\ }

" TERMINAL
let g:airline#themes#cool#palette.terminal = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#cool#palette.normal.airline_term = s:N3
let g:airline#themes#cool#palette.terminal.airline_term = s:I3
let g:airline#themes#cool#palette.visual.airline_term = s:V3

let g:airline#themes#cool#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 196 , ''  ]
      \ }

" CTRLP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#cool#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#E4E4E4' , '#00AFA2' , 188 , 37  , ''     ],
      \ [ '#EEEEEE' , '#008787' , 231  , 30 , ''     ],
      \ [ '#585858' , '#E4E4E4' , 59 , 188  , ''     ])

