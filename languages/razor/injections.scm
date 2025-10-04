; JavaScript injection in script elements
(script_element
  (raw_text) @injection.content
  (#set! injection.language "javascript"))

; CSS injection in style elements
(style_element
  (raw_text) @injection.content
  (#set! injection.language "css"))

; CSS injection in style attributes
(attribute
  (attribute_name) @_attr_name
  (quoted_attribute_value
    (attribute_value) @injection.content)
  (#eq? @_attr_name "style")
  (#set! injection.language "css"))

; Basic JavaScript injection for script tags
(element
  (start_tag
    (tag_name) @_tag_name
    (#eq? @_tag_name "script"))
  (text) @injection.content
  (#set! injection.language "javascript"))

; Basic CSS injection for style tags  
(element
  (start_tag
    (tag_name) @_tag_name
    (#eq? @_tag_name "style"))
  (text) @injection.content
  (#set! injection.language "css"))