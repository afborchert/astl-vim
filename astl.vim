" Astl syntax file
" Language:	Astl
" Maintainer:	Andreas Franz Borchert <andreas.borchert@uni-ulm.de>
" Last Change:	2011 Aug 31

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

" initial #! line
syntax match astShebang /^#!.*/

" Keywords
syntax keyword astRuleSet attribution import library operators print
syntax keyword astRuleSet sub rules transformation post pre inplace
syntax keyword astRuleSet abstract state machine opset
syntax keyword astStatement else elsif foreach if in return while
syntax keyword astStatement shared private var
syntax keyword astOperator and as at div exists left mod nonassoc
syntax keyword astOperator or right when where x on
syntax keyword astOperator cache create close cut delete retract
syntax keyword astConstant null

" Standard functions
syntax keyword astFunction assert defined integer isoperator isstring
syntax keyword astFunction len location operator push println prints string
syntax keyword astFunction tokenliteral tokentext type gentext clone copy
syntax keyword astFunction cfg_connect cfg_node cfg_type
" Standard identifiers
syntax keyword astPredefined root graph

syntax keyword astBoolean true false

syntax match astIdentifier /[A-Za-z_][A-Za-z0-9_]*/
syntax match astNumber /[0-9][0-9]*/
syntax match astHere /here[0-9]*/
syntax region astComment start="/\*" end="\*/"
syntax region astComment start="//" end="$"
syntax region astString start=/"/ skip=/\\"/ end=/"/
syntax region astBlock start=/{/ end=/}/ contains=TOP
syntax region astText matchgroup=astText start=/q{/ end=/}/ contains=@InsideText
syntax region astRegexp start=/m{/ end=/}/
syntax region astList start=/\[/ end=/\]/ contains=TOP

syntax cluster InsideText contains=astInterpolation,astInterpolatedExpression,astNestedBlocks
syntax match astInterpolation /\$\([A-Za-z_][A-Za-z0-9_]*\|\.\.\.\)/ contained
syntax region astNestedBlocks start=/{/ end=/}/ contains=@InsideText contained
"syntax region astInterpolatedExpression start=/\${/rs=s+2 end=/}/ contains=ALLBUT,@InsideText contained
syntax region astInterpolatedExpression matchgroup=astInterpolatedExpression start=/\${/ end=/}/ contains=ALLBUT,@InsideText contained

highlight link astShebang Macro
highlight link astStatement Statement
highlight link astOperator Operator
highlight link astConstant Constant
highlight link astRuleSet Type
highlight link astIdentifier Identifier
highlight link astString String
highlight link astRegexp String
highlight link astComment Comment
highlight link astNumber Number
highlight link astBoolean Boolean
highlight link astText String
highlight link astInterpolation Identifier
highlight link astInterpolatedExpression Normal
highlight link astNestedBlocks String
highlight link astFunction Macro
highlight link astPredefined Macro
highlight link astHere Macro
