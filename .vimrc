call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'samsaga2/vim-z80'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
"Plug 'rust-lang/rust.vim'
"Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"Plug 'miyakogi/conoline.vim'
Plug 'scrooloose/nerdtree'
Plug 'hashivim/vim-terraform'
Plug 'ruanyl/vim-gh-line'
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
set expandtab " On pressing tab, insert 4 spaces
set tabstop=4 " show existing tab with 4 spaces width
set softtabstop=4
set shiftwidth=4 " when indenting with '>', use 4 spaces width
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
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

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

" Vimwiki markdown integration
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Fix CoC floating window color
hi Pmenu ctermbg=grey

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Tepmlates
autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html

" FZF
command! -bang -nargs=* Rg call fzf#vim#grep("rg --hidden --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" remap envoke key
nnoremap <silent> <C-z> :FZF<CR>

" NerdTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeQuitOnOpen = 1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
"map - :NERDTreeToggle<CR> " open/close nerdtree window
"map <leader>r :NERDTreeFind<cr> " this is the key to jump to the nerdtree window from any other window
"autocmd BufWinEnter * NERDTreeFind map ] :NERDTreeFind<CR> " pressing this inside any open file in vim will jump to the nerdtree and highlight where that file is -> very useful when you have multiple files open at once

" Ruby
let g:ruby_indent_assignment_style = 'variable'

" Terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1
