VIMRC 
" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                     \  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     autocmd VimEnter * PlugInstall --sync | source  $MYVIMRC
endif

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'powerline/powerline'
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'scrooloose/syntastic'
Plug 'ajh17/vimcompletesme'
Plug 'vim-scripts/vim-gitgutter'
Plug 'victorze/foo'
Plug 'pright/cctree'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-bufferline'
Plug 'kien/ctrlp.vim' "https://vimawesome.com/plugin/ctrlp-vim-red
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar.vim'
Plug 'ervandew/screen'
Plug 'ap/vim-buftabline'
Plug 'fholgado/minibufexpl.vim' "Show buffer as tabs (Beauty full) https://github.com/fholgado/minibufexpl.vim
Plug 'mattn/emmet-vim'
Plug 'epheien/termdbg'
"Plug 'klen/python-mode' "Python plugin
"Plug 'python-rope/rope' "Python autocompletion
call plug#end()

" Turn on filetype detection, plugins + indentation
 
set nocompatible
 
filetype indent plugin on
 
" Basic syntax highlighting
syntax on
 
 
" Display commands typed at the bottom of the screen
set showcmd
set cmdheight=2
 
" Smart case-sensitive searching; highlight on search
set hlsearch
set ignorecase
set smartcase
 
" Whitespace management
set backspace=indent,eol,start
set autoindent
set nostartofline
set wrap
set number numberwidth=10
set shiftwidth=4
set shiftround
set softtabstop=4
set expandtab
set tabstop=4
set tw=79

" Misc usability UI
set ruler
set matchtime=1
set confirm
set visualbell
 
" Mouse in all modes
set mouse=a
 
 
" Folding
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
set foldcolumn=1

" XML folding https://stackoverflow.com/questions/32154285/folding-expanding-and-colapsing-xml-tags-in-vim-xml-parsing
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END


"Set relative number
set relativenumber

" Vim Taglist plugin 
let Tlist_Use_Right_Window = 1

"Set Taglist window width
let Tlist_WinWidth=65

" Toggle the NERdTree with single key stroke
nmap <C-S-Left> :NERDTreeToggle<CR>

" Toggle the Taglist key stroke
nmap <C-S-Right> :TlistToggle<CR>

" Use space to open the file or dir instead of 'o'
"let NERDTreeMapActivateNode='<space>'

"Auto open NERDTree in every tab
"(https://stackoverflow.com/questions/1979520/auto-open-nerdtree-in-every-tab)
autocmd BufWinEnter * NERDTreeMirror

"Set lightline.vim (https://github.com/itchyny/lightline.vim)
set laststatus=2

" Map Ctrl+k to search the words under the cursor in same file
nmap <C-k> :/<C-R>=expand("<cword>")<CR><CR>
nmap <leader>s :mksession! ${MY_VIM_SESSION}
nmap <leader>o :source ${MY_VIM_SESSION}
"nmap <C-S-o> :source ${MY_VIM_SESSION}

" Pressing \r revels the current opened file in NERDTRee
map <leader>r :NERDTreeFind<cr>

" Pressing \b opens the buffers
map <leader>b :Buffers<CR>
map <leader>1 :bp<CR>
map <leader>2 :bn<CR>

" To change the cursor to vertical line in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" To display a line where the cursor is present
set cursorline lisp

" Todo list map
nmap <C-l> <Plug>VimwikiToggleListItem

