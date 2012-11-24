"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SolutionYogi's VIMRC file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

set encoding=utf-8

"Next four lines are required for VUNDLE.
"For a new machine, after setting this up, run :BundleInstall for the system
"to actually install these bundles.
filetype off
set rtp+=C:\vundle
call vundle#rc()
Bundle 'gmarik/vundle'

"Creates new shorts cuts for automatically surrounding text
"Eg. you can use cs" to surround text by double quotes.
Bundle 'tpope/vim-surround'
Bundle 'Townk/vim-autoclose'
Bundle 'kien/ctrlp.vim'
Bundle 'edsono/vim-matchit'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tsaleh/vim-align'

"Sets how many lines of history VIM har to remember
set history=1000

"Enable filetype plugin
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Set mapleader
let mapleader = ";"
let g:mapleader = ";"

map H ^
map L $

"Fast saving
map <leader>w :w!<cr>
map <leader>f :find<cr>
map <leader>c :close<cr>
map <leader>n :tabnew<cr>

map Q <Nop>

"Fast reloading of the .vimrc
map <leader>s :source $MYVIMRC<cr>
"Fast editing of .vimrc
map <leader>e :e! $MYVIMRC<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source $MYVIMRC<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

if has("gui_running")
  set guioptions-=T
  let psc_style='cool'
  colorscheme molokai
  set guifont=Consolas:h8
else
  set background=dark
  colorscheme zellner
endif

"Highlight current
if has("gui_running")
  set cursorline
  hi cursorline guibg=#333333
  hi CursorColumn guibg=#333333
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetypes
set ffs=dos,unix,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Keep at least 10 lines visible from the cursor bottom when scrolling.
set so=20

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=2

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Ignore case when searching
set ignorecase
set incsearch
set scs

set tabstop=4
set sw=4 "Shift Width should be same as tabstop, this setting is used to create default indentation with 'o' and 'O' commands.
set expandtab
set nowrap
set smarttab

set nowritebackup
set nobackup

" vim will create .swp files in this folder instead of the using the folder
" where file is stored.
set directory=c:\windows\temp

" 50 lines of command history.
set history=50
"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Highlight search things
set hlsearch

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
"Always show Status line.
set laststatus=2

"Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L:%c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around and tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
map <c-space> ?

"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set completeopt=menu


""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

" let's use the left/right arrow keys for buffer switching as they are no good
" for anything else.
map <Right> :bnext<CR>
imap <Right> <ESC>:bnext<CR>
map <Left> :bprev<CR>
imap <Left> <ESC>:bprev<CR>
map <Del> :bd<CR>

" We will map Up and Down keys to go through recent change list in the file.
map <Up> g;
map <Down> g,

"When you press esc, it will remove the highlighting, very neat!
"From John of VIEMU fame.
:nnoremap <esc> :noh<return><esc>

"Displays tab number in the tab title. Makes tab switching easy
"with the gt command. From news.ycominbator.com
set guitablabel=(%N)\ %t

"For JavaScript, we want to use $ as the keyword, this will allow us to write
"function like pub.module$FunctionName and auto complete will work correctly.
"See: http://stackoverflow.com/questions/1923680/vim-autocomplete-use-as-the-word-separator
set iskeyword-=\$

"set undofile - Persistent Undo/redo FTMFW! :)
if has('persistent_undo')
    set undodir=c:\temp\viundo
    set undofile
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

set nobackup
set noswapfile

"Trim trailing whitespace by pressing leader + W.
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

"Always use relative line numbering.
set rnu

function! g:ToggleNuMode()
if(&rnu == 1)
    set nu
else
    set rnu
endif
endfunc

nnoremap <C-L> :call g:ToggleNuMode()<cr>


"Making vim remember things across session. Each config option is separated by
"comma.
"'1000 - Remember details for last 1000 files
"f1 - Save global marks and jumps
"<500 - Remember up to 500 registers
":1000 - Remember last 1000 commands
"@1000 - Remember last 1000 input line history.
"/1000 - Remember last 100 search
"%1000 - Remember last 1000 files in the buffer list.
"
:set viminfo='1000,f1,<500,:1000,@1000,/1000,%1000,h

"Am not a folding fan, so let's disable it.
set nofoldenable


" always switch to the current file directory.
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT


set backspace=indent,eol,start  " backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " show matching brackets/parenthesis
set winminheight=0              " windows can be 0 line high
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor


" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

if has('win32') || has('win64')
    "On Windows, it is easier to use System clipboard as default target for
    "yank/paste.
    set clipboard=unnamed
endif

"For CtrlP, we only want to match on file name and ignore the path.
let g:ctrlp_by_filename=1
let g:ctrpl_clear_cache_on_exit=1

