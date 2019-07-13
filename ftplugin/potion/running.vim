nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>

if !exists("g:potion_command")
	let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
	" save the current changes in buffer.
	write
	silent !clear
	execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
	" save the current changes in buffer.
	write

	" Get the bytecode.
	let bytecode = system(g:potion_command . " -c -V " . bufname("%") . " 2\>&1")

	" Get the window number which contain Potion Bytecode
	let bytecodeWinNum = bufwinnr("__Potion_Bytecode__")

	if bytecodeWinNum ==# -1 " if not exists
		" Open a new split and set it up.
		vsplit __Potion_Bytecode__
		setfiletype potionbytecode
		setlocal buftype=nofile
	else
		" Go to existing window
		execute bytecodeWinNum . "wincmd w"
	endif
	normal! ggdG

	" Insert the bytecode.
	call append(0, split(bytecode, '\v\n'))
endfunction
