" s:extend from https://github.com/junegunn/fzf.vim/blob/master/autoload/fzf/vim/complete.vim under MIT
function! s:extend(base, extra)
  let g:base=a:base
  let g:extra=a:extra
  let base = copy(a:base)
  if has_key(a:extra, 'options')
    let extra = copy(a:extra)
    let extra.extra_options = remove(extra, 'options')
    return extend(base, extra)
  endif
  return extend(base, a:extra)
endfunction

let s:path = expand('<sfile>:p:h:h:h')
function! fzf_wordnet#fn#Complete(...)
  let s:words_file = get(g:, 'words_file', s:path.'/words/words')
  return fzf#vim#complete(s:extend({
        \ 'source':  'cat '.s:words_file,
        \ 'options': ['-i', '--preview', s:path.'/bin/dic {}', '--preview-window=up:60%']},
        \ get(a:000, 0, fzf#wrap())))
endfunction
