; Razor directives for outline
(razor_directive
  "@page" @name) @item

(razor_directive
  "@model" @name) @item

(razor_directive
  "@section"
  name: (identifier) @name) @item

; C# methods in code blocks
(method_declaration
  name: (identifier) @name) @item

; C# classes in code blocks
(class_declaration
  name: (identifier) @name) @item

; C# properties in code blocks
(property_declaration
  name: (identifier) @name) @item

; HTML elements with id attributes
(element
  (start_tag
    (tag_name) @context
    (attribute
      (attribute_name) @_attr_name
      (attribute_value
        (quoted_attribute_value) @name
        (#eq? @_attr_name "id")))) @item

; HTML headings
(element
  (start_tag
    (tag_name) @_tag_name
    (#match? @_tag_name "^h[1-6]$"))
  (text) @name) @item

; Razor functions
(razor_code_block
  content: (csharp_code
    (method_declaration
      name: (identifier) @name))) @item