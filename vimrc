" vim:fdm=marker

set nocompatible
source ~/.vim/vundles.vim
source ~/.vim/misc.vim

" Colorschemes (deps: 'tomasr/molokai', 'Gentooish') {{{
"|
"|
set t_Co=256
syntax on
"colorscheme xoria256

"let g:kolor_bold=0
"colorscheme kolor
colorscheme babymate256
"|
"|
" }}}
" Auto read file changes {{{
"|
"|
au CursorHold *.* checktime
set autoread
set updatetime=2000 " default is 4000
"|
"|
" }}}
" Terminal-vim performance {{{
"|
"|
set ttimeout
set ttimeoutlen=250
set notimeout
"|
"|
" }}}
" History, undo, backups {{{
"|
"|
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildignore=*.swp,*.bak,*~
"|
"|
" }}}
" Handle trailing whitespace {{{
"|
"|
autocmd BufWritePre * :%s/\s\+$//e
set listchars=trail:▸,extends:▶,precedes:◀
set list
"|
"|
" }}}
" Misc settings {{{
"|
"|
" No annoyances
set nobackup
set noswapfile

set virtualedit=
set wildmode=full
set wildmenu
"set updatetime=30
set tabpagemax=50
set tw=400
set scrolloff=5
set history=10000
set autoindent
set showmode
set ruler
set showcmd
set nonumber
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set nowrap
set cpoptions+=ces$
set mouse=a
set ttymouse=xterm2
"|
"|
" }}}
" Quickly edit main config files {{{
"|
"|
function! EditVimRc()
  :e ~/.vim/vimrc
endfunction
command! EditVimRc call EditVimRc()

function! EditTmuxConf()
  :e ~/.tmux.conf
endfunction
command! EditTmuxConf call EditTmuxConf()

nnoremap ;vs :wall<Return>:source ~/.vim/vimrc<Return>
nnoremap ;ve :call EditVimRc()<Return>
"|
"|
" }}}
" Improve movement {{{
"|
"|
map <C-j> 5j
map <C-k> 5k

noremap 0 ^
noremap ^ 0
map <C-t> %

map <C-h> b
map <C-l> w
nnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-h> ^
vnoremap <S-l> $
"|
"|
" }}}
" Highlight current line/column {{{
"|
"|
set nocursorline
set nocursorcolumn
map <silent>\-C :set cursorline!<Return>
map <silent>\-c :set cursorcolumn!<Return>
"|
"|
" }}}
" Command/Search window {{{
"|
"|
map <silent> \-x q:
map ;<space> q/
"|
"|
" }}}
" Searching {{{
"|
"|
set showmatch
set ic
set is
set hlsearch
"set smartcase
set ignorecase
map     <silent> ;;  :nohlsearch<Return>
"|
"|
" }}}
" Writing files / closing vim {{{
"|
"|
map  ;e  <Esc>:wall<Return>
imap ;e  <Esc>:wall<Return>
map  \-o <Esc>:wall<Return>
imap \-o <Esc>:wall<Return>

map <Tab><Tab> :wqall!
map <Tab>q     :qall!
"|
"|
" }}}
" Split windows {{{
"|
"|
"set mousefocus
set fillchars=""
set noequalalways
set hidden
set splitbelow
set splitright

" Equalize windows
map <C-w>e     <C-w>=
map <C-w><C-e> <C-w>=

" Resize windows
map \-] <C-w>>
map \-[ <C-w><
map \-} <C-w>+
map \-{ <C-w>-


" Swap windows (via ~/.vim/misc.vim)
nmap <silent> ;sm :call MarkWindowSwap()<Return>
nmap <silent> ;ss :call DoWindowSwap()<Return>
"|
"|
" }}}
" Tabs {{{
"|
"|
map <Tab>m :tabmove<Space>
map <Tab>0 :tabfirst<Return>
map <Tab>9 :tablast<Return>

map <Tab>n :tabnew
map \-t    :tabnew<Return>
map cc :tabclose<Return>

nnoremap \-sct :tabprevious<Return>
nnoremap \-ct  :tabnext<Return>
"|
"|
" }}}
" UltiSnips (deps: 'vim-scripts/UltiSnips) {{{
"|
"|
let g:UltiSnipsSnippetsDir = '~/.vim/snippets/'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']

let g:UltiSnipsExpandTrigger="<C-i>"
let g:UltiSnipsJumpForwardTrigger="<C-i>"
let g:UltiSnipsJumpBackwardTrigger="<C-u>"
"|
"|
" }}}
" Lusty filesystem/buffer (deps: 'sjbach/lusty') {{{
"|
"|
map <Tab>L :LustyFilesystemExplorer<Return>
map <Tab>l :LustyFilesystemExplorerFromHere<Return>
map <C-b> :LustyBufferExplorer<Return>
"|
"|
" }}}
" Nerdtree (deps: 'scrooloose/nerdtree') {{{
"|
"|
nmap <silent> ;nn :NERDTreeToggle<Return>
nmap <silent> ;nf :NERDTreeFind<Return>
"|
"|
" }}}
" Nerdcommenter (deps: 'scrooloose/nerdcommenter') {{{
"|
"|
map ;c <Leader>c<Space>
"|
"|
" }}}
" Auto-Pairs (deps: 'jiangmiao/auto-pairs') {{{
"|
"|
map ;pt :call AutoPairsToggle()<Return>
"|
"|
" }}}
" Clever-f (deps: 'rhysd/clever-f.vim') {{{
"|
"|
let g:clever_f_across_no_line = 0
let g:clever_f_ignore_case = 0
let g:clever_f_smart_case = 1
"|
"|
" }}}
" Easy-Motion (deps: 'Lokaltog/vim-easymotion') {{{
"|
"|
let g:EasyMotion_mapping_f = '<C-f>'
let g:EasyMotion_mapping_F = '<C-d>'
let g:EasyMotion_do_shade = 0
hi link EasyMotionTarget Search
"|
"|
" }}}
" Unimpaired (deps: 'tpope/vim-unimpaired') {{{
"|
"|
" Bubble selection
map  \-p [e==
map  \-n ]e==
vmap \-p [egv=gv
vmap \-n ]egv=gv

" Retain visual selection while shifting horizontally
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv
"|
"|
" }}}
" Tabular (deps: 'godlygeek/tabular') {{{
"|
"|
map ;t :Tabularize /
"|
"|
" }}}
" CtrlP (deps: 'kien/ctrlp.vim') {{{
"|
"|
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_max_files = 0
let g:ctrlp_max_height = 50

" Clear caches
call ctrlp#clra()
map ;pc :ClearAllCtrlPCaches<Return>

let g:ctrlp_custom_ignore = {
  \ 'dir':  'git\|node_modules\|bower_components\|public/vendor',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

map ;f :CtrlP<Return>

"let g:ctrlp_extensions = ['funky']
"map <C-f> :CtrlPFunky<Return>
"|
"|
" }}}
" Ag (deps: 'rking/ag.vim') {{{
"|
"|
let g:aghighlight = 1

function! HighlightResult()
  execute 'match IncSearch /\%'.line('.').'l/'
endfunction
map ;X :call HighlightResult()<Return>

function! UnHighlightResult()
  execute 'match IncSearch /______/'
endfunction
map ;x :call UnHighlightResult()<Return>

function! RunAg()
  exe "wall!"

  let s:defaultQuery = ""
  let s:query = input("ag: ", s:defaultQuery)

  let s:defaultOptions = "-S "
  call ag#Ag('grep', s:defaultOptions . s:query)

  let @/=s:query
  set hlsearch
endfunction

command! RunAg call RunAg()
nmap ;g :RunAg<Return>
nmap ;j :RunAg<Return><C-r><C-w>


augroup vimrcQFCRFix
  autocmd!
  "autocmd Filetype qf set cursorline

  autocmd Filetype qf nnoremap <buffer> j         j<Return>:call HighlightResult()  <Return><C-w>p
  autocmd Filetype qf nnoremap <buffer> k         k<Return>:call HighlightResult()  <Return><C-w>p
  autocmd Filetype qf nnoremap <buffer> <Return>  <Return>:call UnHighlightResult()<Return>
  autocmd Filetype qf nnoremap <buffer> s         <C-w>W<C-w>s<C-w>w
augroup END
"|
"|
" }}}
" Vimshell (deps: 'Shougo/vimproc.vim', 'Shougo/vimshell.vim') {{{
"|
"|
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt = '$ '
"|
"|
" }}}
" Unite (deps: 'Shougo/unite.vim') {{{
"|
"|
let g:unite_source_history_yank_enable=1
let g:unite_source_history_yank_limit=10000
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column -S'
let g:unite_source_grep_recursive_opt = ''


call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec/async', 'ignore_pattern', 'node_modules/\|bower_components/\|public/vendor/')
call unite#filters#sorter_default#use(['sorter_rank'])
"call unite#filters#sorter_default#use(['sorter_length'])

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:SuperTabDisabled=1
  imap <buffer>               <C-j>   <Plug>(unite_select_next_line)
  imap <buffer>               <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x>          unite#do_action('split')
  imap <silent><buffer><expr> <C-v>          unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t>          unite#do_action('tabopen')
  imap <silent><buffer><expr> <C-e>          unite#do_action('open')

  nmap <buffer> <C-c> <Plug>(unite_exit)
endfunction

nnoremap [unite] <Nop>
nmap <space> [unite]

map [unite]f :Unite -no-split -start-insert                         file_rec/async  <Return>
map [unite]o :Unite -no-split -start-insert                         buffer          <Return>
map [unite]y :Unite -no-split -start-insert                         history/yank    <Return>
map [unite]g :Unite -no-split -start-insert -auto-preview           grep            <Return><Return>
map [unite]G :Unite           -start-insert -auto-preview           grep            <Return><Return>

map [unite]: :Unite -no-split -start-insert                         history/command <Return>
map [unite]/ :Unite -no-split -start-insert                         history/search  <Return>

map [unite];l :Unite -no-split -start-insert -input=lib             file_rec/async  <Return>
map [unite];s :Unite -no-split -start-insert -input=testspec        file_rec/async  <Return>

map [unite];a :Unite -no-split -start-insert -input=app             file_rec/async  <Return>
map [unite];m :Unite -no-split -start-insert -input=app/models      file_rec/async  <Return>
map [unite];c :Unite -no-split -start-insert -input=app/controllers file_rec/async  <Return>
map [unite];v :Unite -no-split -start-insert -input=app/views       file_rec/async  <Return>
map [unite];t :Unite -no-split -start-insert -input=test            file_rec/async  <Return>
"|
"|
" }}}
" Mark (deps: 'vim-scripts/Mark--Karkat) {{{
"|
"|
map ;h <Plug>MarkSet
map ;r <Plug>MarkRegex

highlight def MarkWord1  ctermbg=Green    ctermfg=Black  guibg=#A4E57E    guifg=Black
highlight def MarkWord2  ctermbg=Yellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
highlight def MarkWord3  ctermbg=Red      ctermfg=Black  guibg=#FF7272    guifg=Black
highlight def MarkWord4  ctermbg=Blue     ctermfg=Black  guibg=#9999FF    guifg=Black
highlight def MarkWord5  ctermbg=Magenta  ctermfg=Black  guibg=#FFB3FF    guifg=Black
highlight def MarkWord6  ctermbg=Cyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
"|
"|
" }}}
" Text objects {{{
"|
"|
" Motions for "next/last object"
" For example, "din(" would go to the next "()" pair " and delete its contents.
" 'all next <delimiter>'
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<Return>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<Return>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<Return>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<Return>

" 'all previous <delimiter>'
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<Return>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<Return>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<Return>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<Return>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
"|
"|
" }}}
" Filetype settings {{{
"|
"|
filetype on
filetype plugin on
filetype indent on
"|
"|
" }}}
" Insert mode {{{
"|
"|
imap <C-d> <right><C-h>
" Paste register 0
imap <C-y> <C-r>"
" Umlaute
"imap <Tab>o ö
"imap <Tab>a ä
"imap <Tab>u ü
"imap <Tab>s ß
"|
"|
" }}}
" Colorscheme HACKS {{{
"|
"|
" Status line / tab line
hi Statusline  ctermbg=12   ctermfg=black
hi TabLineFill ctermfg=247  ctermbg=238    cterm=none
hi TablineSel  ctermfg=0    ctermbg=12     cterm=none

" Indicate long lines
set colorcolumn=+1
hi ColorColumn ctermbg=236
let &colorcolumn=join(range(81,81),",")

" Comment
hi Comment   ctermfg=8       ctermbg=none    cterm=none
" Search
hi IncSearch ctermfg=0       ctermbg=46      cterm=none
hi Search    ctermfg=46      ctermbg=0       cterm=bold,underline

" Misc
hi VertSplit ctermbg=Black
"|
"|
" }}}
" Misc keybindings {{{
"|
"|
" Toggle line numbers
nnoremap <silent>\-N :set number!<Return>

" Clipboard (Mac OS X)
vmap <silent>Y :w !reattach-to-user-namespace pbcopy<CR><CR>

" Macros
nnoremap <C-e> @q

" Toggle folds
map \f za
"|
"|
" }}}
