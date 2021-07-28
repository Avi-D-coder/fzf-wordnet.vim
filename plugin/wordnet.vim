inoremap <expr> <plug>(fzf-complete-wordnet) fzf_wordnet#fn#Complete()

function! OpenSpell(word)
  let s:path = expand('<sfile>:p:h')
  execute 'vsplit term://'.s:path.'/bin/spell'
  # inserts word
  call feedkeys("i".a:word)
endfunction
command! -nargs=1 DefineWord :call OpenSpell(<q-args>)
