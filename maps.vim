let mapleader=" "

"My custom maps
"inoremap hd <Esc>

nnoremap <C-c> :Centerpad<cr>
"Horizontal Sroll
map <C-L> 20zl 
map <C-H> 20zh 

"Format on selected
vmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)
map  <leader>ff :CocCommand prettier.formatFile<CR>

" source %
map <leader>% :source %<CR>

"Dart and flutter
map <leader>df :DartFmt<CR>
map <leader>fr :CocCommand flutter.run<CR>
map <leader>fe :CocCommand flutter.emulators<CR>
map <leader>ft :CocCommand flutter.toggleOutline<CR>
map <leader>fq :CocCommand flutter.dev.quit<CR>
map <leader>fR :CocCommand flutter.dev.hotRestart<CR>
map <leader>fg :CocCommand flutter.dev.openDevLog<CR>
map <leader>fc :CocCommand flutter.dev.clearDevLog<CR>
map <leader>fd :CocCommand flutter.dev.openDevToolsProfiler<CR>
map <leader>fwi :CocCommand flutter.dev.showWidgetInspectorOverride<CR>

" parentheses jump
map <leader>j %

" fast init or final code line
map <leader>l $
map <leader>h 0

" scrolling
noremap t :tabprevious<cr>
noremap s :tabnext<cr>

" faster scrolling
nnoremap <silent> <C-e> 5<C-e>
nnoremap <silent> <C-y> 5<C-y>

"search
map <Leader>nl :nohl<CR>

" testing Jest
"nnoremap <Leader>t :TestNearest<CR>
"nnoremap <Leader>T :TestFile<CR>
"nnoremap <Leader>TT :TestSuite<CR>

" testing Vitest
nnoremap <Leader>t :CocCommand vitest.singleTest<CR>
nnoremap <Leader>T :CocCommand vitest.fileTest<CR>
nnoremap <Leader>TT :CocCommand vitest.projectTest<CR>

" split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" quick semi
nnoremap <Leader>; $a;<Esc>
nnoremap <Leader>, $a,<Esc>

"Save and Quit
nnoremap <Leader>s :w<CR>
nnoremap <Leader>w :q<CR>

" shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev blame Gblame
cnoreabbrev find NERDTreeFind
cnoreabbrev diff Gdiff

" plugs
map <Leader>nt :NERDTreeFind<CR>
map <Leader>p :Telescope find_files<CR>
map <Leader>rg :Telescope live_grep<CR>
map <Leader>rt :Telescope git_
map <Leader>b :Telescope buffers<cr>


" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
 
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" diagnostics
nnoremap <leader>kp :let @*=expand("%")<CR>


" Easymotion
nmap <Leader>m <Plug>(easymotion-s2)

" git
nnoremap <Leader>G :Git<cr>
nnoremap <Leader>gp :Git -c push.default=current push<cr>
nnoremap <Leader>gl :Git pull<cr>
nnoremap <Leader>gc :Git commit -m ''<Left>
nnoremap <Leader>gk :Git checkout 

" run current file
"nnoremap <Leader>x :!node %<cr>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" confirm config with enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Integrated Terminal
set splitright

function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal - Set here your terminal (bash, cmd, powershell)
    execute "vsp term://fish" 

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

"Debuggin
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dn :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dt :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
