; Inject C# code into Razor code blocks
(razor_code_block
  content: (csharp_code) @injection.content
  (#set! injection.language "csharp"))

; Inject C# code into Razor expressions
(razor_expression
  content: (csharp_code) @injection.content
  (#set! injection.language "csharp"))

; Inject C# code into implicit expressions
(razor_implicit_expression
  content: (csharp_code) @injection.content
  (#set! injection.language "csharp"))

; Inject HTML into template content
(template_content) @injection.content
(#set! injection.language "html")

; Inject JavaScript into script tags
(element
  (start_tag
    (tag_name) @_tag_name
    (attribute
      (attribute_name) @_attr_name
      (attribute_value
        (quoted_attribute_value) @_type
        (#eq? @_type "text/javascript")))
    (#eq? @_tag_name "script"))
  (text) @injection.content
  (#set! injection.language "javascript"))

; Inject CSS into style tags
(element
  (start_tag
    (tag_name) @_tag_name
    (#eq? @_tag_name "style"))
  (text) @injection.content
  (#set! injection.language "css"))

; Inject CSS into style attributes
(attribute
  (attribute_name) @_attr_name
  (attribute_value
    (quoted_attribute_value) @injection.content
    (#eq? @_attr_name "style"))
  (#set! injection.language "css"))