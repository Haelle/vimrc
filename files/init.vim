" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Conquer or Completion (CoC)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" NerdTree & cie
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Ruby support
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
" Others
Plug 'tpope/vim-endwise'
Plug 'hwartig/vim-seeing-is-believing'
" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Toggle comments
Plug 'scrooloose/nerdcommenter'
" Remember last cursor position
Plug 'farmergreg/vim-lastplace'
" Git gutter
Plug 'airblade/vim-gitgutter'
" Cooklang support
Plug 'luizribeiro/vim-cooklang', { 'for': 'cook' }
" Copilot
Plug 'github/copilot.vim'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""
" Basic conf
"
"""""""""""""""""""""""""""""""""""""""""""""""""
set number
set encoding=UTF-8
set history=1000
set background=dark
set scrolloff=3
colorscheme slate
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE guifg=#93a1a1 guibg=#002931

" Expand tabulations & smart indent
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""
" Git gutter
"
"""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlighting in sign column
highlight clear SignColumn

" Git gutter colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Set update time to 0.5s (warning updatetime impact swap files saving)
set updatetime=500


"""""""""""""""""""""""""""""""""""""""""""""""""
" Config for Conquer of Completion (CoC)
"
"""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-markdownlint',
  \ 'coc-marketplace',
  \ 'coc-omnisharp',
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-stylelintplus',
  \ 'coc-sql',
  \ 'coc-tsserver',
  \ 'coc-yaml',
  \ ]

nmap <silent> qf <Plug>(coc-fix-current)
nmap <silent> fa <Plug>(coc-format)
vmap <silent> fr <Plug>(coc-format-selected)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <F2> <Plug>(coc-rename)

" Show code documentation
nnoremap <C-k> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""
" CoC shortcuts
"
"""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

"""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
"
"""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle NerdTree
nmap <C-n> :NERDTreeToggle<CR>
imap <C-n> <Esc>:NERDTreeToggle<CR>i

let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.git$', '\.pioenvs$', '\.swp', '^node_modules$', '^vendor$']

" Open and focus with currently opened file
nmap <C-A-n> :NERDTreeFind<CR>
imap <C-A-n> <Esc>:NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"
"""""""""""""""""""""""""""""""""""""""""""""""""

" Hiligh current selection in green
set hlsearch
highlight Search ctermbg=DarkGreen ctermfg=White
highlight IncSearch ctermbg=DarkGreen ctermfg=White

" Disable highlighting after search with Escape
nmap <Esc> :noh<CR>

" Map Ctrl-F / Ctrl-Shift-F
nmap <C-f> /
imap <C-f> <Esc>/
nmap <S-f> :Ag<CR>
" no mapping in insert mode cannot type 'S'...

" Map CtrlP to FZF search file by name
nmap <C-p> :FZF<CR>
imap <C-p> <Esc>:FZF<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""
" NerdCommenter
"
"""""""""""""""""""""""""""""""""""""""""""""""""

nmap <C-c> <Plug>NERDCommenterToggle
vmap <C-c> <Plug>NERDCommenterToggle


"""""""""""""""""""""""""""""""""""""""""""""""""
" Seeing is believing
"
"""""""""""""""""""""""""""""""""""""""""""""""""
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

  autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
  autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)

  autocmd FileType ruby nmap <buffer> <F6> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <F6> <Plug>(seeing-is-believing-mark-and-run)

  " Remove all marks (=> ~> >>)
  " we have to add one \ before the | in init.vim
  " but not needed when used directly in vim
  nmap <F7> :%s/\s*# \(=\\|>\\|\~\)>.*$//g<CR>
  xmap <F7> :s/\s\*# \(=\\|>\\|\~\)>.*$//g<CR>
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby / RoR / RSpec
"
"""""""""""""""""""""""""""""""""""""""""""""""""

" Make sure RSpec is used with bundler (and spring hence)
" (may break project without bundler)
let g:rspec_command = "!bin/rspec -f p -c {spec}"

" vim-rspec mappings
map <C-w>t :call RunCurrentSpecFile()<CR>
map <C-w>s :call RunNearestSpec()<CR>
map <C-w>l :call RunLastSpec()<CR>
map <C-w>a :call RunAllSpecs()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""
" Custom config
"
"""""""""""""""""""""""""""""""""""""""""""""""""

" Create a command to install missing gems
" for Ruby developpment with multiple Ruby versions
command InstallGems execute '!gem install neovim solargraph seeing_is_believing'

" Faster save
" (in edit mode it stays in normal mode after saver)
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>

" Ruby: Faster switch between spec & file
nmap <C-q> :w<CR>:A<CR>
imap <C-q> <Esc>:w<CR>:A<CR>i

" Display invisible characters (tabs, end of line, trailing spaces)
set list listchars=tab:»·,eol:¬,trail:·,nbsp:⋅

" auto remove trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

" better resizing
autocmd VimResized * :normal =

" Keep undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" Vim split behaviours
set splitbelow
set splitright
" Move cursor
nmap <C-Up> :wincmd k<CR>
nmap <C-Down> :wincmd j<CR>
nmap <C-Left> :wincmd h<CR>
nmap <C-Right> :wincmd l<CR>
" Move split position
nmap <C-w><C-Up> <C-w><S-k>
nmap <C-w><C-Down> <C-w><S-j>
nmap <C-w><C-Left> <C-w><s-h>
nmap <C-w><C-Right> <C-w><S-l>

" Highlight TODO in comments
syntax keyword myTodo  TODO  contained
syntax keyword myFixme FIXME contained
syntax keyword myXXX   XXX   contained

" Highlight non-ASCII characters
au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"
highlight nonascii ctermbg=DarkRed ctermfg=Yellow
