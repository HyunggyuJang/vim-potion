if !exists("g:potion_command")
	let g:potion_command = "potion"
endif

nnoremap <buffer> <localleader>r 
			\:call <SID>ReloadRun("potion#running#PotionCompileAndRunFile",0)<cr>
nnoremap <buffer> <localleader>b 
			\:call <SID>ReloadRun("potion#running#PotionShowBytecode",0)<cr>

function! s:ReloadRun(fnstr, reload)
	" As default, should not be reloaded
	" This function is only for answer to exercise 53.5
	if a:reload
		execute "silent! call " . join(split(a:fnstr,'#')[:-2],'#') . "#Reload()"
	endif
	execute "call " . a:fnstr . "()"
endfunction
