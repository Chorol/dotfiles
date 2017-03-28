syntax on
set background=dark
colorscheme solarized

set nocompatible
set guifont=Inconsolata\ 10
set t_Co=256

set runtimepath+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'wesQ3/vim-windowswap'
NeoBundle 'vim-scripts/restore_view.vim'
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'maxbrunsfeld/vim-yankstack'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'JamshedVesuna/vim-markdown-preview'
NeoBundle 'jiangmiao/auto-pairs'
" NeoBundle 'vim-syntastic/syntatic'

"latex
NeoBundleLazy 'LaTeX-Box-Team/LaTeX-Box'
autocmd FileType tex NeoBundleSource LaTeX-Box

"cpp
NeoBundleLazy 'derekwyatt/vim-fswitch'
NeoBundleLazy 'rhysd/vim-clang-format'
autocmd Filetype cpp NeoBundleSource vim-fswitch
autocmd Filetype cpp NeoBundleSource vim-clang-format

"java
autocmd Filetype java NeoBundleSource vim-clang-format

"python
NeoBundleLazy 'davidhalter/jedi-vim'
NeoBundleLazy 'tell-k/vim-autopep8'
autocmd Filetype python NeoBundleSource jedi-vim
autocmd Filetype python NeoBundleSource vim-autopep8

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

"map leader on space for easier access
let nnmapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Handle similar filetypes
autocmd BufEnter *.vert :setlocal filetype=cpp
autocmd BufEnter *.frag :setlocal filetype=cpp
autocmd BufEnter *.jrag :setlocal filetype=java

" Don't fold git commit information
autocmd FileType gitcommit setlocal nofoldenable

" Change default browser when previewing markdown
let vim_markdown_preview_browser='firefox'

" cycle through yank stack
nmap <c-P> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

" shortkey for mru (Most Recently Used [Directories])
noremap <Leader>T :MRU<CR>

" Create a shortcut for doxygen comments
nnoremap <leader>D :Dox<CR>

" make the powerline work proper
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
set encoding=utf-8

" add openframeworks completion
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf_openframeworks.py"

" Settings for restore_view
set viewoptions=cursor,folds,slash,unix

let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_latexmk_async=1

" for autoformating
let g:clang_format#detect_style_file = 1
nnoremap <Leader>f :ClangFormat<CR>
vnoremap <Leader>f :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>F :ClangFormatAutoToggle<CR>

"for tagbar
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarOpenAutoClose<CR>

"for vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <c-v> <Plug>(expand_region_shrink)

"shortkey for nerdtree
nnoremap <leader>t :NERDTreeToggle<CR>
autocmd BufEnter * lcd %:p:h

" for nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2

"close vim if the only window left is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" close nerdtree when opening a new window
let g:NERDTreeQuitOnOpen=1

"swap two panes in an open session
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>w :call WindowSwap#EasyWindowSwap()<CR>

"Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_cpp_include_dirs = ['~/Openframework/*']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

:map <leader>e @:

" double spacebar opens last file again
:nnoremap <leader><leader> :e#<CR>

" for smooth scrolling
set so=5

"highlight the 80th column
highlight ColorColumn guibg=gray15
let &colorcolumn="80"

"hide toolbar,scrollbars
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" show last command
set showcmd

" show wildmenu
set wildmenu
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

"activate line numbers
set ruler
set nu
set relativenumber

"brace face
set showmatch
set matchtime=4

"more responsive split
set splitbelow
set splitright

"resize splits when the window is resized
au VimResized * :wincmd =

"use spaces instead of tabs
set expandtab

"better intendation
set autoindent
set smarttab
set tabstop=4
set shiftwidth=4

"searching
set incsearch
set hlsearch
set ignorecase
set smartcase

"replacing
set gdefault

"vi sucks
set nocompatible

"improve undo task
set history=1000
set undofile
set undodir=~/.vim/undo
set undolevels=2000
set undoreload=10000
set backupdir=~/.vim/backup

" more convenient way to use markers
noremap 'a `a
noremap `a 'a
noremap 'b `b
noremap ``b 'b
noremap '. `a
noremap `` ''

" jump easy to beginning/end of line
noremap H ^
noremap L $

"leave insert mode without pressing esc
inoremap jk <esc>

"key mapping
nnoremap <cr> :w<cr>
no <down> ddp
no <up> ddkP
vno <down> dp
vno <up> dkP

" for folding
setlocal foldmethod=syntax
nnoremap < za
nnoremap > zA
nnoremap <leader>< zM
nnoremap <leader>> zR
autocmd FileType gitcommit setlocal nofoldenable

"stop highlighting
nnoremap <esc> :noh<return><esc>

"for split selection
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"delete all empty lines in the end
autocmd BufWritePre * :%s/\s\+$//e

"autosave if focus lost
au FocusLost * :wa

"cycle through errors with syntactics
nnoremap <leader>n :lnext
nnoremap <leader>m :lprevious

"autoformat
"nnoremap <leader>f mpggvG='p
" format only one line
"nnoremap <leader>F ==

"close window
nnoremap <leader>q :q<cr>

"copy&paste
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y

"replace a word with the before yanked text
"won't delete the yanked word from the buffer
xnoremap p "_dP

"duplicate a line
nnoremap <leader>d Yp

"quickly replace something
nnoremap <leader>r :%s/

" Quick lines
nnoremap <leader>o o<esc>^Dk
nnoremap <leader>O O<esc>^Dj

function! GetCurrentColorScheme()
    if !has('gui_running')
        return 'solarized'
    endif
    let l:dayOfWeek = strftime('%a')
    if l:dayOfWeek ==# 'Sat'
        return 'gruvbox'
    endif
    if l:dayOfWeek ==# 'Sun'
        return 'PaperColor'
    endif
    return 'solarized'
endfunction

function! GetCurrentBackground()
    if !has('gui_running')
        return 'dark'
    endif
    " return (strftime('%H') > 6 && strftime('%H') < 18) ? 'light' : 'dark'
    return (strftime('%H') > 6 && strftime('%H') < 18) ? 'dark' : 'dark'
endfunction

exec 'set background=' . GetCurrentBackground()
exec 'colorscheme ' . GetCurrentColorScheme()

" change directory when entering file
set autochdir

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")
