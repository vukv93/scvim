" Load up supercollider plugin on opening a supercollider file (*.sc, *.scd)
" These are mostly the original files from the former .scvimrc
" Put your customizations into your own .vimrc

" ====================================
" Start the plugin

" set up the plugin
au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set filetype=supercollider
au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd runtime ftplugin/supercollider.vim
au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd runtime indent/sc_indent.vim
au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd let &iskeyword="@,48-57,_,192-255"

au BufEnter,BufWinEnter,BufNewFile,BufRead *.schelp set filetype=scdoc
au BufEnter,BufWinEnter,BufNewFile,BufRead *.schelp runtime syntax/scdoc.vim

" set this via EXPORT ... if you want to change it
if exists("$SCVIM_TAGFILE")
  let s:sclangTagsFile = $SCVIM_TAGFILE
else
  let s:sclangTagsFile = "~/.sctags"
endif

au FileType supercollider execute "set tags+=".s:sclangTagsFile

"  matchit
au Filetype supercollider let b:match_skip = 's:scComment\|scString\|scSymbol'
au Filetype supercollider let b:match_words = '(:),[:],{:}'

" key bindings

if exists("g:scLeader")
    let maplocalleader = g:scLeader
endif

au Filetype supercollider nnoremap <buffer> <LocalLeader>st :call SClang_block()<CR>
au Filetype supercollider vnoremap <buffer> <LocalLeader>s :call SClang_send()<CR>
au Filetype supercollider nnoremap <buffer> <LocalLeader>ss :call SClang_line()<CR>
au Filetype supercollider vnoremap <buffer> <LocalLeader>s :call SClang_line()<CR>
au Filetype supercollider nnoremap <buffer> <LocalLeader>rr :call SClangStart()<CR>
au Filetype supercollider nnoremap <buffer> <LocalLeader>rs :call SClangKillIfStarted()<CR>
au Filetype supercollider nnoremap <buffer> <LocalLeader>re :call SClangHardstop()<CR>

au Filetype supercollider nnoremap <LocalLeader>sk :SClangRecompile<CR>
au Filetype supercollider nnoremap <buffer>K :call SChelp(expand('<cword>'))<CR>
au Filetype supercollider inoremap <C-Tab> <Esc>:call SCfindArgs()<CR>a
au Filetype supercollider nnoremap <C-Tab> :call SCfindArgs()<CR>
au Filetype supercollider vnoremap <C-Tab> :call SCfindArgsFromSelection()<CR>

" DEPRECATED
if 0
    au Filetype supercollider inoremap <buffer> <LocalLeader>ss <Esc>:call SClang_line()<CR>a
    au Filetype supercollider inoremap <buffer> <LocalLeader>st <Esc>:call SClang_block()<CR>a
    au Filetype supercollider nnoremap <LocalLeader>sd yiw :call SChelp(""")<CR>
    au Filetype supercollider nnoremap <LocalLeader>sj yiw :call SCdef(""")<CR>
    au Filetype supercollider nnoremap <LocalLeader>si yiw :call SCimplementation(""")<CR>
    au Filetype supercollider nnoremap <LocalLeader>sr yiw :call SCreference(""")<CR>
endif

