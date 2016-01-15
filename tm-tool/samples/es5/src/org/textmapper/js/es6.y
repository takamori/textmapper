%{
#include <stdio.h>
%}

%start IdentifierName

%token WhiteSpace
%token LineTerminatorSequence
%token MultiLineComment
%token SingleLineComment
%token Identifier
%token break
%token case
%token catch
%token class
%token const
%token continue
%token debugger
%token default
%token delete
%token do
%token else
%token export
%token extends
%token finally
%token for
%token function
%token if
%token import
%token in
%token instanceof
%token new
%token return
%token super
%token switch
%token this
%token throw
%token try
%token typeof
%token var
%token void
%token while
%token with
%token yield
%token await
%token enum
%token null
%token true
%token false
%token target
%token of
%token let
%token static
%token as
%token from
%token get
%token set
%token Lcurly
%token Lparen
%token Rparen
%token Lsquare
%token Rsquare
%token Dot
%token Semicolon
%token Comma
%token Less
%token Greater
%token LessEqual
%token GreaterEqual
%token EqualEqual
%token ExclamationEqual
%token EqualEqualEqual
%token ExclamationEqualEqual
%token Plus
%token Minus
%token Mult
%token Percent
%token PlusPlus
%token MinusMinus
%token LessLess
%token GreaterGreater
%token GreaterGreaterGreater
%token Ampersand
%token Or
%token Xor
%token Exclamation
%token Tilde
%token AmpersandAmpersand
%token OrOr
%token Questionmark
%token Colon
%token Equal
%token PlusEqual
%token MinusEqual
%token MultEqual
%token PercentEqual
%token LessLessEqual
%token GreaterGreaterEqual
%token GreaterGreaterGreaterEqual
%token AmpersandEqual
%token OrEqual
%token XorEqual
%token EqualGreater
%token NumericLiteral
%token StringLiteral
%token Rcurly
%token NoSubstitutionTemplate
%token TemplateHead
%token TemplateMiddle
%token TemplateTail
%token RegularExpressionLiteral
%token Slash
%token SlashEqual

%locations
%%

IdentifierName :
  Identifier
| break
| do
| in
| typeof
| case
| else
| instanceof
| var
| catch
| export
| new
| void
| class
| extends
| return
| while
| const
| finally
| super
| with
| continue
| for
| switch
| yield
| debugger
| function
| this
| default
| if
| throw
| delete
| import
| try
| enum
| await
| null
| true
| false
;

%%

