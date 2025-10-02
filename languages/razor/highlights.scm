; Razor directives
(razor_directive) @keyword
(razor_block_start) @punctuation.special
(razor_block_end) @punctuation.special

; Razor @ symbols
"@" @operator

; Razor code blocks
(razor_code_block
  content: (_) @embedded) @embedded

; Razor expressions
(razor_expression
  content: (_) @embedded) @embedded

; Razor implicit expressions
(razor_implicit_expression
  content: (_) @embedded) @embedded

; C# code within Razor
(csharp_code) @embedded

; HTML elements
(element
  (start_tag
    "<" @punctuation.bracket
    (tag_name) @tag
    ">" @punctuation.bracket))

(element
  (end_tag
    "</" @punctuation.bracket
    (tag_name) @tag
    ">" @punctuation.bracket))

(self_closing_tag
  "<" @punctuation.bracket
  (tag_name) @tag
  "/>" @punctuation.bracket)

; HTML attributes
(attribute
  (attribute_name) @attribute
  "=" @operator
  (attribute_value
    "\"" @punctuation.delimiter
    (quoted_attribute_value) @string
    "\"" @punctuation.delimiter))

(attribute
  (attribute_name) @attribute
  "=" @operator
  (attribute_value
    "'" @punctuation.delimiter
    (quoted_attribute_value) @string
    "'" @punctuation.delimiter))

; Razor comments
(razor_comment) @comment

; HTML comments
(comment) @comment

; Razor keywords and directives
(razor_keyword) @keyword
"@page" @keyword
"@model" @keyword
"@using" @keyword
"@namespace" @keyword
"@inherits" @keyword
"@layout" @keyword
"@section" @keyword
"@inject" @keyword
"@implements" @keyword
"@code" @keyword
"@functions" @keyword
"@if" @keyword
"@else" @keyword
"@elseif" @keyword
"@switch" @keyword
"@case" @keyword
"@default" @keyword
"@for" @keyword
"@foreach" @keyword
"@while" @keyword
"@do" @keyword
"@try" @keyword
"@catch" @keyword
"@finally" @keyword
"@lock" @keyword
"@await" @keyword
"@async" @keyword

; C# keywords within Razor context
"var" @keyword
"new" @keyword
"class" @keyword
"public" @keyword
"private" @keyword
"protected" @keyword
"internal" @keyword
"static" @keyword
"readonly" @keyword
"const" @keyword
"virtual" @keyword
"override" @keyword
"abstract" @keyword
"sealed" @keyword
"partial" @keyword
"string" @type
"int" @type
"bool" @type
"double" @type
"float" @type
"decimal" @type
"char" @type
"byte" @type
"long" @type
"short" @type
"object" @type
"void" @type

; Strings
(string_literal) @string
(character_literal) @string

; Numbers
(integer_literal) @number
(real_literal) @number

; Booleans
"true" @boolean
"false" @boolean
"null" @constant

; Operators
"=" @operator
"==" @operator
"!=" @operator
"<" @operator
">" @operator
"<=" @operator
">=" @operator
"+" @operator
"-" @operator
"*" @operator
"/" @operator
"%" @operator
"&&" @operator
"||" @operator
"!" @operator
"++" @operator
"--" @operator
"+=" @operator
"-=" @operator
"*=" @operator
"/=" @operator
"??" @operator
"?:" @operator
"." @operator

; Punctuation
";" @punctuation.delimiter
"," @punctuation.delimiter
"{" @punctuation.bracket
"}" @punctuation.bracket
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket

; HTML text content
(text) @text.literal