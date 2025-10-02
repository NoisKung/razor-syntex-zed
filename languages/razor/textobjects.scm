; Razor functions as methods
(razor_code_block
  content: (csharp_code
    (method_declaration) @function.around))

(razor_code_block
  content: (csharp_code
    (method_declaration
      body: (block
        "{" @_start
        "}" @_end
        (#not-eq? @_start @_end)) @function.inside)))

; C# classes
(class_declaration) @class.around
(class_declaration
  body: (declaration_list
    "{" @_start
    "}" @_end
    (#not-eq? @_start @_end)) @class.inside)

; HTML elements as sections
(element) @class.around
(element
  (text) @class.inside)

; Comments
(comment)+ @comment.around
(razor_comment)+ @comment.around

; Razor code blocks as functions
(razor_code_block) @function.around
(razor_code_block
  content: (_) @function.inside)