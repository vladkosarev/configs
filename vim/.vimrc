call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
"Plug 'itchyny/lightline.vim'
"Plug 'luochen1990/rainbow'
"Plug 'junegunn/fzf', { 'do': './install --bin' }
"Plug 'junegunn/fzf.vim'
"Plug 'miyakogi/conoline.vim'
call plug#end()

" Basics
" Disable compatible
set nocp
" Use system clipboard
set clipboard=unnamedplus
" Enable mouse
set mouse=a
" TextEdit might fail if hidden is not set.
set hidden
" Add status line
set laststatus=2
" Tabs
set expandtab " On pressing tab, insert 2 spaces
set tabstop=2 " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2 " when indenting with '>', use 2 spaces width
" Syntax
syntax on
" Line Numbers
set number
" Disable backup
set nobackup
set nowritebackup
" Disable swap
:set noswapfile
" Enable wildmenu
set wildmenu
set wildmode=longest:list,full
" Improve search
:set incsearch  "Search as you go
:set hlsearch   "Highlight matches
:set ignorecase "Case-insensitive searches
" More natural splits
set splitbelow
set splitright
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Cursor Line
hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=NONE
set cursorline
" strip trailing whitespace from all files
autocmd BufWritePre * %s/\s\+$//e
" Don't redraw unnecessarily too many times
:set lazyredraw
" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
map <C-E> :Lexplore<CR>
" jump to last known position in a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
" Change cursor based on mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
if !empty($TMUX)
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
endif
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
" Use tab for autocompletion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Mappings
nnoremap ; :
noremap x "_x
noremap X "_X
"nmap <silent> <A-Up> :wincmd k<CR>
"nmap <silent> <A-Down> :wincmd j<CR>
"nmap <silent> <A-Left> :wincmd h<CR>
"nmap <silent> <A-Right> :wincmd l<CR>
tnoremap <A-Up>    <C-\><C-n><C-w>h
tnoremap <A-Down>  <C-\><C-n><C-w>j
tnoremap <A-Left>  <C-\><C-n><C-w>k
tnoremap <A-Right> <C-\><C-n><C-w>l

" Plugin Config
" Rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
" Coc Lightline Integration
"function! CocCurrentFunction()
"  return get(b:, 'coc_current_function', '')
"endfunction
"
"let g:lightline = {
"  \ 'active': {
"  \   'left': [ [ 'mode', 'paste' ],
"  \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
"  \ },
"  \ 'component_function': {
"  \   'cocstatus': 'coc#status',
"  \   'currentfunction': 'CocCurrentFunction'
"  \ },
"  \ }
" Airline
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" CoC Airline Integration
let g:airline#extensions#coc#enabled = 1
