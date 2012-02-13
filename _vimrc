"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JD's VIMRC file
" Version History:
" 09/28/2009 - Removed everything which I didn't use.
"               Added Tab numbe in tab title to use with gt command.
" 09/01/2011   - Created new VimSetup folder and added CommandT plugin files.
"              Removed undodir option as I moved back to 7.2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! MySys()
    return "win"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

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
set so=10

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

set iskeyword-=\$

"set undofile - Persistent Undo/redo FTMFW! :)
set undodir=c:\temp\viundo

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
