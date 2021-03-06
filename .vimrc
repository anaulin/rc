" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc

set nocompatible        " use vim defaults

set scrolloff=3         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set number              " show line numbers
set ruler               " show the current row and column

if has("gui_running")
  set columns=160       " set column width, but only with gui
endif
set textwidth=80
set tabstop=2           " size of a hard tabstop
set shiftwidth=2        " indent width
set expandtab           " uses spaces instead of tab characters
set guioptions-=r       " remove right scrollbar
set guioptions-=L       " remove right scrollbar

set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should

set bg=dark             " dark background
set guifont=Menlo:h12

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

" show whitespace
set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

set shellcmdflag=-ic    " use interactive shell (to use aliases)

" Put swap and undo files out of the way
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Search improvements (inspired by https://robots.thoughtbot.com/faster-grepping-in-vim)
" Set up The Silver Searcher for better search
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" add Ag as a new search command that opens a quickfix window
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"--------- Python-specific configuration
"
" Call Autopep8 every time a file is saved
autocmd BufWritePost *.py call Autopep8()
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4

" disable autopep8 showing diff
let g:autopep8_disable_show_diff=1
