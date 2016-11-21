set hlsearch
set ruler
set number
set noswapfile
set title
set incsearch
set wildmenu wildmode=list:full
set mouse=n
set cursorline " カーソルラインの強調表示を有効化
" " ステータスラインを表示
 set laststatus=2 " ステータスラインを常に表示
 set statusline=%F%r%h%= " ステータスラインの内容
" " インクリメンタル検索を有効化
 set incsearch
" " 補完時の一覧表示機能有効化
 set wildmenu wildmode=list:full

 set expandtab                                    "
" タブを半角スペースに置き換える
 set tabstop=2                                    "
" タブ幅をスペース4つ分にする
 set shiftwidth=2                                 " 自動インデントの幅
" " タブ、行末スペースなどを可視化した時に表示する記号
 set listchars=tab:>\-,trail:-,extends:>,precedes:<,nbsp:% 
 hi ZenkakuSpace cterm=underline ctermfg=lightblue ctermbg=white
 match ZenkakuSpace /　/

""新しい行を作ったときに高度な自動インデントを行う
set smartindent


"macbook test
"マッピング
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^a
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^a
inoremap <C-d> <Del>


"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

" Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
"

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()
"
"  " Required:
filetype plugin indent on
"
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"  "End NeoBundle Scripts-------------------------



 " Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru'
" let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>





"
"


"
"
"
"
"test
