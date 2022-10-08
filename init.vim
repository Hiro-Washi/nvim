"source ~/.vimrc

"colorscheme molokai
syntax on

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8  " 保存時の文字コード
set history=5000 " 保存するコマンド履歴の数

set number              "行番号を表示
set title
set cmdheight=1
set laststatus=2
set showcmd
set showmatch matchtime=1   "対応する括弧やブレースを表示
set ambiwidth=double 	    " □や○文字が崩れる問題を解決
set splitright		        "画面を縦分割する際に右に開く

"tab
set expandtab
set tabstop=4               "タブ表示幅
set softtabstop=4	        "タブキー押下時に挿入される文字幅
set autoindent
set smartindent
set shiftwidth=4	        "インデント幅
set listchars=tab:▸\-\
" indentline------------------------
let g:indentLine_color_term =239
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '¦'
" ----------------------------------

"補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
set completeopt=menuone,noinsert "補完対象1件でも表示,補完ウィンドウ表示時に挿入しない
set wildmenu                " コマンドモードの補完


set clipboard=unnamed       "yank した文字列をクリップボードにコピー
set mouse=a                 "マウス有効化
"set ttymouse=xterm2
"set scrolloff=5
set scroll=5

" search
set incsearch
set ignorecase		        "検索時に大文字小文字を区別しない
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

set nobackup
set noswapfile
set hidden		            "編集中で保存されていないファイルがあるときに他のファイルを開けるか
set confirm		            "保存されていない場合、vim を終了させようとした時に保存の確認を行う
set autoread		        "外部で変更があった時に自動的に読み込み直すか

set whichwrap=b,s,h,l,<,>,[,],~ "カーソル移動において、行を跨いで移動出来る


" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set backspace=indent,eol,start " バックスペースキーの有効化
inoremap <C-j> <Esc>

" set position of cursol----------
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
"--------------------------------------
" PLUGIN SETTINGS--------------------
set runtimepath^=~/dps-helloworld
"let g:denops#debug = 1
call plug#begin('~/.config/nvim/plugged')

Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"Plug 'vim-denops/denops.vim' ####
Plug 'lambdalisue/gin.vim'

call plug#end()
"-------------------------------------
" Dein----------------
if &compatible
  set nocompatible
endif
let s:dein_dir = expand('~/.vim/bundles')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if match( &runtimepath, '/dein.vim' ) == -1
    " dein_repo_dir で指定した場所に dein.vim が無い場合、git cloneしてくる
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
	  execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

set runtimepath+=s:dein_repo_dir
"if dein#load_state(s:dein_dir)
call dein#begin(s:dein_dir)
call dein#add(s:dein_repo_dir)
call dein#add( s:dein_dir . '/nerdtree')
"  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
"  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
call dein#end()
"call dein#save_state()

if dein#check_install() "新しいプラグインを自動インストール
  call dein#install()
  endif
filetype plugin indent on
syntax enable
"--------------------
" NerdTree----------------
map <C-n> :NERDTreeToggle<CR> " Ctrl-nでNERDTreeを開く
let NERDTreeShowHidden = 1    " 隠しファイルを表示する
" Airline-----------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1 "タブに番号を表示
nmap <C-/> <Plug>AirlineSelectPrevTab
nmap <C-.> <Plug>AirlineSelectNextTab
" -------------------------





