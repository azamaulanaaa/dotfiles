" Custom function for import config from relative path
function! I(relativePath)
	let root = expand('%:p:h')
	let fullpath = root.'/'.a:relativePath
	exec 'source '.fullpath
endfunction

" Import user configuration
call I('user.vim')

" Import vim-plug config
call I('plug.vim')
