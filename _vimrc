
set nocompatible
" set encoding=utf-8
" scriptencoding
" set fileencodings
" set showmatch
set showcmd
set ignorecase
"検索後に、大文字小文字が混在している時は区別する
set smartcase
"検索した際に最後の語句の次に最初の語句にループしないようにする
set nowrapscan
set nobackup
" バックスペース押下時の挙動を変更する
set backspace=indent,eol,start
"  yank したテキストをクリップボードに格納する
set clipboard=unnamed,autoselect
"スクロール送りを開始する前後の行数を指定
set scrolloff=5
"検索語が画面の真ん中に来るようにする
" nmap n nzz 
" nmap N Nzz 
" nmap * *zz 
" nmap # #zz 
" nmap g* g*zz 
" nmap g# g#zz

"インサートモードから抜ける時に自動的に nopaste に戻す
autocmd InsertLeave * set nopaste

set hlsearch
syntax on
set ruler
set number
set noswapfile
set title
set wildmenu wildmode=list:full
set mouse=n
set cursorline " カーソルラインの強調表示を有効化
 set laststatus=2 " ステータスラインを常に表示
 set statusline=%F%r%h%= " ステータスラインの内容
" インクリメンタル検索を有効化
 set incsearch
" 補完時の一覧表示機能有効化
 set wildmenu wildmode=list:full
" タブを半角スペースに置き換える
 set expandtab
" タブ幅をスペース2つ分にする
 set tabstop=2

" 改行時にインデントする (インデントしないは一つしか機能しない)
" set autoindent
set shiftwidth=2
"新しい行を作ったときに高度な自動インデントを行う
" set smartindent
" set cindent
set noautoindent

" タブ、行末スペースなどを可視化した時に表示する記号
set listchars=tab:>\-,trail:-,extends:>,precedes:<,nbsp:% 
hi ZenkakuSpace cterm=underline ctermfg=lightblue ctermbg=white
match ZenkakuSpace /　/

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM



" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

"マッピング
inoremap <C-u> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Right>
" inoremap <silent>  """" """"<Left>
nnoremap <silent> ,tr :NERDTreeToggle<CR>
"mac del
inoremap <C-d> <Del>
"mac ctrl + e
inoremap <c-e> <ESC>$a
"誤改行の戻し操作
inoremap <silent> xz <ESC>v$d<Up>$pA
inoremap <silent> ｘｚ <ESC>v$d<Up>$pA

" jjでエスケープ
inoremap <silent> jj <ESC>
" 日本語入力で”っj”と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent> っｊ <ESC>
" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要)
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っｄ dd
nnoremap っｙ yy
" 空行挿入 shift + o  Xに変更
nnoremap X :<C-u>call append(expand('.'), '')<Cr>j


"vimrc ショートカット
nnoremap <Space><Space>. :e $MYVIMRC<CR>
nnoremap <Space><Space>. :e $MYVIMRC<CR>

"markdown 
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Safari'
" let g:previm_open_cmd = ''
nnoremap <silent> ,md :PrevimOpen<CR> "PrevimOpenで表示
" autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" nnoremap [previm] <Nop>
" nmap <Space>p [previm]
" nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
" nnoremap <silent> [previm]r :call previm#refresh()<CR>


"挿入モード時、ステータスラインの色を変更
"""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
  autocmd!
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
   redir => hl
     exec 'highlight '.a:hi
   redir END
   let hl = substitute(hl, '[\r\n]', '', 'g')
   let hl = substitute(hl, 'xxx', '', '')
   return hl
endfunction

if has('unix') && !has('gui_running')
    " ESC後にすぐ反映されない対策
    inoremap <silent> <ESC> <ESC>
endif


"Tab、行末の半角スペースを明示的に表示する。
set list
set listchars=tab:^\ ,trail:~

nnoremap <silent> ,tr :NERDTreeToggle<CR>


"NeoBundle Scripts-----------------------------
if has('vim_starting')
" set nocompatible               " Be iMproved

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
" NeoBundle 'flazz/vim-colorschemes'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" コメントON/OFFを手軽に実行
" markdown
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" emmet
NeoBundle 'mattn/emmet-vim'
"色設定
NeoBundle 'tomasr/molokai'

"neocomlite
NeoBundle 'Shougo/neocomplete.vim'
" Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neoyank.vim'

" surround
NeoBundle 'surround.vim'

"yankring.vim互換
NeoBundle 'LeafCage/yankround.vim'

"quikrun
NeoBundle 'thinca/vim-quickrun'
set filetype=javascript 
" set filetype=ruby 
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on
"
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"  "End NeoBundle Scripts-------------------------






"yankround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" emmet
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }

" Unite
" let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>


"NeoCoplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" For no inserting <CR> key.
"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1D@{1}
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.
"\t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]
"*\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]
"*\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" colorscheme
colorscheme molokai
set background=dark
autocmd colorscheme molokai highlight Visual ctermbg=8
