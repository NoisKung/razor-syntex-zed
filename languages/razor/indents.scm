; HTML elements indentation
(element) @indent
(self_closing_tag) @indent

; General bracket indentation  
("{" @start "}" @end) @indent
("[" @start "]" @end) @indent
("(" @start ")" @end) @indent