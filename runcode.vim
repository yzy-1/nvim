let g:compileCommands = {
			\ 'c': "gcc -std=c99 -Wall -Wextra -g \"%\" -o \"%<\" -lm -fsanitize=undefined",
			\ 'cpp': "g++ -Wall -Wextra -Werror -g \"%\" -o \"%<\" -lm -fsanitize=undefined",
			\ 'go': "go build .",
			\ }


" 运行当前代码
function! RunFile()
	exec "w"
	exec "set splitbelow"
	if &filetype == 'c' || &filetype == 'cpp'
		exec "split"
		exec "res 10"
		exec "terminal ./%<"
		exec "normal i"
	elseif &filetype == 'python'
		exec "split"
		exec "res 10"
		exec "terminal python3 %"
		exec "normal i"
	elseif &filetype == 'go'
		exec "split"
		exec "res 10"
		exec "terminal go run ."
		exec "normal i"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'vim'
		exec "source %"
	endif
endfunc

" 编译当前代码
function! CompileFile()
	if has_key(g:compileCommands, &filetype)
		exec "w"
		exec "!" . g:compileCommands[&filetype]
	endif
endfunc

" 编译当前代码（异步）
function! CompileFileAsync()
	if has_key(g:compileCommands, &filetype)
		exec "w"
		exec "AsyncRun " . g:compileCommands[&filetype]
	endif
endfunc

func! CompileAndRunFile()
	call CompileFile()
	call RunFile()
endfunc

func! ParseTask()
	FloatermNew parse2cf
endfunc

func! RunTests()
	update
	set splitbelow
	split
	res 10
	terminal cf test
	normal i
endfunc

nmap <LEADER>fr :call CompileAndRunFile()<CR>
nmap <LEADER>fR :call RunFile()<CR>
nmap <LEADER>fb :call CompileFileAsync()<CR>
nmap <LEADER>fB :call CompileFile()<CR>
nmap <LEADER>fp :call ParseTask()<CR>
nmap <LEADER>ft :call RunTests()<CR>
