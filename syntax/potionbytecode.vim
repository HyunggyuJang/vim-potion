if exists ("b:current_syntax")
	finish
endif

syntax match potionByteMetaKeyword "\v^\.\w+"
syntax match potionByteComment "\v;.*$"
syntax match potionByteAnnounce "^\*\*.*$"

syntax region potionByteClass start=/\v--/ end=/v--/

highlight link potionByteMetaKeyword Keyword
highlight link potionByteComment Comment
highlight link potionByteClass SpecialComment
highlight link potionByteAnnounce SpecialComment

let b:current_syntax = "potionBytecode"
