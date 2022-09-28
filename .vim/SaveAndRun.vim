autocmd FileType python,sh nnoremap <buffer> <F5> :call SaveAndRunScript(0)<CR>
autocmd FileType python,sh nnoremap <buffer> <F6> :call SaveAndRunScript(1)<CR>

function SaveAndRunScript(farg=0)
    exec 'w'
    if a:farg==0
        let l:arg = ''
    else
        let l:arg = input('input argv: ')
    endif
    exec '!chmod u+x % && time ./% '.l:arg
endfunction

autocmd FileType make,cpp nnoremap <buffer> <F5> :call SaveAndRunCpp(0)<CR>
autocmd FileType make,cpp nnoremap <buffer> <F6> :call SaveAndRunCpp(1)<CR>

function SaveAndRunCpp(farg=0)
    exec 'w'
    if a:farg==0
        let l:arg = ''
    else
        let l:arg = input('input argv: ')
    endif

    if filereadable('Makefile')
        exec '!make && time ./%<.o '.l:arg
    else
        let l:cppflag = ''
        if search('^#include.*omp\.h')
            let l:cppflag .= ' -fopenmp'
        endif
        if search('^#include.*gsl.*\.h')
            let l:cppflag .= ' `gsl-config --libs`'
        endif
        exec '!g++ -Wall % -o %<.o'.l:cppflag.' && time ./%<.o '.l:arg
    endif
endfunction
