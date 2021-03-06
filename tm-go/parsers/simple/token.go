// generated by Textmapper; DO NOT EDIT

package simple

import (
	"fmt"
)

// Token is an enum of all terminal symbols of the simple language.
type Token int

// Token values.
const (
	UNAVAILABLE Token = iota - 1
	EOI

	INVALID_TOKEN
	SIMPLE // simple

	NumTokens
)

var tokenStr = [...]string{
	"EOI",

	"INVALID_TOKEN",
	"simple",
}

func (tok Token) String() string {
	if tok >= 0 && int(tok) < len(tokenStr) {
		return tokenStr[tok]
	}
	return fmt.Sprintf("token(%d)", tok)
}
