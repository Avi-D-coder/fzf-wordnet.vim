inoremap <expr> <plug>(fzf-complete-wordnet) fzf_wordnet#fn#Complete()

function! OpenSpell(word)
  :vsplit term://~/.vim/plugged/fzf-wordnet.vim/bin/spell
  call feedkeys("i".a:word)
endfunction
command! -nargs=1 DefineWord :call OpenSpell(<q-args>)
