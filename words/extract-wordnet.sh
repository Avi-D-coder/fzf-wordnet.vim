#!/bin/sh

if [ -z $1 ] || [ -z $2 ]; then
    echo 'Useage: `extract-wordnet.sh [wordnet/dict directory] [output words file]`'
    exit
fi

dir=$(realpath $1)

# Reset file if it already exists
echo > $2
# Derived from balta2ar's comments on https://ddrscott.github.io/blog/2017/fzf-dictionary/
echo 'collecting from data files'
tail -n +30 $dir/data.* | cut -f5 -d' ' | sed -e 's/_/ /g' >>$2

echo 'collecting from index files'
tail -n +30 $dir/index.[anv]* | cut -f1 -d' ' | sed -e 's/_/ /g' >>$2

echo 'sorting'
sort -u -o $2 $2
