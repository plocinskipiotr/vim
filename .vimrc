set nocompatible              " required
filetype off                  " required

set splitbelow
set splitright

set foldmethod=indent
set foldlevel=99
set number
set colorcolumn=72
set hlsearch
set ruler
set ignorecase

let mapleader = " "

" leetcodes settings
let g:leetcode_browser = 'chrome'
let g:leetcode_solution_filetype = 'python'
let g:leetcode_hide_paid_only = 1
let g:leetcode_problemset = 'Algorithms'

nnoremap <leader>lk :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>

" colorscheme
colorscheme badwolf

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8', 'pylint']

" NERDtree
let g:NERDTreeWinPos = "right"

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" mappings
" moving between windows 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" moving windows
nnoremap <leader>h <C-W>H
nnoremap <leader>j <C-W>J
nnoremap <leader>k <C-W>K
nnoremap <leader>l <C-W>L

" disable arrow movement; resize splits instead.
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" remappings
nnoremap w W
nnoremap b B
nnoremap e E


map <F1> :NERDTreeToggle<CR>
map <F2> :NERDTreeFocus<CR>

map <F5> :call CompileRun()<CR>
imap <F5> <Esc>:call CompileRun()<CR>
vmap <F5> <Esc>:call CompileRun()<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'janko-m/vim-test'
Plugin 'ianding1/leetcode.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ekalinin/dockerfile.vim'
Plugin 'enricobacis/vim-airline-clock'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


func! CompileRun()
exec "w"
if &filetype == 'sh'
    exec "!time bash %"
elseif &filetype == 'python'
    exec "!time python3 %"
endif
endfunc

