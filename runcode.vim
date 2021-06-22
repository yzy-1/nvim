let g:compileCommands = {
			\ 'c': "gcc -std=c99 -Wall -g \"%\" -o \"%<\" -lm -fsanitize=undefined",
			\ 'cpp': "g++ -Wall -g \"%\" -o \"%<\" -lm -fsanitize=undefined",
			\ 'go': "go build .",
			\ }


" 运行当前代码
function! RunCode()
	update
	cclose
	set splitbelow
	if &filetype == 'c' || &filetype == 'cpp'
		split
		res 10
		exec "terminal time ./\"%<\""
		normal i
	elseif &filetype == 'python'
		split
		res 10
		exec "terminal python3 \"%\""
		normal i
	elseif &filetype == 'go'
		split
		res 10
		exec "terminal go run ."
		normal i
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'vim'
		exec "source %"
	endif
endfunc

" 编译当前代码
function! CompileCode()
	if has_key(g:compileCommands, &filetype)
		update
		exec "AsyncRun " . g:compileCommands[&filetype]
	endif
endfunc

func! ParseTask()
	FloatermNew --autoclose=2 parse2cf
endfunc

func! RunTests()
	update
	set splitbelow
	split
	res 10
	terminal cf test
	normal i
endfunc

nmap <LEADER>fr :call RunCode()<CR>
nmap <LEADER>fb :call CompileCode()<CR>
nmap <LEADER>fp :call ParseTask()<CR>
nmap <LEADER>ft :call RunTests()<CR>
