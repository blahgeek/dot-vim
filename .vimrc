set nocompatible
filetype  plugin on
filetype  indent on
syntax    on            
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan the files given with the 'dictionary' option
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set nowrap                      " do not wrap lines
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set shiftwidth=4                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set tabstop=4                   " number of spaces that a <Tab> counts for
set visualbell                  " visual bell instead of beeping
set wildignore=*.o,*.e,*~       " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
"-------------------------------------------------------------------------------
" The current directory is the directory of the file in the current window.
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif
"-------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif

inoremap  ,  ,<Space>

inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%

inoremap  <buffer>  {<CR>    {<CR>}<Esc>O
vnoremap  <buffer>  {<CR>   S{<CR>}<Esc>Pk=iB

xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>
"
"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif

set nu

"for display chinese text
"default fileencodings=ucs-bom,utf-8,latin1
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,latin1
set clipboard=unnamedplus

nnoremap K kJ

set laststatus=1
set statusline=%.43(%f%m%r%h\ %{&ff},%{&fileencoding}%Y%)\ %=%-13.13(%b,0x%04.B%)%-8.(%l,%c%)\ %P
set titlestring=%.43(%f%m%r%h\ %{&ff},%{&fileencoding}%Y%)\ %=%-13.13(%b,0x%04.B%)%-8.(%l,%c%)\ %P
set title
nnoremap <ESC><ESC> :nohlsearch<CR>

set guifont=Inconsolata\ 17

set expandtab
set scrolloff=5

let g:indentLine_color_term = 0
let g:email = "i@BlahGeek.com"

let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
