" Startup {{{
filetype indent plugin on

augroup vimrcEx
au!

autocmd FileType text setlocal textwidth=78

augroup END

" vim 文件折叠方式为 marker
augroup ft_vim
    au!

    autocmd FileType vim setlocal foldmethod=marker

    " 打开文件总是定位到上次编辑的位置
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

    augroup END
augroup END
" }}}

" General {{{
set nocompatible
set nobackup
set noswapfile
set history=1024
set ruler
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Vim 的默认寄存器和系统剪贴板共享
set clipboard+=unnamed
" }}}

" Lang & Encoding {{{
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
" }}}

" GUI & Color {{{
set cursorline
set hlsearch
set relativenumber number
" 分割出来的窗口位于当前窗口下边/右边
set splitbelow
set splitright

colorscheme morning

" set nolist
set listchars=trail:~,extends:>,precedes:<

" }}}

" Format {{{
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set foldmethod=indent
set foldlevel=10
syntax on
" }}}

" Keymap {{{
let mapleader=","

nmap <leader>s :source $MYVIMRC<cr>
nmap <leader>e :e $MYVIMRC<cr>

nmap <leader>tn :tabnew<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>th :tabp<cr>
nmap <leader>tl :tabn<cr>
nmap <leader>nh :nohl<cr>

" 移动分割窗口
"nmap <C-j> <C-W>j
"nmap <C-k> <C-W>k
"nmap <C-h> <C-W>h
"nmap <C-l> <C-W>l

" 正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <C-j> :resize -5<cr>
nnoremap <C-k> :resize +5<cr>
nnoremap <C-h> :vertical resize +5<cr>
nnoremap <C-l> :vertical resize -5<cr>


" 插入模式移动光标 alt + 方向键
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <left>
inoremap <M-l> <Right>

" IDE like delete
inoremap <C-BS> <Esc>bdei

nnoremap vv ^vg_
" 转换当前行为大写
inoremap <C-u> <esc>mzgUiw`za
" 命令模式下的行首尾
cnoremap <C-a> <home>
cnoremap <C-e> <end>

nnoremap <F2> :setlocal number!<cr>
nnoremap <leader>w :set wrap!<cr>

imap <C-v> "+gP
vmap <C-c> "+y
vnoremap <BS> d
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
imap <C-V> "+gP
map <S-Insert> "+gP
cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" 打开当前目录 windows
nmap <silent> <leader>ex :!start explorer %:p:h<CR>

" 打开当前目录CMD
nmap <silent> <leader>cmd :!start cmd /k cd %:p:h<cr>
" 打印当前时间
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

let NERDTreeBookmarksFile = $VIM . '/NERDTreeBookmarks'

" 复制当前文件/路径到剪贴板
nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

"设置切换Buffer快捷键"
nnoremap <C-left> :bn<CR>
nnoremap <C-right> :bp<CR>

" }}}

" Plugin {{{
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ----- Vundle ----- {{{
Plugin 'VundleVim/Vundle.vim'
" }}}
" ----- NerdTree ----- {{{
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

let NERDTreeIgnore=['.idea', '.vscode', 'node_modules', '*.pyc']
let NERDTreeShowHidden = 1
let NERDTreeBookmarksFile = $VIM . '/NERDTreeBookmarks'
let NERDTreeMinimalUI = 1
let NERDTreeBookmarksSort = 1
let NERDTreeShowLineNumbers = 0
let NERDTreeShowBookmarks = 1
let g:NERDTreeWinPos = 'left'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

nmap <leader>n :NERDTreeToggle <cr>
nmap <leader>m :NERDTreeFind <cr>
" if exists('g:NERDTreeWinPos')
"     autocmd vimenter * NERDTree D:\repo
" endif
" }}}
" ----- Multiple-cursors ----- {{{
Plugin 'terryma/vim-multiple-cursors'
" }}}
" ----- Tabular ----- {{{
Plugin 'godlygeek/tabular'
" }}}
" ----- Markdown ----- {{{
Plugin 'plasticboy/vim-markdown'
" }}}
" ----- Ctrlp ----- {{{
Plugin 'kien/ctrlp.vim'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
set wildignore+=*\\.git\\*,*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc
nmap <leader>b :CtrlPBuffer<cr>

" }}}
" ----- Nerdcommenter ----- {{{
Plugin 'scrooloose/nerdcommenter'
" }}}
" ----- UltiSnips ----- {{{
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"

" }}}
" ----- Fugitive ----- {{{
Plugin 'tpope/vim-fugitive'
" }}}


" ----- Fugitive ----- {{{
Plugin 'airblade/vim-gitgutter'
" }}}

" ----- Fzf ----- {{{
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
"" }}}
" ----- Asyncrun ----- {{{
"Plugin 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 8
" }}}
" ----- AutoPirs ----- {{{
Plugin 'jiangmiao/auto-pairs'
" }}}
" ----- REPL ----- {{{
Plugin 'sillybun/vim-repl'
let g:repl_program = {
            \   'python': 'ipython3',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }

let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>q :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

" }}}
" ----- Rainbow Parentheses ----- {{{
Plugin 'kien/rainbow_parentheses.vim'
" }}}
" ----- Omni Completion ----- {{{
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
autocmd FileType *
  \ if &omnifunc != '' |
  \ call SuperTabChain(&omnifunc, "<c-x><c-]>") |
  \ endif
set ofu=syntaxcomplete#Complete
"function! OpenCompletion()
    "if !pumvisible() && v:char == '.'
        "call feedkeys("\<C-x>\<C-o>", "n")
    "endif
"endfunction

"autocmd InsertCharPre * call OpenCompletion()
"" }}}
" ----- Guten Tags ----- {{{
Plugin 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
let g:gutentags_ctags_tagfile = '.tags'

let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
       silent! call mkdir(s:vim_tags, 'p')
   endif
set tags+=~/.cache/tags/python.tag

" }}}
" ----- vim-color ----- {{{
"Plugin 'altercation/vim-colors-solarized'
"syntax enable
"set background=dark
"set t_Co=256
""colorscheme solarized
"" }}}
" ----- Airline ------ {{{
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='papercolor'
"" }}}

filetype on
call vundle#end()
" }}}

" Quick Run {{{
map <leader>t :call CompileRun()<CR>
    func! CompileRun()
        exec "w"
if &filetype == 'cpp'
            exec "!g++ %-o %<"
            exec "!time ./%<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            "exec "AsyncRun time python %"
            exec "!time python %"
endif
    endfunc
" }}}

" Function {{{
" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
" }}}
