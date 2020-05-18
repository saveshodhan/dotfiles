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
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'tomasiser/vim-code-dark'
Plugin 'sickill/vim-monokai'
Plugin 'tomasr/molokai'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"================="
" custom settings "
"================="

" colorscheme molokai
colorscheme monokai
" colorscheme codedark
" colorscheme spacecamp
" colorscheme vividchalk
" vividchalk does not load correct bg when sourced from vimrc (https://github.com/tpope/vim-vividchalk/issues/7) "
" hence this hack below (https://stackoverflow.com/a/8696611/4260095) "
" hi Normal ctermbg=NONE

" split navigation settings "
set splitbelow
set splitright
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

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
hi Folded ctermfg=gray " have no background for the line that shows folded code

" search settings "
set hlsearch
set incsearch
set ignorecase
hi Search ctermfg=black ctermbg=yellow  " fg and bg settings for highlighted text
nnoremap <Space><Space> :noh<CR>    " remove search highlighting

" vim buffer settings "
nnoremap <Space>e :e<Space>
nnoremap <Space>c :bd<CR>
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>

" auto-pairs settings "
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'

" DirDiff settings "
let g:DirDiffExcludes = "*.pyc,.svn*,.svn/*,.git*,.git/*"    " excludes these file extns in DirDiff

" general settings "
"set statusline=%m\ %F%r%h%w\ %y\ lines=%L\ x=%l\ y=%v\ %p%%
"set laststatus=2
set mouse=a
set ruler
set nu
set hidden

if !&diff
    set colorcolumn=120
endif

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
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=Q000,W503,E116,E117,E731'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_aggregate_errors = 1
" let g:syntastic_check_on_wq = 0
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction
" let g:syntastic_quiet_messages = { "!level": "errors" }   " commenting this for now as I need to know the warnings as well

" NERDTree settings "
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-S-m> :NERDTreeFind<CR>
" autocmd vimenter * NERDTreeFind     " start NERDTree automatically when vim starts up
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " close Vim if NERDTree is the only window left

" Switch between different windows by their direction "
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" airline settings "
let g:airline_powerline_fonts = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#eclim#enabled = 1
let airline#extensions#syntastic#stl_format_err = '%E{[%*]}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" NERDCommenter settings"
" let g:NERDSpaceDelims = 1
" let g:NERDCommentEmptyLines = 1

" Tagbar settings "
nnoremap <F8> :TagbarToggle<CR>
