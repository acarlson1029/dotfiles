" Vim syntax file
" Language:     Minirunt Logs
" Maintainer:   Alex Carlson (alex.c@apple.com)
" Last Change:  July 30, 2014
" Version:      1

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=:
syn case ignore 


" Syntax Match RegExp
"syn match logHexNumber '0x[0-9a-fA-F]\+'
"syn match logNumber '/-\=\<\d\+\>/'
syn match logLoggerInfo	'-I- \S\+ '
"syn match logNumber '\<\d\+\>'
syn match logNumber '\<0x\x\+\>'
"syn match logNumber '\<=[0-9a-fA-F]\+\>'
syn match logTimestamp '^\d\+'
syn match logAFPacket '\<AF Packet\>'
syn match logWire 'chipTb[._a-zA-Z0-9]\+'
syn match logAssert 'ASSERT\S+'
syn match logDateTime '\v(Mon|Tue|Wed|Thu|Fri|Sat|Sun)\s(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s+\d+\s\d{2}:\d{2}:\d{2}\s\d{4}'

" Syntax Keywords
syn keyword logStatement setenv INFO 

" Syntax Regions
syn region logWarning 	start=/^Warning-/ end=/\n/
syn region logInfo		start=/^INFO:/ end=/\n/
syn region logInfo		start=/^*Denali*/ end=/\n/
syn region logError		start=/\v.*ASSERT_ERROR/ end=/\n/ 
syn region logError		start=/\v.*ASSERT_FATAL/ end=/\n/
syn region logError		start=/\v.*-E-/ end=/\n/
syn region logError		start=/\v.*-F-/ end=/\n/
syn region logError		start=/^Error/ end=/\n/
syn region logError		start=/AMS:FAILURE/ end=/\n/
syn region logFail		start=/\*\{36\}[\n\s\*]\+\s\+\*\n\*\s\+F\+/ end=/\*\n\*\{36\}/
syn region logPass		start=/\*\{36\}[\n\s\*]\+\s\+\*\n\*\s\+P\+/ end=/\*\n\*\{36\}/

" Highlighting
"highlight link logHexNumber		number
highlight link logTimestamp 	comment
highlight link logNumber 		number
highlight link logStatement		statement
highlight link logWarning 		warningmsg
highlight link logAFPacket		identifier
highlight link logInfo			ignore
highlight link logLoggerInfo		comment
highlight link logWire			string
highlight logFail				ctermfg=red
highlight logPass				ctermfg=green
highlight logDateTime			ctermfg=blue
highlight link logError			error

let b:current_syntax = "minirunt"
