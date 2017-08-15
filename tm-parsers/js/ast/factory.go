// generated by Textmapper; DO NOT EDIT

package ast

import (
	"github.com/inspirer/textmapper/tm-parsers/js"
	"log"
)

func ToJsNode(n Node) JsNode {
	if n == nil {
		return nil
	}
	switch n.Type() {
	case js.AccessibilityModifier:
		return &AccessibilityModifier{n}
	case js.AdditiveExpression:
		return &AdditiveExpression{n}
	case js.Arguments:
		return &Arguments{n}
	case js.ArrayLiteral:
		return &ArrayLiteral{n}
	case js.ArrayPattern:
		return &ArrayPattern{n}
	case js.ArrayType:
		return &ArrayType{n}
	case js.ArrowFunction:
		return &ArrowFunction{n}
	case js.AssignmentExpression:
		return &AssignmentExpression{n}
	case js.AssignmentOperator:
		return &AssignmentOperator{n}
	case js.AsyncArrowFunction:
		return &AsyncArrowFunction{n}
	case js.AsyncFunction:
		return &AsyncFunction{n}
	case js.AsyncFunctionExpression:
		return &AsyncFunctionExpression{n}
	case js.AsyncMethod:
		return &AsyncMethod{n}
	case js.AwaitExpression:
		return &AwaitExpression{n}
	case js.BindingIdentifier:
		return &BindingIdentifier{n}
	case js.BindingRestElement:
		return &BindingRestElement{n}
	case js.BitwiseANDExpression:
		return &BitwiseANDExpression{n}
	case js.BitwiseORExpression:
		return &BitwiseORExpression{n}
	case js.BitwiseXORExpression:
		return &BitwiseXORExpression{n}
	case js.Block:
		return &Block{n}
	case js.Body:
		return &Body{n}
	case js.BreakStatement:
		return &BreakStatement{n}
	case js.CallExpression:
		return &CallExpression{n}
	case js.CallSignature:
		return &CallSignature{n}
	case js.Case:
		return &Case{n}
	case js.Catch:
		return &Catch{n}
	case js.Class:
		return &Class{n}
	case js.ClassBody:
		return &ClassBody{n}
	case js.ClassExpr:
		return &ClassExpr{n}
	case js.CommaExpression:
		return &CommaExpression{n}
	case js.ComputedPropertyName:
		return &ComputedPropertyName{n}
	case js.ConciseBody:
		return &ConciseBody{n}
	case js.ConditionalExpression:
		return &ConditionalExpression{n}
	case js.ConstructSignature:
		return &ConstructSignature{n}
	case js.ConstructorType:
		return &ConstructorType{n}
	case js.ContinueStatement:
		return &ContinueStatement{n}
	case js.DebuggerStatement:
		return &DebuggerStatement{n}
	case js.Default:
		return &Default{n}
	case js.DefaultParameter:
		return &DefaultParameter{n}
	case js.DoWhileStatement:
		return &DoWhileStatement{n}
	case js.ElementBinding:
		return &ElementBinding{n}
	case js.EmptyDecl:
		return &EmptyDecl{n}
	case js.EmptyStatement:
		return &EmptyStatement{n}
	case js.EqualityExpression:
		return &EqualityExpression{n}
	case js.ExponentiationExpression:
		return &ExponentiationExpression{n}
	case js.ExportClause:
		return &ExportClause{n}
	case js.ExportDeclaration:
		return &ExportDeclaration{n}
	case js.ExportDefault:
		return &ExportDefault{n}
	case js.ExportSpecifier:
		return &ExportSpecifier{n}
	case js.ExpressionStatement:
		return &ExpressionStatement{n}
	case js.Extends:
		return &Extends{n}
	case js.Finally:
		return &Finally{n}
	case js.ForBinding:
		return &ForBinding{n}
	case js.ForCondition:
		return &ForCondition{n}
	case js.ForFinalExpression:
		return &ForFinalExpression{n}
	case js.ForInStatement:
		return &ForInStatement{n}
	case js.ForInStatementWithVar:
		return &ForInStatementWithVar{n}
	case js.ForOfStatement:
		return &ForOfStatement{n}
	case js.ForOfStatementWithVar:
		return &ForOfStatementWithVar{n}
	case js.ForStatement:
		return &ForStatement{n}
	case js.ForStatementWithVar:
		return &ForStatementWithVar{n}
	case js.Function:
		return &Function{n}
	case js.FunctionExpression:
		return &FunctionExpression{n}
	case js.FunctionType:
		return &FunctionType{n}
	case js.Generator:
		return &Generator{n}
	case js.GeneratorExpression:
		return &GeneratorExpression{n}
	case js.GeneratorMethod:
		return &GeneratorMethod{n}
	case js.Getter:
		return &Getter{n}
	case js.IdentifierReference:
		return &IdentifierReference{n}
	case js.IfStatement:
		return &IfStatement{n}
	case js.ImportDeclaration:
		return &ImportDeclaration{n}
	case js.ImportSpecifier:
		return &ImportSpecifier{n}
	case js.IndexAccess:
		return &IndexAccess{n}
	case js.IndexSignature:
		return &IndexSignature{n}
	case js.IndexedAccessType:
		return &IndexedAccessType{n}
	case js.Initializer:
		return &Initializer{n}
	case js.IntersectionType:
		return &IntersectionType{n}
	case js.JSXAttributeName:
		return &JSXAttributeName{n}
	case js.JSXClosingElement:
		return &JSXClosingElement{n}
	case js.JSXElement:
		return &JSXElement{n}
	case js.JSXElementName:
		return &JSXElementName{n}
	case js.JSXExpression:
		return &JSXExpression{n}
	case js.JSXLiteral:
		return &JSXLiteral{n}
	case js.JSXNormalAttribute:
		return &JSXNormalAttribute{n}
	case js.JSXOpeningElement:
		return &JSXOpeningElement{n}
	case js.JSXSelfClosingElement:
		return &JSXSelfClosingElement{n}
	case js.JSXSpreadAttribute:
		return &JSXSpreadAttribute{n}
	case js.JSXSpreadExpression:
		return &JSXSpreadExpression{n}
	case js.JSXText:
		return &JSXText{n}
	case js.KeyOfType:
		return &KeyOfType{n}
	case js.LabelIdentifier:
		return &LabelIdentifier{n}
	case js.LabelledStatement:
		return &LabelledStatement{n}
	case js.LexicalBinding:
		return &LexicalBinding{n}
	case js.LexicalDeclaration:
		return &LexicalDeclaration{n}
	case js.Literal:
		return &Literal{n}
	case js.LiteralPropertyName:
		return &LiteralPropertyName{n}
	case js.LiteralType:
		return &LiteralType{n}
	case js.LogicalANDExpression:
		return &LogicalANDExpression{n}
	case js.LogicalORExpression:
		return &LogicalORExpression{n}
	case js.MappedType:
		return &MappedType{n}
	case js.Method:
		return &Method{n}
	case js.MethodSignature:
		return &MethodSignature{n}
	case js.Module:
		return &Module{n}
	case js.ModuleSpecifier:
		return &ModuleSpecifier{n}
	case js.MultiplicativeExpression:
		return &MultiplicativeExpression{n}
	case js.NameSpaceImport:
		return &NameSpaceImport{n}
	case js.NamedImports:
		return &NamedImports{n}
	case js.NewExpression:
		return &NewExpression{n}
	case js.NewTarget:
		return &NewTarget{n}
	case js.ObjectLiteral:
		return &ObjectLiteral{n}
	case js.ObjectPattern:
		return &ObjectPattern{n}
	case js.ObjectType:
		return &ObjectType{n}
	case js.Parameters:
		return &Parameters{n}
	case js.Parenthesized:
		return &Parenthesized{n}
	case js.ParenthesizedType:
		return &ParenthesizedType{n}
	case js.PostDec:
		return &PostDec{n}
	case js.PostInc:
		return &PostInc{n}
	case js.PreDec:
		return &PreDec{n}
	case js.PreInc:
		return &PreInc{n}
	case js.PredefinedType:
		return &PredefinedType{n}
	case js.Property:
		return &Property{n}
	case js.PropertyAccess:
		return &PropertyAccess{n}
	case js.PropertyBinding:
		return &PropertyBinding{n}
	case js.PropertySignature:
		return &PropertySignature{n}
	case js.Regexp:
		return &Regexp{n}
	case js.RelationalExpression:
		return &RelationalExpression{n}
	case js.RestParameter:
		return &RestParameter{n}
	case js.ReturnStatement:
		return &ReturnStatement{n}
	case js.Setter:
		return &Setter{n}
	case js.ShiftExpression:
		return &ShiftExpression{n}
	case js.ShorthandProperty:
		return &ShorthandProperty{n}
	case js.SingleNameBinding:
		return &SingleNameBinding{n}
	case js.SpreadElement:
		return &SpreadElement{n}
	case js.StaticMethod:
		return &StaticMethod{n}
	case js.SuperExpression:
		return &SuperExpression{n}
	case js.SwitchStatement:
		return &SwitchStatement{n}
	case js.SyntaxProblem:
		return &SyntaxProblem{n}
	case js.TaggedTemplate:
		return &TaggedTemplate{n}
	case js.TemplateLiteral:
		return &TemplateLiteral{n}
	case js.This:
		return &This{n}
	case js.ThisType:
		return &ThisType{n}
	case js.ThrowStatement:
		return &ThrowStatement{n}
	case js.TryStatement:
		return &TryStatement{n}
	case js.TupleType:
		return &TupleType{n}
	case js.TypeAliasDeclaration:
		return &TypeAliasDeclaration{n}
	case js.TypeAnnotation:
		return &TypeAnnotation{n}
	case js.TypeArguments:
		return &TypeArguments{n}
	case js.TypeConstraint:
		return &TypeConstraint{n}
	case js.TypeName:
		return &TypeName{n}
	case js.TypeParameter:
		return &TypeParameter{n}
	case js.TypeParameters:
		return &TypeParameters{n}
	case js.TypeQuery:
		return &TypeQuery{n}
	case js.TypeReference:
		return &TypeReference{n}
	case js.UnaryExpression:
		return &UnaryExpression{n}
	case js.UnionType:
		return &UnionType{n}
	case js.VariableDeclaration:
		return &VariableDeclaration{n}
	case js.VariableStatement:
		return &VariableStatement{n}
	case js.WhileStatement:
		return &WhileStatement{n}
	case js.WithStatement:
		return &WithStatement{n}
	case js.Yield:
		return &Yield{n}
	case js.MultiLineComment, js.SingleLineComment, js.InvalidToken, js.NoSubstitutionTemplate, js.TemplateHead, js.TemplateMiddle, js.TemplateTail:
		return &Token{n}
	}
	log.Fatalf("unknown node type %v\n", n.Type())
	return nil
}
