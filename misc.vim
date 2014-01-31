" vim:fdm=marker

" Clean empty buffers {{{
"|
"|
function! CleanEmptyBuffers()
  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
    exe 'bw '.join(buffers, ' ')
  endif
endfunction
command! CleanEmptyBuffers call CleanEmptyBuffers()
"|
"|
" }}}
" NUMBERED SPLIT WINDOWS {{{
"|
"|
let i = 1
while i <= 9
  execute 'nnoremap <silent>;' . i . ' :' . i . 'wincmd w<CR>'
  let i = i + 1
endwhile

function! WindowNumber()
  let str=tabpagewinnr(tabpagenr())
  return str
endfunction
"|
"|
" }}}
" SWAP WINDOWS {{{
"|
"|
function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"

  let markedBuf = bufnr( "%" )
  exe 'hide buf' curBuf
  exe curNum . "wincmd w"
  exe 'hide buf' markedBuf
endfunction
"|
"|
" }}}
" STATUS LINE {{{
"|
"|
highlight User1 ctermfg=46 ctermbg=234 cterm=bold
function! StatusPath()
  let s:dir = expand('%:h')
  let s:file = expand('%:t')

  return s:dir == '.' ? s:file : s:dir . '/' . s:file
endfunction

set statusline=
set statusline=\ %1*[\ %{WindowNumber()}\ ]%*\ " window number
set statusline+=%h%m%r%w\         " flags
set statusline+=%{StatusPath()}
set statusline+=%=                " seperate between right- and left-aligned
set statusline+=\ %l\|%c          " line and column
set statusline+=\ \ %P\           " percentage
"|
"|
" }}}
