execute pathogen#infect()

set nocompatible                " choose no compatibility with legacy vi
"syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation


syntax on

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
 
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

""Mapping a leader character 
let mapleader = ","

""Setting jk and kj to map to the escape key
ino jk <esc>
cno jk <c-c>
ino kj <esc>
cno kj <c-c>

""For Syntastic General Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""For syntastic and C
let g:syntastic_c_check_header = 1


"" Setting ,ne to open NERDTree
nmap <leader>ne :NERDTree<cr>

""Setting line numbers by default
:set nu

"" For setting the color style for gruvbox
set background=dark
set t_Co=256
colorscheme  gruvbox           " Sets the color scheme to vimvidchalk

"" For airline
set laststatus=2

"" for Command-T
:call pathogen#helptags()

"" User defined function, trying to learn how they work so I can use them 
"" In my testing project. This function takes in a filename and will allow the
"" User to edit that file in a new split. the file will be saved in the
"" Current working directory.
function CreateTest(testName)
  :execute "split" a:testName
endfunction 

"" function to run a test by the filename
function RunTest(testName)
  "" Checking if the file exists
  if filereadable(a:testName)
    "" file does exist, run test
    :execute "new | 0read ! ruby ~/Dropbox/Programming/testingSystem/main.rb" a:testName 
  else 
    "" file does NOT exist. throw error
    echo "Error: File does not exist"
  endif
endfunction

"" Commands for the testing functions

"" Allows adding and editing of test files
"" Call with :Addtest filename
command! -nargs=1 Addtest call CreateTest(<f-args>)

"" Runs a test name
command! -nargs=1 Runtest call RunTest(<f-args>)


