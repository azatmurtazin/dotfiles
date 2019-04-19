set nocompatible              " be iMproved, required
filetype off                  " required

try

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  Plugin 'L9'
  " Git plugin not hosted on GitHub
  "Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  "Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  "Plugin 'ascenator/L9', {'name': 'newL9'}

  Plugin 'tpope/vim-vividchalk'

  Plugin 'Lokaltog/vim-powerline'

  Plugin 'jpalardy/spacehi.vim'

  Plugin 'chr4/nginx.vim'

  Plugin 'leafgarland/typescript-vim'

  Plugin 'scrooloose/nerdtree'

  Plugin 'Xuyuanp/nerdtree-git-plugin'

  Plugin 'airblade/vim-gitgutter'

  Plugin 'elixir-editors/vim-elixir'

  Plugin 'udalov/kotlin-vim'

  Plugin 'kylef/apiblueprint.vim'

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on

catch
endtry


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" enable syntax highlighting
syntax on

" line numbers
set nu

" actually I don't remember what is it
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" colorscheme
set t_Co=256
colorscheme elflord
if !empty(globpath(&rtp, 'colors/vividchalk.vim'))
  colorscheme vividchalk
endif

" spacehi
let g:spacehi_tabcolor="ctermfg=White ctermbg=Blue guifg=White guibg=Blue"
let g:spacehi_spacecolor="ctermfg=Black ctermbg=Yellow guifg=Blue guibg=Yellow"
let g:spacehi_nbspcolor="ctermfg=White ctermbg=Red guifg=White guibg=Red"
try
  autocmd syntax * SpaceHi
catch
endtry

" status bar
set laststatus=2

" indentation parameters
set sw=2 ts=2 sts=2 et
autocmd BufRead,BufNewFile /etc/nginx/* set ft=nginx
autocmd FileType php setl sw=4 ts=4 sts=4 et
autocmd FileType go setl sw=4 ts=4 sts=4 noet

"autocmd vimenter * NERDTree
map <F4> :NERDTreeToggle<CR>

