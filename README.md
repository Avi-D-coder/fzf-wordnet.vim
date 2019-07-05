# fzf-wordnet
Dictionary completion powered by FZF and Wordnet for vim and your terminal.

## Vim/NeoVim
With vim-plug:

```vim
Plug 'junegunn/fzf.vim'
Plug 'Avi-D-coder/fzf-wordnet.vim'

imap <C-S> <Plug>(fzf-complete-wordnet)
```
![ezgif-4-32dc75db6d68](https://user-images.githubusercontent.com/29133776/60706168-de395500-9ed6-11e9-996c-58d2996c59ba.gif)

## Shell

```bash
export PATH="$XDG_CONFIG_HOME/nvim/plugged/fzf-wordnet.vim/bin:$PATH"
```
$ `spell`

## Credit
Shell scripts derived with permision from @ddrscott's blog post and @balta2ar's comment.
