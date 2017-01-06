if has('patch-7.4.1778')
  set guicolors
endif
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"===============================================
" カラー設定
"===============================================
" シンタックスハイライトを有効にする
syntax on
" 背景色を dark にする
set background=dark

"入力中コマンド表示
set showcmd

" 輝度とコントラストは、最初はデフォルトを試すのがオススメです
" 自分はコントラストだけ高くしています
" (ここではコメントアウトしています)

" 輝度を高くする
"let g:solarized_visibility = "high"

" コントラストを高くする
"let g:solarized_contrast = "high"

" 空行挿入 shift + o  Xに変更
nnoremap X :<C-u>call append(expand('.'), '')<Cr>j

"  yank したテキストをクリップボードに格納する
"set clipboard=unnamed,autoselect

" タブを半角スペースに置き換える
set expandtab
" タブ幅をスペース2つ分にする
set tabstop=2
" tab 移動幅
set shiftwidth=2
"set autoindent " 改行時に前の行のインデントを継続する
"set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
"set shiftwidth=4 " smartindentで増減する幅

" auto comment off
augroup auto_comment_off 自動的にコメントがつくのを防止する
autocmd!
autocmd BufEnter * setlocal formatoptions-=r
autocmd BufEnter * setlocal formatoptions-=o
augroup END

"マッピング
inoremap <C-u> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-f> <Right>
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
" 日本語入力で”っj”と入力してもEnterキーで確定
inoremap <silent> っｊ <ESC>
" 日本語入力がオンのままでも使えるコマンド(Enterキーは必要

nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っｄ dd
nnoremap っｙ yy

"vimrc ショートカット
nnoremap <Space><Space>. :e ~/.config/nvim/init.vim<CR>

set mouse=n
set cursorline " カーソルラインの強調表示を有効化
set laststatus=2 " ステータスラインを常に表示
set statusline=%F%r%h%= " ステータスラインの内容
set ambiwidth=double " ○表示

"検索後に、大文字小文字が混在している時は区別する
set smartcase

"スクロール送りを開始する前後の行数を指定
set scrolloff=5

set noswapfile
set title
set number

" インクリメンタル検索を有効化
 set incsearch
" コマンド入力の補完 tab キーで選択
 set wildmenu wildmode=list:full


" ペースト設定 自動インデント防止
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif


"Tab、行末の半角スペースを明示的に表示する。
set list
set listchars=tab:^\ ,trail:~
hi ZenkakuSpace cterm=underline ctermfg=lightblue ctermbg=white
match ZenkakuSpace /　/

set ambiwidth=double " □や○文字が崩れる問題を解決

"markdown preview
au BufRead,BufNewFile *.md set filetype=markdown
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













" dein
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

" dein {{{
let s:dein_cache_dir = g:cache_home . '/dein'

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    " dein.vim をプラグインとして読み込む
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    let s:toml_dir = g:config_home . '/dein'

    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
    if has('nvim')
        call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
    endif

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}
