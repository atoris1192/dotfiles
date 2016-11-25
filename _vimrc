set hlsearch
set ruler
set number
set noswapfile
set title
set wildmenu wildmode=list:full
set mouse=n
set cursorline " カーソルラインの強調表示を有効化
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

"マッピング



inoremap <silent>  """" """"<Left>

nnoremap <silent> ,tr :NERDTreeToggle<CR>
"mac del
inoremap <C-d> <Del>
"mac ctrl + e
inoremap <c-e> <ESC>$a 
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
" NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tomasr/molokai'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" コメントON/OFFを手軽に実行
" markdown
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

 " Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" emmet
NeoBundle 'mattn/emmet-vim'

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
" let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

"markdown 
au BufRead,BufNewFile *.md set filetype=markdown
" let g:previm_open_cmd = 'open -a Chrome'
let g:previm_open_cmd = 'open -a Safari'
nnoremap <silent> ,md :PrevimOpen<CR> "PrevimOpenで表示

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

  


inoremap <silent>  """" """"<Left>

nnoremap <silent> ,tr :NERDTreeToggle<CR>
"mac del
inoremap <C-d> <Del>
"mac ctrl + e
inoremap <c-e> <ESC>$a 
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
" markdown
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

 " Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

" emmet
NeoBundle 'mattn/emmet-vim'

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
" let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

"markdown 
au BufRead,BufNewFile *.md set filetype=markdown
" let g:previm_open_cmd = 'open -a Chrome'
let g:previm_open_cmd = 'open -a Safari'
nnoremap <silent> ,md :PrevimOpen<CR> "PrevimOpenで表示

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

" colorscheme
" syntax on
colorscheme molokai

