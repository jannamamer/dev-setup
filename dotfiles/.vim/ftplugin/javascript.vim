" " Syntastic setting
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" Ale settings
let g:ale_fixers = {
 \ 'javascript': ['prettier', 'eslint']
 \ }
let g:ale_linters = {
 \ 'javascript': ['prettier', 'eslint', 'flow']
 \ }
