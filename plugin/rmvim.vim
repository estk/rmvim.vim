" rmvim.vim plugin
" Author: Wannes Meert
" Url: http://people.cs.kuleuven.be/wannes.meert/
" Version: 1.0.1
" Date: 03/06/2012

if exists('s:loaded')
	finish
endif
let s:loaded = 1

if !exists('g:rmvim_cmd')
	let g:rmvim_cmd = 'mvim'
endif

if !exists('g:rmvim_verbose')
	let g:rmvim_verbose = 0
endif

let s:scriptpath = expand('<sfile>:p:h')

fu! RmvimListenerStart()
	if has("gui_running")
		let verbosestr = ''
		if g:rmvim_verbose == 1
			let verbosestr = '-v'
		endif
		let cmd = '!'.s:scriptpath.'/../util/rmvim_listener '.verbosestr.' -c '.g:rmvim_cmd.'&'
		exec cmd
	endif
endfu

com! -nargs=0 RmvimListenerStart :call RmvimListenerStart()

" Autorun at startup
redir! > /tmp/foobar
silent RmvimListenerStart
redir END
"RmvimListenerStart
"silent exe "normal :RmvimListenerStart<CR>"

