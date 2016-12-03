# Typescript.

language ts(go);

lang = "ts"
package = "github.com/inspirer/textmapper/tm-go/parsers/ts"
eventBased = true

:: lexer

[initial, div, template, templateDiv, jsxTemplate, jsxTemplateDiv, jsxTag, jsxText]

# Accept end-of input in all states.
eoi: /{eoi}/

[initial, div, template, templateDiv, jsxTemplate, jsxTemplateDiv]

WhiteSpace: /[\t\x0b\x0c\x20\xa0\ufeff\p{Zs}]/ (space)

LineTerminatorSequence: /[\n\r\u2028\u2029]|\r\n/ (space)

commentChars = /([^*]|\*+[^*\/])*\**/
MultiLineComment: /\/\*{commentChars}\*\// (space)
SingleLineComment: /\/\/[^\n\r\u2028\u2029]*/ (space)

# Note: see http://unicode.org/reports/tr31/
ID_Start = /\p{Lu}|\p{Ll}|\p{Lt}|\p{Lm}|\p{Lo}|\p{Nl}/
ID_Continue = /{ID_Start}|\p{Mn}|\p{Mc}|\p{Nd}|\p{Pc}/
Join_Control = /\u200c|\u200d/

hex = /[0-9a-fA-F]/
unicodeEscapeSequence = /u(\{{hex}+\}|{hex}{4})/

identifierStart = /{ID_Start}|$|_|\\{unicodeEscapeSequence}/
identifierPart = /{identifierStart}|{ID_Continue}|{Join_Control}/

Identifier: /{identifierStart}{identifierPart}*/    (class)

# Keywords.
'break': /break/
'case': /case/
'catch': /catch/
'class': /class/
'const': /const/
'continue': /continue/
'debugger': /debugger/
'default': /default/
'delete': /delete/
'do': /do/
'else': /else/
'export': /export/
'extends': /extends/
'finally': /finally/
'for': /for/
'function': /function/
'if': /if/
'import': /import/
'in': /in/
'instanceof': /instanceof/
'new': /new/
'return': /return/
'super': /super/
'switch': /switch/
'this': /this/
'throw': /throw/
'try': /try/
'typeof': /typeof/
'var': /var/
'void': /void/
'while': /while/
'with': /with/
'yield': /yield/

# Future-reserved.
'await': /await/
'enum': /enum/

# Literals.
'null': /null/
'true': /true/
'false': /false/

# Soft (contextual) keywords.
'as':		/as/
'from':		/from/
'get':		/get/
'let':		/let/
'of':		/of/
'set':		/set/
'static':	/static/
'target':	/target/

# In strict mode:
#'implements': /implements/
#'interface': /interface/
#'package': /package/
#'private': /private/
#'protected': /protected/
#'public': /public/

#  A.0 Keywords

# The following keywords cannot be used as identifiers in strict mode code, but
# are otherwise not restricted:
'implements':   /implements/
'interface':    /interface/
'private':		/private/
'protected':	/protected/
'public':		/public/

# The following keywords cannot be used as user defined type names, but are
# otherwise not restricted:
'any':			/any/
'boolean':		/boolean/
'number':		/number/
'string':		/string/
'symbol':		/symbol/

# The following keywords have special meaning in certain contexts, but are
# valid identifiers:
'abstract':		/abstract/
'async':		/async/
'constructor':	/constructor/
'declare':		/declare/
'is':			/is/
'module':		/module/
'namespace':	/namespace/
'require':		/require/
'type':			/type/

# Punctuation
'{': /\{/
'}':          /* See below */
'(': /\(/
')': /\)/
'[': /\[/
']': /\]/
'.': /\./
'...': /\.\.\./
';': /;/
',': /,/
'<': /</
'>': />/
'<=': /<=/
'>=': />=/
'==': /==/
'!=': /!=/
'===': /===/
'!==': /!==/
'+': /\+/
'-': /-/
'*': /\*/
'/':          /* See below */
'%': /%/
'++': /\+\+/
'--': /--/
'<<': /<</
'>>': />>/
'>>>': />>>/
'&': /&/
'|': /\|/
'^': /^/
'!': /!/
'~': /~/
'&&': /&&/
'||': /\|\|/
'?': /\?/
':': /:/
'=': /=/
'+=': /\+=/
'-=': /-=/
'*=': /\*=/
'/=':         /* See below */
'%=': /%=/
'<<=': /<<=/
'>>=': />>=/
'>>>=': />>>=/
'&=': /&=/
'|=': /\|=/
'^=': /^=/
'=>': /=>/
'**': /\*\*/
'**=': /\*\*=/

exp = /[eE][+-]?[0-9]+/
NumericLiteral: /(0|[1-9][0-9]*)(\.[0-9]*)?{exp}?/
NumericLiteral: /\.[0-9]+{exp}?/
NumericLiteral: /0[Xx]{hex}+/
NumericLiteral: /0[oO][0-7]+/
NumericLiteral: /0[bB][01]+/

escape = /\\([^1-9xu\n\r\u2028\u2029]|x{hex}{2}|{unicodeEscapeSequence})/
lineCont = /\\([\n\r\u2028\u2029]|\r\n)/
dsChar = /[^\n\r"\\\u2028\u2029]|{escape}|{lineCont}/
ssChar = /[^\n\r'\\\u2028\u2029]|{escape}|{lineCont}/

# TODO check \0 is valid if [lookahead != DecimalDigit]

StringLiteral: /"{dsChar}*"/
StringLiteral: /'{ssChar}*'/

tplChars = /([^\$`\\]|\$*{escape}|\$*{lineCont}|\$+[^\$\{`\\])*\$*/

[initial, div, jsxTemplate, jsxTemplateDiv]

'}': /\}/

NoSubstitutionTemplate: /`{tplChars}`/
TemplateHead: /`{tplChars}\$\{/

[template, templateDiv]

TemplateMiddle: /\}{tplChars}\$\{/
TemplateTail: /\}{tplChars}`/

[initial, template, jsxTemplate]

reBS = /\\[^\n\r\u2028\u2029]/
reClass = /\[([^\n\r\u2028\u2029\]\\]|{reBS})*\]/
reFirst = /[^\n\r\u2028\u2029\*\[\\\/]|{reBS}|{reClass}/
reChar = /{reFirst}|\*/

RegularExpressionLiteral: /\/{reFirst}{reChar}*\/{identifierPart}*/

[div, templateDiv, jsxTemplateDiv]

'/': /\//
'/=': /\/=/

[jsxTag]

'{': /\{/
'}': /\}/
'<': /</
'>': />/
'/': /\//
':': /:/
'.': /\./
'=': /=/

jsxStringLiteral: /'[^']*'/
jsxStringLiteral: /"[^"]*"/

jsxIdentifier: /{identifierStart}({identifierPart}|-)*/

[jsxText]

'}': /\}/
'<': /</

jsxText : /[^{}<>]+/

:: parser

%input TypeInput;

TypeInput ::= Type<~Yield> ;

%flag In;
%flag Yield;
%flag Default;
%flag Return;

%flag WithoutNew = false;

%lookahead flag NoLet = false;
%lookahead flag NoLetSq = false;
%lookahead flag NoObjLiteral = false;
%lookahead flag NoFuncClass = false;
%lookahead flag StartWithLet = false;

IdentifierName<WithoutNew> ::=
	  Identifier

	# Keywords
	| [!WithoutNew] 'new'

	| 'break' 		| 'do' 			| 'in' 			| 'typeof'
	| 'case' 		| 'else' 		| 'instanceof'	| 'var'
	| 'catch'		| 'export'                      | 'void'
	| 'class'		| 'extends'		| 'return'		| 'while'
	| 'const'		| 'finally'		| 'super'		| 'with'
	| 'continue'	| 'for'			| 'switch'		| 'yield'
	| 'debugger'	| 'function'	| 'this'
	| 'default'		| 'if'			| 'throw'
	| 'delete'		| 'import'		| 'try'

	# Future-reserved.
	| 'enum' | 'await'

	# NullLiteral | BooleanLiteral
	| 'null' | 'true' | 'false'

	# Soft keywords
	| 'as' | 'from' | 'get' | 'let' | 'of' | 'set' | 'static' | 'target'
;

# A.2 Expressions

IdentifierReference<Yield> ::=
	  Identifier
	| [!Yield] 'yield'
	| [!NoLet] 'let'

	# Soft keywords
	| 'as' | 'from' | 'get' | 'of' | 'set' | 'static' | 'target'
;

BindingIdentifier<Yield> ::=
	  Identifier
	| [!Yield] 'yield'

	# Soft keywords
	| 'as' | 'from' | 'get' | 'let' | 'of' | 'set' | 'static' | 'target'
;

LabelIdentifier<Yield> ::=
	  Identifier
	| [!Yield] 'yield'

	# Soft keywords
	| 'as' | 'from' | 'get' | 'let' | 'of' | 'set' | 'static' | 'target'
;

@noast
PrimaryExpression<Yield> ::=
	  'this'                                                         {~ThisExpression}
	| IdentifierReference
	| Literal
	| ArrayLiteral
	| [!NoObjLiteral] ObjectLiteral
	| [!NoFuncClass] FunctionExpression
	| [!NoFuncClass] ClassExpression
	| [!NoFuncClass] GeneratorExpression
	| RegularExpressionLiteral                                    {~RegularExpression}
	| TemplateLiteral
	| CoverParenthesizedExpressionAndArrowParameterList     {~ParenthesizedExpression}
	| JSXElement
;

@noast
CoverParenthesizedExpressionAndArrowParameterList<Yield> ::=
	  '(' Expression<+In> ')'
	| '(' ')'
	| '(' '...' BindingIdentifier ')'
	| '(' '...' BindingPattern ')'
	| '(' Expression<+In> ',' '...' BindingIdentifier ')'
	| '(' Expression<+In> ',' '...' BindingPattern ')'
;

Literal ::=
	  'null'
	| 'true'
	| 'false'
	| NumericLiteral
	| StringLiteral
;

ArrayLiteral<Yield> ::=
	  '[' Elisionopt ']'
	| '[' ElementList ']'
	| '[' ElementList ',' Elisionopt ']'
;

@noast
ElementList<Yield> ::=
	  Elisionopt AssignmentExpression<+In>
	| Elisionopt SpreadElement
	| ElementList ',' Elisionopt AssignmentExpression<+In>
	| ElementList ',' Elisionopt SpreadElement
;

@noast
Elision ::=
	  ','
	| Elision ','
;

SpreadElement<Yield> ::=
	  '...' AssignmentExpression<+In>
;

ObjectLiteral<Yield> ::=
	  '{' '}'
	| '{' PropertyDefinitionList '}'
	| '{' PropertyDefinitionList ',' '}'
;

@noast
PropertyDefinitionList<Yield> ::=
	  PropertyDefinition
	| PropertyDefinitionList ',' PropertyDefinition
;

PropertyDefinition<Yield> ::=
	  IdentifierReference
	| CoverInitializedName										{~SyntaxError}
	| PropertyName ':' AssignmentExpression<+In>
	| @noast MethodDefinition
;

@noast
PropertyName<Yield, WithoutNew> ::=
	  LiteralPropertyName
	| ComputedPropertyName
;

LiteralPropertyName<WithoutNew> ::=
	  IdentifierName
	| StringLiteral
	| NumericLiteral
;

ComputedPropertyName<Yield> ::=
	'[' AssignmentExpression<+In> ']'
;

CoverInitializedName<Yield> ::=
	  IdentifierReference Initializer<+In>
;

Initializer<In, Yield> ::=
	  '=' AssignmentExpression
;

TemplateLiteral<Yield> ::=
	  NoSubstitutionTemplate
	| TemplateHead Expression<+In> TemplateSpans
;

@noast
TemplateSpans<Yield> ::=
	  TemplateTail
	| TemplateMiddleList TemplateTail
;

@noast
TemplateMiddleList<Yield> ::=
	  TemplateMiddle Expression<+In>
	| TemplateMiddleList TemplateMiddle Expression<+In>
;

@noast
MemberExpression<Yield, flag NoLetOnly = false> ::=
	  [!NoLetOnly && !StartWithLet] PrimaryExpression
	| [NoLetOnly && !StartWithLet] PrimaryExpression<+NoLet>
	| [StartWithLet && !NoLetOnly] 'let'                                     {~IdentifierReference}
	| [StartWithLet] MemberExpression<+NoLetOnly> '[' Expression<+In> ']'            {~IndexAccess}
	| [!StartWithLet] MemberExpression<NoLetOnly: NoLetSq> '[' Expression<+In> ']'   {~IndexAccess}
	| MemberExpression '.' IdentifierName                                         {~PropertyAccess}
	| MemberExpression TemplateLiteral                                            {~TaggedTemplate}
	| [!StartWithLet] SuperProperty
	| [!StartWithLet] MetaProperty
	| [!StartWithLet] 'new' MemberExpression Arguments                             {~NewExpression}
;

SuperExpression ::=
	  'super'
;

SuperProperty<Yield> ::=
	  SuperExpression '[' Expression<+In> ']'           {~IndexAccess}
	| SuperExpression '.' IdentifierName                {~PropertyAccess}
;

@noast
MetaProperty ::=
	  NewTarget
;

NewTarget ::=
	  'new' '.' 'target'
;

NewExpression<Yield> ::=
	  @noast MemberExpression
	| [!StartWithLet] 'new' NewExpression
;

CallExpression<Yield> ::=
	  MemberExpression Arguments
	| [!StartWithLet] SuperCall
	| CallExpression Arguments
	| CallExpression '[' Expression<+In> ']'      {~IndexAccess}
	| CallExpression '.' IdentifierName           {~PropertyAccess}
	| CallExpression TemplateLiteral              {~TaggedTemplate}
;

@noast
SuperCall<Yield> ::=
	  SuperExpression Arguments
;

Arguments<Yield> ::=
	  '(' ')'
	| '(' ArgumentList ')'
;

@noast
ArgumentList<Yield> ::=
	  AssignmentExpression<+In>
	| '...' AssignmentExpression<+In>
	| ArgumentList ',' AssignmentExpression<+In>
	| ArgumentList ',' '...' AssignmentExpression<+In>
;

@noast
LeftHandSideExpression<Yield> ::=
	  NewExpression
	| CallExpression
;

UpdateExpression<Yield> ::=
	  @noast LeftHandSideExpression
	| LeftHandSideExpression .noLineBreak '++'             {~PostIncrementExpression}
	| LeftHandSideExpression .noLineBreak '--'             {~PostDecrementExpression}
	| [!StartWithLet] '++' UnaryExpression                 {~PreIncrementExpression}
	| [!StartWithLet] '--' UnaryExpression                 {~PreDecrementExpression}
;

UnaryExpression<Yield> ::=
	  @noast UpdateExpression
	| [!StartWithLet] 'delete' UnaryExpression
	| [!StartWithLet] 'void' UnaryExpression
	| [!StartWithLet] 'typeof' UnaryExpression
	| [!StartWithLet] '+' UnaryExpression
	| [!StartWithLet] '-' UnaryExpression
	| [!StartWithLet] '~' UnaryExpression
	| [!StartWithLet] '!' UnaryExpression
	| [!StartWithLet] '<' Type '>' UnaryExpression
;

%left '||';
%left '&&';
%left '|';
%left '^';
%left '&';
%left '==' '!=' '===' '!==';
%left '<' '>' '<=' '>=' 'instanceof' 'in';
%left '<<' '>>' '>>>';
%left '-' '+';
%left '*' '/' '%';
%right '**';

ArithmeticExpression<Yield> ::=
	  @noast UnaryExpression
	| ArithmeticExpression '+' ArithmeticExpression        {~AdditiveExpression}
	| ArithmeticExpression '-' ArithmeticExpression        {~AdditiveExpression}
	| ArithmeticExpression '<<' ArithmeticExpression       {~ShiftExpression}
	| ArithmeticExpression '>>' ArithmeticExpression       {~ShiftExpression}
	| ArithmeticExpression '>>>' ArithmeticExpression      {~ShiftExpression}
	| ArithmeticExpression '*' ArithmeticExpression        {~MultiplicativeExpression}
	| ArithmeticExpression '/' ArithmeticExpression        {~MultiplicativeExpression}
	| ArithmeticExpression '%' ArithmeticExpression        {~MultiplicativeExpression}
	| UpdateExpression '**' ArithmeticExpression           {~ExponentiationExpression}
;

BinaryExpression<In, Yield> ::=
	  @noast ArithmeticExpression
	| BinaryExpression '<' BinaryExpression                {~RelationalExpression}
	| BinaryExpression '>' BinaryExpression                {~RelationalExpression}
	| BinaryExpression '<=' BinaryExpression               {~RelationalExpression}
	| BinaryExpression '>=' BinaryExpression               {~RelationalExpression}
	| BinaryExpression 'instanceof' BinaryExpression       {~RelationalExpression}
	| [In] BinaryExpression 'in' BinaryExpression          {~RelationalExpression}
	| BinaryExpression '==' BinaryExpression               {~EqualityExpression}
	| BinaryExpression '!=' BinaryExpression               {~EqualityExpression}
	| BinaryExpression '===' BinaryExpression              {~EqualityExpression}
	| BinaryExpression '!==' BinaryExpression              {~EqualityExpression}
	| BinaryExpression '&' BinaryExpression                {~BitwiseANDExpression}
	| BinaryExpression '^' BinaryExpression                {~BitwiseXORExpression}
	| BinaryExpression '|' BinaryExpression                {~BitwiseORExpression}
	| BinaryExpression '&&' BinaryExpression               {~LogicalANDExpression}
	| BinaryExpression '||' BinaryExpression               {~LogicalORExpression}
;

ConditionalExpression<In, Yield> ::=
	  @noast BinaryExpression
	| BinaryExpression '?' AssignmentExpression<+In> ':' AssignmentExpression
;

AssignmentExpression<In, Yield> ::=
	  @noast ConditionalExpression
	| [Yield && !StartWithLet] @noast YieldExpression
	| [!StartWithLet] @noast ArrowFunction
	| LeftHandSideExpression '=' AssignmentExpression
	| LeftHandSideExpression AssignmentOperator AssignmentExpression
;

AssignmentOperator ::=
	  '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '>>>=' | '&=' | '^=' | '|=' | '**=' ;

@noast
Expression<In, Yield> ::=
	  AssignmentExpression
	| Expression ',' AssignmentExpression
;

# A.3 Statements

@noast
Statement<Yield, Return> ::=
	  BlockStatement
	| VariableStatement
	| EmptyStatement
	| ExpressionStatement
	| IfStatement
	| BreakableStatement
	| ContinueStatement
	| BreakStatement
	| [Return] ReturnStatement
	| WithStatement
	| LabelledStatement
	| ThrowStatement
	| TryStatement
	| DebuggerStatement
;

@noast
Declaration<Yield> ::=
	  HoistableDeclaration<~Default>
	| ClassDeclaration<~Default>
	| LexicalDeclaration<+In>
	| InterfaceDeclaration
	| TypeAliasDeclaration
	| EnumDeclaration
;

@noast
HoistableDeclaration<Yield, Default> ::=
	  FunctionDeclaration
	| GeneratorDeclaration
;

@noast
BreakableStatement<Yield, Return> ::=
	  IterationStatement
	| SwitchStatement
;

@noast
BlockStatement<Yield, Return> ::=
	  Block
;

Block<Yield, Return> ::=
	  '{' StatementList? '}'
;

@noast
StatementList<Yield, Return> ::=
	  StatementListItem
	| StatementList StatementListItem
;

@noast
StatementListItem<Yield, Return> ::=
	  Statement
	| Declaration
;

LexicalDeclaration<In, Yield> ::=
	  LetOrConst BindingList ';'
;

@noast
LetOrConst ::=
	  'let'
	| 'const'
;

@noast
BindingList<In, Yield> ::=
	  LexicalBinding
	| BindingList ',' LexicalBinding
;

LexicalBinding<In, Yield> ::=
	  BindingIdentifier TypeAnnotationopt Initializeropt
	| BindingPattern TypeAnnotationopt Initializer
;

VariableStatement<Yield> ::=
	  'var' VariableDeclarationList<+In> ';'
;

@noast
VariableDeclarationList<In, Yield> ::=
	  VariableDeclaration
	| VariableDeclarationList ',' VariableDeclaration
;

VariableDeclaration<In, Yield> ::=
	  BindingIdentifier TypeAnnotationopt Initializeropt
	| BindingPattern TypeAnnotationopt Initializer
;

@noast
BindingPattern<Yield> ::=
	  ObjectBindingPattern
	| ArrayBindingPattern
;

ObjectBindingPattern<Yield> ::=
	  '{' '}'
	| '{' BindingPropertyList '}'
	| '{' BindingPropertyList ',' '}'
;

ArrayBindingPattern<Yield> ::=
	  '[' Elisionopt BindingRestElementopt ']'
	| '[' BindingElementList ']'
	| '[' BindingElementList ',' Elisionopt BindingRestElementopt ']'
;

@noast
BindingPropertyList<Yield> ::=
	  BindingProperty
	| BindingPropertyList ',' BindingProperty
;

@noast
BindingElementList<Yield> ::=
	  BindingElisionElement
	| BindingElementList ',' BindingElisionElement
;

BindingElisionElement<Yield> ::=
	  Elisionopt BindingElement
;

BindingProperty<Yield> ::=
	  SingleNameBinding
	| PropertyName ':' BindingElement
;

BindingElement<Yield> ::=
	  SingleNameBinding
	| BindingPattern Initializeropt<+In>
;

SingleNameBinding<Yield> ::=
	  BindingIdentifier Initializeropt<+In>
;

BindingRestElement<Yield> ::=
	  '...' BindingIdentifier
;

EmptyStatement ::=
	  ';' .emptyStatement ;

ExpressionStatement<Yield> ::=
	Expression<+In, +NoFuncClass, +NoObjLiteral, +NoLetSq> ';' ;

%right 'else';

IfStatement<Yield, Return> ::=
	  'if' '(' Expression<+In> ')' Statement 'else' Statement
	| 'if' '(' Expression<+In> ')' Statement %prec 'else'
;

IterationStatement<Yield, Return> ::=
	  'do' Statement 'while' '(' Expression<+In> ')' ';' .doWhile                                {~DoWhileStatement}
	| 'while' '(' Expression<+In> ')' Statement                                                  {~WhileStatement}
	| 'for' '(' Expressionopt<~In,+NoLet> ';' .forSC Expressionopt<+In> ';' .forSC Expressionopt<+In> ')' Statement           {~ForStatement}
	| 'for' '(' Expression<~In,+StartWithLet> ';' .forSC Expressionopt<+In> ';' .forSC Expressionopt<+In> ')' Statement       {~ForStatement}
	| 'for' '(' 'var' VariableDeclarationList<~In> ';' .forSC Expressionopt<+In> ';' .forSC Expressionopt<+In> ')' Statement  {~ForStatement}
	| 'for' '(' LetOrConst BindingList<~In> ';' .forSC Expressionopt<+In> ';' .forSC Expressionopt<+In> ')' Statement                {~ForStatement}
	| 'for' '(' LeftHandSideExpression<+NoLet> 'in' Expression<+In> ')' Statement                {~ForInStatement}
	| 'for' '(' LeftHandSideExpression<+StartWithLet> 'in' Expression<+In> ')' Statement         {~ForInStatement}
	| 'for' '(' 'var' ForBinding 'in' Expression<+In> ')' Statement                              {~ForInStatement}
	| 'for' '(' ForDeclaration 'in' Expression<+In> ')' Statement                                {~ForInStatement}
	| 'for' '(' LeftHandSideExpression<+NoLet> 'of' AssignmentExpression<+In> ')' Statement      {~ForOfStatement}
	| 'for' '(' 'var' ForBinding 'of' AssignmentExpression<+In> ')' Statement                    {~ForOfStatement}
	| 'for' '(' ForDeclaration 'of' AssignmentExpression<+In> ')' Statement                      {~ForOfStatement}
;

@noast
ForDeclaration<Yield> ::=
	  LetOrConst ForBinding
;

ForBinding<Yield> ::=
	  BindingIdentifier
	| BindingPattern
;

ContinueStatement<Yield> ::=
	  'continue' ';'
	| 'continue' .noLineBreak LabelIdentifier ';'
;

BreakStatement<Yield> ::=
	  'break' ';'
	| 'break' .noLineBreak LabelIdentifier ';'
;

ReturnStatement<Yield> ::=
	  'return' ';'
	| 'return' .noLineBreak Expression<+In> ';'
;

WithStatement<Yield, Return> ::=
	  'with' '(' Expression<+In> ')' Statement
;

SwitchStatement<Yield, Return> ::=
	  'switch' '(' Expression<+In> ')' CaseBlock
;

CaseBlock<Yield, Return> ::=
	  '{' CaseClausesopt '}'
	| '{' CaseClausesopt DefaultClause CaseClausesopt '}'
;

@noast
CaseClauses<Yield, Return> ::=
	  CaseClause
	| CaseClauses CaseClause
;

CaseClause<Yield, Return> ::=
	  'case' Expression<+In> ':' StatementList?
;

DefaultClause<Yield, Return> ::=
	  'default' ':' StatementList?
;

LabelledStatement<Yield, Return> ::=
	  Identifier ':' LabelledItem
	| [!Yield] 'yield' ':' LabelledItem
;

@noast
LabelledItem<Yield, Return> ::=
	  Statement
	| FunctionDeclaration<~Default>
;

ThrowStatement<Yield> ::=
	  'throw' .noLineBreak Expression<+In> ';'
;

TryStatement<Yield, Return> ::=
	  'try' Block Catch
	| 'try' Block Catch? Finally
;

Catch<Yield, Return> ::=
	  'catch' '(' CatchParameter ')' Block
;

Finally<Yield, Return> ::=
	  'finally' Block
;

CatchParameter<Yield> ::=
	  BindingIdentifier
	| BindingPattern
;

DebuggerStatement ::=
	  'debugger' ';'
;

# A.4 Functions and Classes

FunctionDeclaration<Yield, Default> ::=
	  'function' BindingIdentifier CallSignature<~Yield> ('{' FunctionBody<~Yield> '}' | ';')
# TODO ~Yield?
	| [Default] 'function' CallSignature<~Yield> ('{' FunctionBody '}' | ';')
;

FunctionExpression ::=
	  'function' BindingIdentifier<~Yield>? CallSignature<~Yield> '{' FunctionBody<~Yield> '}' ;

@noast
StrictFormalParameters<Yield> ::=
	  FormalParameters ;

@ast
FormalParameters<Yield> ::=
      FormalParameterList? ;

@noast
FormalParameterList<Yield> ::=
	  FunctionRestParameter
	| FormalsList
	| FormalsList ',' FunctionRestParameter
;

@noast
FormalsList<Yield> ::=
	  FormalParameter
	| FormalsList ',' FormalParameter
;

FunctionRestParameter<Yield> ::=
	  BindingRestElement ;

FormalParameter<Yield> ::=
	  BindingElement ;

FunctionBody<Yield> ::=
	  StatementList<+Return>? ;

ArrowFunction<In, Yield> ::=
	  ArrowParameters .noLineBreak '=>' ConciseBody ;

ArrowParameters<Yield> ::=
	  BindingIdentifier
	| CoverParenthesizedExpressionAndArrowParameterList
;

ConciseBody<In> ::=
	  AssignmentExpression<~Yield, +NoObjLiteral>
	| '{' FunctionBody<~Yield> '}'
;

MethodDefinition<Yield> ::=
	  PropertyName CallSignature '{' FunctionBody '}'
	| @noast GeneratorMethod
	| 'get' PropertyName '(' ')' TypeAnnotationopt '{' FunctionBody '}'
	| 'set' PropertyName '(' PropertySetParameterList ')' '{' FunctionBody '}'
;

@noast
PropertySetParameterList ::=
	  FormalParameter<~Yield> TypeAnnotationopt<~Yield> ;

# TODO use CallSignature?
GeneratorMethod<Yield> ::=
	  '*' PropertyName '(' StrictFormalParameters<+Yield> ')' '{' GeneratorBody '}' ;

# TODO use CallSignature?
GeneratorDeclaration<Yield, Default> ::=
	  'function' '*' BindingIdentifier '(' FormalParameters<+Yield> ')' '{' GeneratorBody '}'
	| [Default] 'function' '*' '(' FormalParameters<+Yield> ')' '{' GeneratorBody '}'
;

GeneratorExpression ::=
	  'function' '*' BindingIdentifier<+Yield>? '(' FormalParameters<+Yield> ')' '{' GeneratorBody '}' ;

@noast
GeneratorBody ::=
	  FunctionBody<+Yield> ;

YieldExpression<In> ::=
	  'yield'
	| 'yield' .afterYield .noLineBreak AssignmentExpression<+Yield>
	| 'yield' .afterYield .noLineBreak '*' AssignmentExpression<+Yield>
;

ClassDeclaration<Yield, Default> ::=
	  'class' BindingIdentifier TypeParametersopt ClassTail
	| [Default] 'class' TypeParametersopt ClassTail
;

ClassExpression<Yield> ::=
	  'class' BindingIdentifier? ClassTail ;

@noast
ClassTail<Yield> ::=
	  ClassExtendsClause? ImplementsClause? ClassBody ;

ClassExtendsClause<Yield> ::=
	  'extends' TypeReference ;

ImplementsClause<Yield> ::=
	'implements' (TypeReference separator ',')+ ;


ClassBody<Yield> ::=
	  '{' ClassElementList? '}' ;

@noast
ClassElementList<Yield> ::=
	  ClassElement
	| ClassElementList ClassElement
;

ClassElement<Yield> ::=
	  AccessibilityModifier? 'constructor' '(' ParameterListopt ')' '{' FunctionBody '}'
	| AccessibilityModifier? 'constructor' '(' ParameterListopt ')' ';'
	| AccessibilityModifier? 'static'? PropertyName TypeAnnotationopt Initializeropt<+In> ';'
	| AccessibilityModifier? 'static'? MethodDefinition
	| IndexSignature ';'
	| ';'
	# TODO /*abstract?*/ | AccessibilityModifier? 'static'opt PropertyName CallSignature ';'
;

# A.5 Scripts and Modules

Module ::=
	  ModuleBodyopt ;

@noast
ModuleBody ::=
	  ModuleItemList ;

@noast
ModuleItemList ::=
	  ModuleItem
	| ModuleItemList ModuleItem
;

ModuleItem ::=
	  ImportDeclaration
	| ExportDeclaration
	| StatementListItem<~Yield,~Return>
;

ImportDeclaration ::=
	  'import' ImportClause FromClause ';'
	| 'import' ModuleSpecifier ';'
;

@noast
ImportClause ::=
	  ImportedDefaultBinding
	| NameSpaceImport
	| NamedImports
	| ImportedDefaultBinding ',' NameSpaceImport
	| ImportedDefaultBinding ',' NamedImports
;

@noast
ImportedDefaultBinding ::=
	  ImportedBinding ;

NameSpaceImport ::=
	  '*' 'as' ImportedBinding ;

NamedImports ::=
	  '{' '}'
	| '{' ImportsList '}'
	| '{' ImportsList ',' '}'
;

@noast
FromClause ::=
	  'from' ModuleSpecifier ;

@noast
ImportsList ::=
	  ImportSpecifier
	| ImportsList ',' ImportSpecifier
;

ImportSpecifier ::=
	  ImportedBinding
	| IdentifierName 'as' ImportedBinding
;

ModuleSpecifier ::=
	  StringLiteral ;

@noast
ImportedBinding ::=
	  BindingIdentifier<~Yield> ;

ExportDeclaration ::=
	  'export' '*' FromClause ';'
	| 'export' ExportClause FromClause ';'
	| 'export' ExportClause ';'
	| 'export' VariableStatement<~Yield>
	| 'export' Declaration<~Yield>
	| 'export' 'default' HoistableDeclaration<+Default,~Yield>              {~ExportDefault}
	| 'export' 'default' ClassDeclaration<+Default,~Yield>                  {~ExportDefault}
	| 'export' 'default' AssignmentExpression<+In,~Yield,+NoFuncClass> ';'  {~ExportDefault}
;

ExportClause ::=
	  '{' '}'
	| '{' ExportsList '}'
	| '{' ExportsList ',' '}'
;

@noast
ExportsList ::=
	  ExportSpecifier
	| ExportsList ',' ExportSpecifier
;

ExportSpecifier ::=
	  IdentifierName
	| IdentifierName 'as' IdentifierName
;

# Extensions

# JSX (see https://facebook.github.io/jsx/)

JSXElement<Yield> ::=
	  JSXSelfClosingElement
	| JSXOpeningElement JSXChild* JSXClosingElement
;

JSXSelfClosingElement<Yield> ::=
	  '<' JSXElementName JSXAttribute* '/' '>' ;

JSXOpeningElement<Yield> ::=
	  '<' JSXElementName JSXAttribute* '>' ;

JSXClosingElement ::=
	  '<' '/' JSXElementName '>' ;

JSXElementName ::=
	  jsxIdentifier
	| jsxIdentifier ':' jsxIdentifier
	| JSXMemberExpression
;

@noast
JSXMemberExpression ::=
	  jsxIdentifier '.' jsxIdentifier
	| JSXMemberExpression '.' jsxIdentifier
;

JSXAttribute<Yield> ::=
	  JSXAttributeName '=' JSXAttributeValue
	| '{' '...' AssignmentExpression<+In> '}'             {~JSXSpreadAttribute}
;

JSXAttributeName ::=
	  jsxIdentifier
	| jsxIdentifier ':' jsxIdentifier
;

JSXAttributeValue<Yield> ::=
	  jsxStringLiteral
	| '{' AssignmentExpression<+In> '}'
	| JSXElement
;

JSXChild<Yield> ::=
	  jsxText                                                   {~JSXText}
	| JSXElement
	| '{' AssignmentExpressionopt<+In> '}'
;

# Typescript

# A.1 Types

Type<Yield> ::=
	  UnionOrIntersectionOrPrimaryType
    | FunctionType
	| ConstructorType
;

TypeParameters<Yield> ::=
	  '<' (TypeParameter separator ',')+ '>' ;

TypeParameter<Yield> ::=
	  BindingIdentifier Constraintopt ;

Constraint<Yield> ::=
	  'extends' Type ;

TypeArguments<Yield> ::=
	  '<' (Type separator ',')+ '>' ;

UnionOrIntersectionOrPrimaryType<Yield> ::=
	  UnionOrIntersectionOrPrimaryType '|' IntersectionOrPrimaryType
	| IntersectionOrPrimaryType
;

IntersectionOrPrimaryType<Yield> ::=
	  IntersectionOrPrimaryType '&' PrimaryType
	| PrimaryType
;

PrimaryType<Yield> ::=
	  ParenthesizedType
	| PredefinedType
	| TypeReference
    | ObjectType
	| ArrayType
	| TupleType
	| TypeQuery
	| 'this'                           {~ThisType}
;

ParenthesizedType<Yield> ::=
	  '(' (?= !StartOfFunctionType) Type ')' ;

PredefinedType ::=
	  'any'
	| 'number'
	| 'boolean'
	| 'string'
	| 'symbol'
	| 'void'
;

TypeReference<Yield> ::=
	  TypeName .noLineBreak TypeArgumentsopt ;

TypeName<Yield> ::=
	  IdentifierReference
	| NamespaceName '.' IdentifierReference
;

NamespaceName<Yield> ::=
	  IdentifierReference
	| NamespaceName '.' IdentifierReference
;

ObjectType<Yield> ::=
	  '{' TypeBodyopt '}' ;

TypeBody<Yield> ::=
	  TypeMemberList
	| TypeMemberList ','
	| TypeMemberList ';'
;

TypeMemberList<Yield> ::=
	  TypeMember
	| TypeMemberList ';' TypeMember
	| TypeMemberList ',' TypeMember
;

TypeMember<Yield> ::=
	  PropertySignature
	| CallSignature
	| ConstructSignature
	| IndexSignature
	| MethodSignature
;

ArrayType<Yield> ::=
	  PrimaryType .noLineBreak '[' ']' ;

TupleType<Yield> ::=
	  '[' (Type separator ',')+ ']' ;

# This lookahead rule disambiguates FunctionType vs ParenthesizedType
# productions by enumerating all prefixes of FunctionType that would
# lead to parse failure if interpreted as Type.
# (partially inspired by isUnambiguouslyStartOfFunctionType() in
# src/compiler/parser.ts)
StartOfFunctionType ::=
	  AccessibilityModifier? BindingIdentifier<~Yield> (':' | ',' | '?' | '=' | ')' '=>')
	| AccessibilityModifier? BindingPattern<~Yield> (':' | ',' | '?' | '=' | ')' '=>')
	| '...'
	| ')'
;

FunctionType<Yield> ::=
      TypeParameters '(' ParameterListopt ')' '=>' Type
	| '(' (?= StartOfFunctionType) ParameterListopt ')' '=>' Type
;

ConstructorType<Yield> ::=
	  'new' TypeParameters? '(' ParameterListopt ')' '=>' Type ;

TypeQuery<Yield> ::=
	  'typeof' TypeQueryExpression ;

TypeQueryExpression<Yield> ::=
	  IdentifierReference
	| TypeQueryExpression '.' IdentifierName
;

PropertySignature<Yield> ::=
	  PropertyName<+WithoutNew> '?'? TypeAnnotationopt ;

TypeAnnotation<Yield> ::=
	  ':' Type ;

CallSignature<Yield> ::=
	  TypeParameters? '(' ParameterListopt ')' TypeAnnotationopt ;

ParameterList<Yield> ::=
	  FunctionTypeParameter
	| ParameterList ',' FunctionTypeParameter
;

FunctionTypeParameter<Yield> ::=
	  AccessibilityModifier? BindingIdentifier '?'? TypeAnnotationopt
	| AccessibilityModifier? BindingPattern '?'? TypeAnnotationopt
	| AccessibilityModifier? BindingIdentifier TypeAnnotationopt Initializer<+In>  {~DefaultParameter}
	| AccessibilityModifier? BindingPattern TypeAnnotationopt Initializer<+In>     {~DefaultParameter}
	| BindingIdentifier '?'? ':' StringLiteral
	| '...' BindingIdentifier TypeAnnotationopt					{~RestParameter}
;

AccessibilityModifier ::=
	  'public'
	| 'private'
	| 'protected'
;

BindingIdentifierOrPattern<Yield> ::=
	  BindingIdentifier
	| BindingPattern
;

ConstructSignature<Yield> ::=
	  'new' TypeParameters? '(' ParameterListopt ')' TypeAnnotationopt ;

# Note: using IdentifierName instead of BindingIdentifier to avoid r/r
# conflicts with ComputedPropertyName.
IndexSignature<Yield> ::=
	  '[' IdentifierName ':' 'string' ']' TypeAnnotation
	| '[' IdentifierName ':' 'number' ']' TypeAnnotation
;

MethodSignature<Yield> ::=
	  PropertyName<+WithoutNew> '?'? CallSignature ;

TypeAliasDeclaration<Yield> ::=
	  'type' BindingIdentifier TypeParameters? '=' Type ';' ;

# A.2 Expressions (TODO)

# ArrowFormalParameters ::= /* Modified */
#    CallSignature ;

# Arguments ::= /* Modified */
#    TypeArgumentsopt '(' ArgumentListopt ')' ;

# A.5 Interfaces

InterfaceDeclaration<Yield> ::=
	  'interface' BindingIdentifier TypeParametersopt InterfaceExtendsClauseopt ObjectType ;

InterfaceExtendsClause<Yield> ::=
	  'extends' (TypeReference separator ',')+ ;

# A.7 Enums

EnumDeclaration<Yield> ::=
	  'const'? 'enum' BindingIdentifier '{' EnumBodyopt '}' ;

EnumBody<Yield> ::=
	  EnumMemberList ','? ;

EnumMemberList<Yield> ::=
	  EnumMember
	| EnumMemberList ',' EnumMember
;

EnumMember<Yield> ::=
	  PropertyName
	| PropertyName '=' EnumValue
;

EnumValue<Yield> ::=
	  AssignmentExpression<+In> ;

# A.8+ TODO

%%

${template go_lexer.onBeforeNext-}
	prevLine := l.tokenLine
${end}

${template go_lexer.onAfterNext}
	// There is an ambiguity in the language that a slash can either represent
	// a division operator, or start a regular expression literal. This gets
	// disambiguated at the grammar level - division always follows an
	// expression, while regex literals are expressions themselves. Here we use
	// some knowledge about the grammar to decide whether the next token can be
	// a regular expression literal.
	//
	// See the following thread for more details:
	// http://stackoverflow.com/questions/5519596/when-parsing-javascript-what

	inTemplate := l.State >= State_template
	var reContext bool
	switch token {
	case NEW, DELETE, VOID, TYPEOF, INSTANCEOF, IN, DO, RETURN, CASE, THROW, ELSE:
		reContext = true
	case TEMPLATEHEAD, TEMPLATEMIDDLE:
		reContext = true
		inTemplate = true
	case TEMPLATETAIL:
		reContext = false
		inTemplate = false
	case RPAREN, RBRACK:
		// TODO support if (...) /aaaa/;
		reContext = false
	case PLUSPLUS, MINUSMINUS:
		if prevLine != l.tokenLine {
			// This is a pre-increment/decrement, so we expect a regular expression.
			reContext = true
		} else {
			// If we were in reContext before this token, this is a
			// pre-increment/decrement, otherwise, this is a post. We can just
			// propagate the previous value of reContext.
			reContext = (l.State == State_template || l.State == State_initial)
		}
	default:
		reContext = (token >= punctuationStart && token < punctuationEnd)
	}
	if inTemplate {
		if reContext {
			l.State = State_template
		} else {
			l.State = State_templateDiv
		}
	} else if reContext {
		l.State = State_initial
	} else {
		l.State = State_div
	}
${end}

${query go_parser.additionalNodeTypes() = ['InsertedSemicolon']}

${template go_parser.parser-}
package ${self->go.shortPackage()}
${foreach inp in syntax.input}
func (p *Parser) Parse${self->util.needFinalState() ? util.toFirstUpper(inp.target.id) : ''}(lexer *Lexer) bool {
	return p.parse(${index}, ${parser.finalStates[index]}, lexer)
}
${end-}

${call go_parser.applyRule-}
${end}
