package tm

import (
	"fmt"
)

type Token int

const (
	UNAVAILABLE Token = iota - 1

	// An end-of-input marker token.
	EOI

	REGEXP
	SCON
	ICON
	_SKIP
	_SKIP_COMMENT
	_SKIP_MULTILINE
	REM // %
	COLONCOLONASSIGN // ::=
	COLONCOLON // ::
	OR // |
	OROR // ||
	ASSIGN // =
	ASSIGNASSIGN // ==
	EXCLASSIGN // !=
	ASSIGNGT // =>
	SEMICOLON // ;
	DOT // .
	COMMA // ,
	COLON // :
	LBRACK // [
	RBRACK // ]
	LPAREN // (
	RPAREN // )
	LBRACETILDE // {~
	RBRACE // }
	LT // <
	GT // >
	MULT // *
	PLUS // +
	PLUSASSIGN // +=
	QUEST // ?
	EXCL // !
	TILDE // ~
	AND // &
	ANDAND // &&
	DOLLAR // $
	ATSIGN // @
	ERROR
	ID
	LTRUE // true
	LFALSE // false
	LNEW // new
	LSEPARATOR // separator
	LAS // as
	LIMPORT // import
	LSET // set
	LBRACKETS // brackets
	LINLINE // inline
	LPREC // prec
	LSHIFT // shift
	LRETURNS // returns
	LINPUT // input
	LLEFT // left
	LRIGHT // right
	LNONASSOC // nonassoc
	LGENERATE // generate
	LASSERT // assert
	LEMPTY // empty
	LNONEMPTY // nonempty
	LGLOBAL // global
	LEXPLICIT // explicit
	LLOOKAHEAD // lookahead
	LPARAM // param
	LFLAG // flag
	LNOEOI // no-eoi
	LSOFT // soft
	LCLASS // class
	LINTERFACE // interface
	LVOID // void
	LSPACE // space
	LLAYOUT // layout
	LLANGUAGE // language
	LLALR // lalr
	LLEXER // lexer
	LPARSER // parser
	LREDUCE // reduce
	CODE // {
	LBRACE // {

	terminalEnd
)

var tokenStr = [...]string{
	"EOF",

	"REGEXP",
	"SCON",
	"ICON",
	"_SKIP",
	"_SKIP_COMMENT",
	"_SKIP_MULTILINE",
	"%",
	"::=",
	"::",
	"|",
	"||",
	"=",
	"==",
	"!=",
	"=>",
	";",
	".",
	",",
	":",
	"[",
	"]",
	"(",
	")",
	"{~",
	"}",
	"<",
	">",
	"*",
	"+",
	"+=",
	"?",
	"!",
	"~",
	"&",
	"&&",
	"$",
	"@",
	"ERROR",
	"ID",
	"true",
	"false",
	"new",
	"separator",
	"as",
	"import",
	"set",
	"brackets",
	"inline",
	"prec",
	"shift",
	"returns",
	"input",
	"left",
	"right",
	"nonassoc",
	"generate",
	"assert",
	"empty",
	"nonempty",
	"global",
	"explicit",
	"lookahead",
	"param",
	"flag",
	"no-eoi",
	"soft",
	"class",
	"interface",
	"void",
	"space",
	"layout",
	"language",
	"lalr",
	"lexer",
	"parser",
	"reduce",
	"{",
	"{",
}

func (tok Token) String() string {
	if tok >= 0 && int(tok) < len(tokenStr) {
		return tokenStr[tok]
	}
	return fmt.Sprintf("token(%d)", tok)
}
