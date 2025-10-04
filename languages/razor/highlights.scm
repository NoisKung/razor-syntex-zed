; Razor directives
(razor_directive) @keyword
(razor_block_start) @punctuation.special
(razor_block_end) @punctuation.special

; Razor @ symbols
"@" @operator

; Razor code blocks
; HTML-based highlighting with Razor patterns
; Since we're using the HTML grammar, we work with HTML nodes

; HTML Elements
(element
  (start_tag
    (tag_name) @tag))

(element
  (end_tag
    (tag_name) @tag))

(self_closing_tag
  (tag_name) @tag)

; HTML Attributes
(attribute
  (attribute_name) @attribute)

(quoted_attribute_value
  (attribute_value) @string)

; HTML Comments
(comment) @comment

; DOCTYPE
(doctype) @keyword

; Text content with Razor pattern matching
(text) @string

; Razor directives in text (using pattern matching)
((text) @keyword
  (#match? @keyword "@(page|model|using|namespace|layout|section|inject|inherits|implements|addTagHelper)\\b"))

; Razor code blocks
((text) @embedded
  (#match? @embedded "@\\{"))

((text) @embedded
  (#match? @embedded "@code\\s*\\{"))

((text) @embedded
  (#match? @embedded "@functions\\s*\\{"))

; Razor control structures
((text) @keyword.control
  (#match? @keyword.control "@(if|else|elseif|foreach|for|while|switch|case|try|catch|finally|using|with|await)\\b"))

; Razor expressions
((text) @variable
  (#match? @variable "@[a-zA-Z_][a-zA-Z0-9_]*"))

; Razor comments
((text) @comment
  (#match? @comment "@\\*.*?\\*@"))

; CSS in style elements
(style_element
  (raw_text) @embedded)

; JavaScript in script elements  
(script_element
  (raw_text) @embedded)

; HTML5 semantic elements
((tag_name) @tag.builtin
  (#match? @tag.builtin "^(article|aside|details|figcaption|figure|footer|header|main|mark|nav|section|summary|time|html|head|body|title|meta|link)$"))

; Form elements
((tag_name) @tag.builtin  
  (#match? @tag.builtin "^(form|input|button|select|option|textarea|label|fieldset|legend)$"))

; Common elements
((tag_name) @tag.builtin
  (#match? @tag.builtin "^(div|span|p|a|img|ul|ol|li|table|tr|td|th|h[1-6])$"))

; Razor-specific attributes
(attribute
  (attribute_name) @attribute
  (#match? @attribute "^(asp-|data-)"))

; Special attribute values containing Razor
(quoted_attribute_value
  (attribute_value) @embedded
  (#match? @embedded "@"))

; @ symbol highlighting
((text) @operator
  (#match? @operator "^@$"))

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