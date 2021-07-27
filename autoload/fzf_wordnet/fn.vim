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

" Derived from https://vi.stackexchange.com/a/17196
function! s:getCurrentWord()
  let c = col ('.')-1
  let l = line('.')
  let ll = getline(l)
  let ll1 = strpart(ll,0,c)
  let ll1 = matchstr(ll1,'\S*$')
  if strlen(ll1) == 0
    return ll1
  else
    let ll2 = strpart(ll,c,strlen(ll)-c+1)
    let ll2 = strpart(ll2,0,match(ll2,'$\|\s'))
    return ll1.ll2
  endif
endfunction

function! s:cap_reducer(words)
  let s:word = join(a:words)
  let s:cur = s:getCurrentWord()
  " Try to match the case of the word were completing.
  if len(s:cur) > 1 && s:cur ==# toupper(s:cur)
    return toupper(s:word)
  elseif !empty(s:cur) && s:cur[0] ==# toupper(s:cur[0])
    return toupper(s:word[0]).s:word[1:]
  else
    return tolower(s:word)
  endif
endfunction


let s:preview_arg = get(g:, 'fzf_wordnet_preview_arg', 'up:60%')
let s:path = expand('<sfile>:p:h:h:h')
execute '!make -C '.s:path.'/words && echo :) > ~/out.txt'
function! fzf_wordnet#fn#Complete(...)
  let s:words_file = get(g:, 'words_file', s:path.'/words/words')

  return fzf#vim#complete(s:extend({
        \ 'source': 'cat '.s:words_file,
        \ 'options': ['-i',
        \             '--preview', s:path.'/bin/dic {}',
        \             '--preview-window', s:preview_arg],
        \ 'reducer': function('<SID>cap_reducer')},
        \ get(a:000, 0, fzf#wrap())))
endfunction
