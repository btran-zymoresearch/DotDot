" :PlugInstall
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set termguicolors                         " iterm2 color
syntax on
colorscheme sublimemonokai

set expandtab ts=4 sw=4 ai                " Tab spaces
set spelllang=en                          " Spell check
set backspace=2                           " Backspace equals to indent,eol,start
set smarttab
set copyindent
set preserveindent

" Match VS Code keybinding
inoremap ∆ <Esc>:m .+1<CR>==gi            " Move current line up
inoremap ˚ <Esc>:m .-2<CR>==gi            " Move current line down

noremap <C-o> o<Esc>k                     " Adds extra empty line below
noremap <C-O> O<Esc>j                     " Adds extra empty line above

set number                                " Numbers to the left
set relativenumber                        " Shows relative numbers from curser
set cursorline                            " Highlights current line and number

" Only gives relative number when on focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" NERDTREE
autocmd vimenter * NERDTree               " Autoload NERDTREE with vim
autocmd VimEnter * wincmd p               " Curser start on file
let NERDTreeShowHidden=1                  " Show hidden files in NERDTree
let g:NERDTreeDirArrowExpandable = '▸'    " Show directory
let g:NERDTreeDirArrowCollapsible = '▾'   " Show current directory open
map <C-n> :NERDTreeToggle<CR>             " Map NERDTREE to ctr

" Close NERDTREE when the last editor closes
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" load NERDTREE even if there isn't a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
