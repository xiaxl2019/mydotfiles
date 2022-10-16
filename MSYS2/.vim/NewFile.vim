autocmd BufNewFile *.py  0r ~/.vim/template/skeleton.py  | normal G
autocmd BufNewFile *.sh  0r ~/.vim/template/skeleton.sh  | normal G
autocmd BufNewFile *.cpp 0r ~/.vim/template/skeleton.cpp | normal Gdd2k
autocmd BufNewFile *.h   0r ~/.vim/template/skeleton.h | call ReplacePlace()

function ReplacePlace()
    exec '%s/GUARD_H_/'.toupper(expand('%<:t')).'_H_/g'
    exec '%s/classname/'.expand('%<:t').'/g'
    normal Gdd3k
    normal WgUl^
endfunction

