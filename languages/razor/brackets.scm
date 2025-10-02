; HTML tags
("<" @open ">" @close)
("</" @open ">" @close)

; Razor code blocks
("{" @open "}" @close)
("@{" @open "}" @close)

; Parentheses
("(" @open ")" @close)

; Square brackets
("[" @open "]" @close)

; String literals
("\"" @open "\"" @close)
("'" @open "'" @close)

; Razor comments
("@*" @open "*@" @close)