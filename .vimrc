" vim:set foldmethod=marker nowrap:
"
"         .vimrc
"
" ================ pathogen setup ================ {{{1

" if has('win32') || has('win64')
"     set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
" endif
silent! execute pathogen#infect()
silent! Helptags
syntax on
filetype plugin indent on
let maplocalleader='\'

" ================ basic settings ================ {{{1

set noerrorbells           " error messages, no beep
set visualbell             " flash, no beep
set t_vb=                  " no flash
au GUIEnter * set vb t_vb= " GUI, no beep, no flash

set encoding=utf-8         " read files as utf-8
set showcmd                " show cmds bottom right
set autochdir              " directory follows files
set hidden                 " abandoned buffers, hide rather than unload
set autowriteall           " write on most buffer exits
set autoread               " read changes made outside of vim
set modeline               " apply vim cmds at file bdry
set virtualedit=block      " visual-block can square out past end-of-line

set incsearch              " search, update as you type
set hlsearch               " search, highlight
set ignorecase             " search, ignore case

set shiftwidth=4           " indent width
set expandtab              " spaces not tabs

let g:netrw_keepdir=0      " directory follows netrw
let g:netrw_banner=0       " hide banner
let g:netrw_list_hide='.*\.swp,.*\~,\$RECYCLE.BIN,\.Trash-1000,System\ Volume\ Information'
" let g:netrw_list_hide='.*\.swp\($\|\s\),.*\~\($\|\s\)'

let g:netrw_preview=1
" let g:netrw_browse_split=4
set noequalalways          " don't auto-resize windows
set splitright             " new window right
" set splitbelow             " new window below
let g:netrw_alto=1         " new window below
let g:netrw_altv=1         " new window right

set statusline=%<\ [%n]\ %f\ %m%y%w%=\ L:\ \%l\/\%L\ C:\ \%c\ "
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" ================ easier default keys ================ {{{1
"
nnoremap ; :
inoremap jj <Esc>
cnoremap jj <Esc>
nnoremap <Space> za
let mapleader=','
set timeoutlen=3000
nnoremap <leader>2 :@"<CR>
nnoremap <leader>/ :noh<CR>
set keywordprg=:help
set wildmenu
set wildmode=list:full
" set wildmode=list:longest
set wildcharm=<C-z>
set wildignore+=*~
if version >= 704
    set wildignorecase
endif

nnoremap <leader>k :help <C-r><C-w><CR><C-w><C-p>
nnoremap <leader>c :colorscheme <C-z><S-Tab>
nnoremap <leader>s :setlocal spell!<CR>
nnoremap <leader>1 :!
nnoremap <leader>p :!python <C-z><S-Tab>
inoremap ;w <Esc>:w
inoremap ;q <Esc>:q
nnoremap <CR> O<Esc>
cmap w!! w !sudo tee > /dev/null %
nnoremap j gj
nnoremap k gk
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj

" ================ nav ================ {{{1

nnoremap <leader>e :e<Space>
nnoremap <leader>. :e.<CR>
nnoremap <leader>3 :e#<CR>
nnoremap <leader>w <C-w>
" let g:bufExplorerDisableDefaultKeyMapping=1
nnoremap <leader>b :b <C-z><S-Tab>
nnoremap gb :ls<CR>:b<Space>
nnoremap gB :ls!<CR>:b<Space>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap tn :tabe<CR>
nnoremap tc :tabc<CR>
nnoremap to :tabo<CR>
nnoremap th :tabp<CR>
nnoremap tj :tabl<CR>
nnoremap tk :tabr<CR>
nnoremap tl :tabn<CR>
nnoremap <leader>l :marks<CR>:norm! `
nnoremap <leader>Lm :marks<CR>:mark<Space>
nnoremap <leader>Ld :marks<CR>:delmarks<Space>
" nnoremap <leader>Lr :delmarks 0-9<CR>
au VimEnter * delmarks 0-9
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <M-h> 4<C-w><
nnoremap <M-j> 4<C-w>+
nnoremap <M-k> 4<C-w>-
nnoremap <M-l> 4<C-w>>

" ================ colorscheme, guifont ================ {{{1

let os=substitute(system('uname'), '\n', '', '')
if has('gui_running') " && has('Unix')
    try
        if strftime("%H") < 4
            colorscheme jellybeans
        elseif strftime("%H") < 20
            colorscheme railscasts
        else
            colorscheme jellybeans
        endif
    catch
        colorscheme desert
    endtry
elseif os == 'Linux' && &term =~? 'mlterm\|xterm'
    set t_Co=256 
    try
        colorscheme jellybeans
    catch
        colorscheme desert
    endtry
elseif os == 'Darwin' || os == 'Mac'
    colorscheme evening
else
    colorscheme desert
endif

if has('win32')
    set guifont=Consolas:h10:cANSI
endif

" ================ if term, mac ================ {{{1

if &term =~? 'mlterm\|xterm'
    let c='a'                   " alt key in terminal
    while c <= 'z'
        exe "set <A-".c.">=\e".c
        let c = nr2char(1+char2nr(c))
    endwhile
endif

let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
    nmap ˙ <M-h>
    nmap ∆ <M-j>
    nmap ˚ <M-k>
    nmap ¬ <M-l>
    " nmap ˜ <M-n>
    " nmap π <M-p>
    " if !has gui_macvim
    " if !has("mac") && !has("macunix")
        " because of modelines=0 in /usr/share/vim/vimrc
    if &modelines==0
        set modelines=5
    endif
endif
