; HTML elements
(element ">" @end) @indent
(self_closing_tag) @indent

; Razor code blocks
(razor_code_block 
  "{" @start
  "}" @end) @indent

; C# control structures within Razor
(if_statement
  "{" @start
  "}" @end) @indent

(for_statement
  "{" @start  
  "}" @end) @indent

(foreach_statement
  "{" @start
  "}" @end) @indent

(while_statement
  "{" @start
  "}" @end) @indent

(switch_statement
  "{" @start
  "}" @end) @indent

(try_statement
  "{" @start
  "}" @end) @indent

; Method definitions
(method_declaration
  "{" @start
  "}" @end) @indent

; Class definitions  
(class_declaration
  "{" @start
  "}" @end) @indent

; Object initializers
(object_creation_expression
  "{" @start
  "}" @end) @indent

; Array initializers
(array_creation_expression
  "{" @start
  "}" @end) @indent