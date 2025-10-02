; String contexts - disable auto-completion triggers
(string_literal) @string

; Comment contexts
(comment) @comment
(razor_comment) @comment

; HTML attribute contexts  
(attribute_value) @html_attribute

; Razor code contexts
(razor_code_block) @csharp_code
(razor_expression) @csharp_code
(razor_implicit_expression) @csharp_code

; HTML tag contexts
(start_tag) @html_tag
(end_tag) @html_tag
(self_closing_tag) @html_tag