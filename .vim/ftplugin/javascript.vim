" " Syntastic setting
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" Ale settings
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier']
 \ }
let g:ale_linters = {
 \ 'javascript': ['eslint', 'prettier']
 \ }
