" Vim syntax file
" Language:     Pastek
" Maintainer:   Baptiste Fontaine <b@ptistefontaine.fr>
" Filenames:    *.pastek
" Last Change:  2013 Sept 24
"
" This syntax file is heavily based on Tim Pope's Markdown syntax file.

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'pastek'
endif

runtime! syntax/html.vim
unlet! b:current_syntax

syn sync minlines=10
syn case ignore

syn match pastekValid '[<>]\c[a-z/$!]\@!'
syn match pastekValid '&\%(#\=\w*;\)\@!'

syn match pastekLineStart "^[<@]\@!" nextgroup=@pastekBlock,htmlSpecialChar

syn cluster pastekBlock contains=pastekH1,pastekH2,pastekH3,pastekH4,pastekH5,pastekH6,pastekListMarker,pastekCodeBlock,pastekTable
syn cluster pastekInline contains=pastekItalic,pastekBold,pastekCode,pastekEscape,pastekSubscript,pastekSuperscript,@htmlTop,pastekError

syn region pastekH1 matchgroup=pastekHeadingDelimiter start="##\@!"      end="\s*$" keepend oneline contains=@pastekInline contained
syn region pastekH2 matchgroup=pastekHeadingDelimiter start="###\@!"     end="\s*$" keepend oneline contains=@pastekInline contained
syn region pastekH3 matchgroup=pastekHeadingDelimiter start="####\@!"    end="\s*$" keepend oneline contains=@pastekInline contained
syn region pastekH4 matchgroup=pastekHeadingDelimiter start="#####\@!"   end="\s*$" keepend oneline contains=@pastekInline contained
syn region pastekH5 matchgroup=pastekHeadingDelimiter start="######\@!"  end="\s*$" keepend oneline contains=@pastekInline contained
syn region pastekH6 matchgroup=pastekHeadingDelimiter start="#######\@!" end="\s*$" keepend oneline contains=@pastekInline contained

syn region pastekCodeBlock start="```$" end="^```$"

syn match pastekListMarker "\*\+\%(\s\+\S\)\@=" contained

syn region pastekItalic start="`\@<!``\@!"   end="`\@<!``\@!"   contains=pastekInline contained
syn region pastekBold   start="`\@<!```\@!"  end="`\@<!```\@!"  contains=pastekInline contained
syn region pastekCode   start="`\@<!````\@!" end="`\@<!````\@!" keepend matchgroup=pastekCodeDelimiter contained

syn region pastekComment start="(\*\*\@!" end="\*)" contains=pastekComment
syn region pastekLineComment start="(\*\*" end="$"

syn region pastekSubscript   matchgroup=pastekSubSupDelimiter start="\^{" end="}" oneline contained contains=pastekInline
syn region pastekSuperscript matchgroup=pastekSubSupDelimiter start="_{"  end="}" oneline contained contains=pastekInline

syn cluster pastekTable           contains=pastekTableLine,@pastekTableDelimiters
syn cluster pastekTableDelimiters contains=pastekTableLineDelimiter,pastekTableCellDelimiter
syn match pastekTableLineDelimiter "+-\++" contained
syn match pastekTableCellDelimiter "|\@<!||\@!" contained
syn region pastekTableLine start="|\@<!||\@!" end="|\@<!||\@!" oneline contained contains=pastekTableCellDelimiter,pastekInline

syn match pastekSpecialChar "&[abcdegiklmnoprstuwxyzABCDEGIKLMNOPRSTUWXYZ][a-zA-Z]\@!"
syn match pastekError      "&[^abcdegiklmnoprstuwxyzABCDEGIKLMNOPRSTUWXYZ][a-zA-Z]\@!"

syn match pastekEscape "\\[-|\\`*_\[\]{}()#+.!&]"

hi def link pastekH1                 htmlH1
hi def link pastekH2                 htmlH2
hi def link pastekH3                 htmlH3
hi def link pastekH4                 htmlH4
hi def link pastekH5                 htmlH5
hi def link pastekH6                 htmlH6
hi def link pastekListMarker         htmlTagName

hi def link pastekItalic             htmlItalic
hi def link pastekBold               htmlBold

hi def link pastekCodeDelimiter      Delimiter
hi def link pastekSubSupDelimiter    Delimiter
hi def link pastekTableDelimiters    Delimiter

hi def link pastekComment            Comment
hi def link pastekLineComment        Comment

hi def link pastekEscape             Special
hi def link pastekSpecialChar        Special

hi def link pastekError              Error

let b:current_syntax = "pastek"
if main_syntax ==# 'pastek'
  unlet main_syntax
endif

" vim:set sw=2:
