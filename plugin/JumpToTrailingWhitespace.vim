" JumpToTrailingWhitespace.vim: Motions to locate unwanted whitespace at the end of lines.
"
" DEPENDENCIES:
"   - ShowTrailingWhitespace plugin (optional)
"
" Copyright: (C) 2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	001	07-Mar-2012	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_JumpToTrailingWhitespace') || (v:version < 700)
    finish
endif
let g:loaded_JumpToTrailingWhitespace = 1
let s:save_cpo = &cpo
set cpo&vim

function! s:Pattern()
    let l:pattern = '\s\+$'

    " The ShowTrailingWhitespace plugin can define exceptions where whitespace
    " should be kept; use that knowledge if it is available.
    silent! let l:pattern = ShowTrailingWhitespace#Pattern(0)

    return l:pattern
endfunction

function! JumpToTrailingWhitespace#Jump( mode, isPrevious )
    if a:mode ==# 'v'
	normal! gv
    endif

    if search(s:Pattern(), (a:isPrevious ? 'b' : ''))
	" Open the fold at the jump target, like the built-in jumps do.
	normal! zv
    else
	execute "normal! \<C-\>\<C-n>\<Esc>" | " Beep.
    endif
endfunction

function! s:CreateMotionMappings()
    for l:mode in ['n', 'o', 'v']
	for l:isPrevious in [0, 1]
	    let l:targetMapping = '<Plug>(JumpToTrailingWhitespace' . (l:isPrevious ? 'Prev' : 'Next') . ')'
	    execute printf('%snoremap %s :<C-u>call JumpToTrailingWhitespace#Jump(%s, %d)<CR>',
	    \	l:mode,
	    \	l:targetMapping,
	    \	string(l:mode),
	    \	l:isPrevious
	    \)
	    if ! hasmapto(l:targetMapping, l:mode)
		execute (l:mode ==# 'v' ? 'x' : l:mode) . 'map <silent> ' . (l:isPrevious ? '[' : ']') . '$ ' . l:targetMapping
	    endif
	endfor
    endfor
endfunction

call s:CreateMotionMappings()
delfunction s:CreateMotionMappings

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
