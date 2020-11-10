" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Change dates fast
"Plug 'tpope/vim-speeddating'
" Convert binary, hex, etc..
":Plug 'glts/vim-radical'
" Python
Plug 'mindriot101/vim-yapf'
Plug 'fisadev/vim-isort'
" Files
Plug 'tpope/vim-eunuch'
" Repeat stuff
Plug 'tpope/vim-repeat'
" Surround
Plug 'tpope/vim-surround'
" Better Comments
Plug 'tpope/vim-commentary'
" Have the file system follow you around
Plug 'airblade/vim-rooter'
" auto set indent settings
Plug 'tpope/vim-sleuth'
" Sensible defaults
Plug 'tpope/vim-sensible'

" Text Navigation
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
" Add some color
Plug 'junegunn/rainbow_parentheses.vim'
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Cool Icons
Plug 'ryanoasis/vim-devicons'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
" Tags
" Plug 'majutsushi/tagbar'
" Closetags
Plug 'alvan/vim-closetag'
" Themes
Plug 'sainnhe/gruvbox-material'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
" Plug 'christianchiarulli/onedark.vim'
" Plug 'kaicataldo/material.vim'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'tomasiser/vim-code-dark'
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'davidhalter/jedi-vim'
"Plug 'deoplete-plugins/deoplete-jedi'

" Status Line
" Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline-themes'
" Ranger
" Plug 'francoiscabrol/ranger.vim'
" Plug 'rbgrouleff/bclose.vim'
" Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Git
" Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
" Plug 'junegunn/gv.vim'
" Terminal
Plug 'voldikss/vim-floaterm'
" Start Screen
Plug 'mhinz/vim-startify'
" Zen mode
Plug 'junegunn/goyo.vim'
" Snippets
" Plug 'honza/vim-snippets'
" Plug 'mattn/emmet-vim'
" Better Comments
" Plug 'jbgutierrez/vim-better-comments'
" Echo doc
" Plug 'Shougo/echodoc.vim'
" Interactive code
" Plug 'ChristianChiarulli/codi.vim'
" Vim Wiki
" Plug 'https://github.com/vimwiki/vimwiki.git'
Plug 'wikitopian/hardmode'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif

"General
syntax on
set guicursor=
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set list
set listchars=tab:>-
set nocompatible
set go=a
set encoding=utf-8
set t_Co=256
set mouse=a
set clipboard+=unnamedplus
set lazyredraw
set showmatch

filetype off

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" Color
colorscheme nvcode
set background=dark


if executable('rg')
  let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader =  " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

" Splits
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

filetype plugin on
filetype indent on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" Make backspaces more powerful
set backspace=indent,eol,start

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <Leader>, :nohlsearch<CR>     " turn off search highlight

" Enable autocompletion:
set wildmenu
set wildmode=longest,list,full

"automatic hybrid line numbering
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" space open/closes folds
set foldenable
nnoremap <,> za
" set foldcolumn=3
set foldlevel=99
set foldlevelstart=10   " open most folds by default
set foldmethod=indent   " fold based on indent level

"Alternate bg color
"call togglebg#map("<F5>")

"Hardmode
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmodeMsg = 'Don''t use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" NERDTree cfg
" map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" For full syntax highlighting:
syntax on
let python_highlight_all=1

set backupdir=~/vimfiles/tmp,.
set directory=~/vimfiles/tmp,.
set autochdir
set confirm
set pastetoggle=<F10>

" Python PEP8 indentation
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |

map <Leader>ve :sp $HOME/.config/init.vim<CR>
map <Leader>vs :source $HOME/.config/init.vim<CR>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Tagbar -----------------------------
" toggle tagbar display
" map <F4> :TagbarToggle<CR>
" " autofocus on tagbar open
" let g:tagbar_autofocus = 1

" Custom bindingjs
" move verticalljy by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
"nnoremap B ^
"nnoremap E $

" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" save session
nnoremap <leader>s :mksession<CR>

" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>coc-references)(
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :Git commit<CR>

" GFiles
nnoremap <C-p> :GFiles<CR>

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

" Format
map <F7> gg=G<C-o><C-o>

" Replace
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Yapf settings
let g:yapf_style = "google"
setlocal equalprg=yapf
nnoremap <leader>y :Yapf<cr>

" Set breakpoint
nnoremap <leader>br ibreakpoint()<Esc>

" isort
let g:vim_isort_map = '<C-i>'
let g:vim_isort_python_version = 'python3'

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Visual mode put text into command mode
vnoremap : y:<C-r>"<C-b>

" Jedi
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:pymode_rope = 0
let g:jedi#completions_enabled = 1


" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Terminal settings
" Window split settings
highlight TermCursor ctermfg=red guifg=red
set splitbelow
set splitright

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
    func! s:maybeInsertMode(direction)
        stopinsert
        execute "wincmd" a:direction

        if &buftype == 'terminal'
            startinsert!
        endif
    endfunc

    execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
                \ "<C-\\><C-n>"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
    execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
                \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
    call s:mapMoveToWindowInDirection(dir)
endfor

" Workspace Setup
" ----------------
function! DefaultWorkspace()

"    Explore /home/oliver/dev/mono
    cd /home/oliver/dev/mono
    file editor
    vsp term://zsh
    vertical resize -30
    file shell\ \#1

    sp term://zsh
    file shell\ \#2
    resize +15
    wincmd k
    wincmd h

endfunction

command! -register Default call DefaultWorkspace()

" Basic Key Mappings
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

nnoremap <Space> <Nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <silent> <C-c> <Esc>
" <TAB>: completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" Floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

