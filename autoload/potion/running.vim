echom "Autoloading..."

" detect the number of called
" if exists("g:count")
	" let g:count += 1
" else
	" let g:count = 1
" endif

function! potion#running#PotionCompileAndRunFile()
	" save the current changes in buffer.
	write
	silent !clear
	execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! potion#running#PotionShowBytecode()
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
