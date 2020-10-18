set tabstop=4
set softtabstop=4
set shiftwidth=4

" " Syntastic
" let g:syntastic_enable_elixir_checker = 1

" Ale settings
let g:ale_elixir_elixir_ls_release='~/src/elixir-ls/release'
let g:ale_linters = {
 \ 'elixir': ['credo', 'dialyxir', 'elixir-ls', 'mix']
 \ }
let g:ale_fixers = {
 \ 'elixir': ['mix_format', 'remove_trailing_lines', 'trim_whitespace']
 \ }

" " Mix format settings
" let g:mix_format_on_save = 1
" let g:mix_format_options = '--check-equivalent'

" Credo
function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

" Run Credo in Project
function! RunPhoenixCredo(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!time docker-compose run web-test mix credo --strict " . a:filename
endfunction

" Run Credo in File
function! RunPhoenixCredoFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  call SetTestFile()
  call RunPhoenixCredo(t:grb_test_file . command_suffix)
endfunction

" Run Credo in Line
function! RunNearestCredoLine()
  let spec_line_number = line('.')
  call RunPhoenixCredoFile(":" . spec_line_number)
endfunction

" Run only the example under the cursor
map <leader>yl :call RunNearestCredoLine()<cr>
" Run this file
map <leader>yy :call RunPhoenixCredoFile()<cr>
" Run all test files
map <leader>ya :call RunPhoenixCredo('')<cr> 

function! ExecuteUmbrellaTest(filename)
  " if match(a:filename, "lic_client") || match(a:filename, "lic_common")
    " exec ":!time docker-compose run test mix test " . a:filename
  " else 
    exec ":!time docker-compose run web-test mix test " . a:filename
  " endif
endfunction

" Phoenix Test helpers
function! RunPhoenixTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo

  call ExecuteUmbrellaTest(a:filename)

endfunction

function! RunPhoenixTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_test.exs$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunPhoenixTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestPhoenixTest()
  let spec_line_number = line('.')
  call RunPhoenixTestFile(":" . spec_line_number)
endfunction

" Run only the example under the cursor
map <leader>tl :call RunNearestPhoenixTest()<cr>
" Run this file
map <leader>tt :call RunPhoenixTestFile()<cr>
" Run all test files
map <leader>ta :call RunPhoenixTests('')<cr>
