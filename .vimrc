set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"==================="
" installed plugins "
"==================="
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'rstacruz/sparkup'
Plugin 'jiangmiao/auto-pairs'
Plugin 'will133/vim-dirdiff'
Plugin 'tpope/vim-vividchalk'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"================="
" custom settings "
"================="

colorscheme vividchalk
" vividchalk does not load correct bg when sourced from vimrc (https://github.com/tpope/vim-vividchalk/issues/7) "
" hence this hack below (https://stackoverflow.com/a/8696611/4260095) "
hi Normal ctermbg=NONE

" split navigation settings "
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" spaces and tabs settings "
set expandtab     " Use the appropriate number of spaces to insert a <Tab>
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set softtabstop=4   " Let backspace delete indent
set autoindent

" fold settings "
nnoremap <Space>f :set foldmethod=indent<CR>
"set foldmethod=indent
set foldlevel=99
hi Folded ctermbg=0 " have no background for the line that shows folded code

" search settings "
set hlsearch
set incsearch
hi Search ctermfg=black ctermbg=yellow  "fg and bg settings for highlighted text
nnoremap <Space><Space> :noh<CR>    " remove search highlighting

" vim tabs settings "
nnoremap <Space>e :tabedit<Space>
nnoremap <Space>c :tabclose<CR>
nnoremap L gt<CR>
nnoremap H gT<CR>

" auto-pairs settings "
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" DirDiff settings "
let g:DirDiffExcludes = "*.pyc,.svn*,.svn/*"    " excludes these file extns in DirDiff

" general settings "
set statusline=%m\ %F%r%h%w\ %y\ lines=%L\ x=%l\ y=%v\ %p%%
set laststatus=2
set mouse=a
set ruler
set nu

let mapleader=','
nnoremap <Space>l :set list!<CR>
nnoremap <Space>w :set wrap!<CR>
nnoremap <Space>s :set paste!<CR>
nnoremap <Space>pdb <Esc>Oimport pdb; pdb.set_trace()<Esc>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Syntastic settings "
set statusline+=\ %=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


