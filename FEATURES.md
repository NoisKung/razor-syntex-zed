# Features Documentation

This document describes all the features provided by the ASP.NET Razor Syntax extension for Zed.

## Syntax Highlighting

### Razor Directives

The extension recognizes and highlights all major Razor directives:

```razor
@page "/example"           # Page directive
@model MyModel             # Model declaration
@using System.Collections  # Using statements
@namespace MyApp.Pages     # Namespace declaration
@inherits MyBasePage       # Inheritance
@layout MyLayout           # Layout specification
@section Scripts { ... }   # Named sections
@inject IService Service   # Dependency injection
@implements IDisposable    # Interface implementation
```

### Code Blocks

Different types of Razor code blocks are properly highlighted:

```razor
@{
    // Server-side code block
    var userName = "John";
    var currentTime = DateTime.Now;
}

@(userName.ToUpper())      // Explicit expression
@userName                  // Implicit expression
@currentTime.ToString()    // Method calls

@code {
    // Component code (Blazor)
    private string message = "Hello";
    
    protected override void OnInitialized()
    {
        // Lifecycle methods
    }
}

@functions {
    // Helper functions
    private string FormatName(string name)
    {
        return name?.Trim() ?? "Unknown";
    }
}
```

### Control Structures

All C# control structures within Razor are supported:

```razor
@if (User.IsAuthenticated)
{
    <p>Welcome, @User.Name!</p>
}
else
{
    <p>Please log in.</p>
}

@switch (User.Role)
{
    case "Admin":
        <p>Administrator access</p>
        break;
    case "User":
        <p>User access</p>
        break;
    default:
        <p>Limited access</p>
        break;
}

@for (int i = 0; i < 10; i++)
{
    <p>Item @i</p>
}

@foreach (var item in Model.Items)
{
    <div class="item">@item.Name</div>
}

@while (condition)
{
    // Loop content
}

@try
{
    // Risky code
}
@catch (Exception ex)
{
    <p>Error: @ex.Message</p>
}
@finally
{
    // Cleanup
}

@await SomeAsyncMethod()
```

### HTML Integration

HTML elements are properly highlighted with tag matching:

```razor
<div class="container" id="main">
    <h1>@PageTitle</h1>
    <p class="text-@CssClass">@Content</p>
    <input type="text" value="@Model.Value" />
    <button onclick="handleClick()">@ButtonText</button>
</div>

<!-- Self-closing tags -->
<img src="@ImageUrl" alt="@ImageAlt" />
<br />
<hr />
```

### Language Injection

The extension supports embedding different languages:

#### JavaScript in Script Tags

```razor
<script type="text/javascript">
    function greetUser() {
        alert('Hello, @User.Name!');
        console.log('@DateTime.Now');
    }
    
    // Razor variables in JavaScript
    var serverData = {
        user: '@User.Name',
        isAuthenticated: @User.IsAuthenticated.ToString().ToLower()
    };
</script>
```

#### CSS in Style Tags

```razor
<style>
    .user-@User.Id {
        color: @Theme.PrimaryColor;
        background-color: #f0f0f0;
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
</style>
```

#### Inline Styles

```razor
<div style="color: @TextColor; font-size: @FontSize px;">
    Styled content
</div>
```

## Comments

Multiple comment types are supported:

```razor
@* 
   Multi-line Razor comment
   This won't appear in rendered HTML
   @Variable references are ignored here
*@

<!-- HTML comment (appears in source) -->

@{
    // C# single-line comment
    /* C# multi-line comment */
    var x = 10; // Inline comment
}
```

## Code Structure & Outline

The extension provides a structured outline view showing:

### Page Structure

- `@page` directives
- `@model` declarations
- `@section` definitions

### C# Elements

- Classes and interfaces
- Methods and properties
- Fields and variables

### HTML Structure

- Elements with `id` attributes
- Heading tags (`h1`-`h6`)
- Major structural elements

Example outline for a typical Razor page:

```
📄 Sample.cshtml
├── 📍 @page "/sample"
├── 📋 @model SampleModel
├── 🏷️ h1#main-title
├── 📦 div#content
├── 🔧 @section Scripts
├── 🔧 @section Styles
└── 💻 @code
    ├── 🎯 OnInitializedAsync()
    ├── 🎯 HandleButtonClick()
    └── 📊 SampleModel
        ├── 📝 ShowAlert
        └── 📝 Title
```

## Bracket Matching

The extension matches various bracket types:

- **HTML Tags**: `<div>` ↔ `</div>`
- **Razor Blocks**: `@{` ↔ `}`
- **Parentheses**: `(` ↔ `)`
- **Square Brackets**: `[` ↔ `]`
- **String Quotes**: `"` ↔ `"`, `'` ↔ `'`
- **Razor Comments**: `@*` ↔ `*@`

## Auto-Indentation

Smart indentation for:

### HTML Elements

```razor
<div>
    <p>
        Content is properly indented
    </p>
</div>
```

### Razor Code Blocks

```razor
@{
    if (condition)
    {
        // Properly indented C# code  
        var result = ProcessData();
    }
}
```

### Mixed Content

```razor
@if (showContent)
{
    <div class="content">
        <p>@Message</p>
        @foreach (var item in items)
        {
            <span>@item</span>
        }
    </div>
}
```

## Text Objects (Vim Mode)

For users with Vim mode enabled:

- `af` / `if` - Select around/inside functions
- `ac` / `ic` - Select around/inside classes  
- `gc` - Select comments
- `]]` / `[[` - Navigate between functions/sections

## Language Server Integration

When used with OmniSharp, additional features include:

### IntelliSense

- Auto-completion for C# code
- Method signatures and parameter hints
- Type information on hover

### Error Checking

- Real-time syntax error detection
- Semantic error highlighting
- Warning squiggles for potential issues

### Navigation

- Go to definition (`F12`)
- Find all references (`Shift+F12`)
- Peek definition (`Alt+F12`)

### Refactoring

- Rename symbols (`F2`)
- Extract method
- Organize imports

## File Associations

The extension automatically activates for:

- `.cshtml` files (ASP.NET Core Razor Pages/Views)
- `.razor` files (Blazor Components)

## Customization

### Theme Integration

The extension uses semantic highlighting tokens that work with all Zed themes:

- `@keyword` - Razor directives and C# keywords
- `@operator` - @ symbols and operators
- `@tag` - HTML tag names
- `@attribute` - HTML attributes  
- `@string` - String literals
- `@number` - Numeric values
- `@comment` - All comment types
- `@embedded` - Embedded code blocks
- `@punctuation` - Brackets, braces, delimiters

### Settings

Customize the extension through Zed settings:

```json
{
  "languages": {
    "Razor": {
      "tab_size": 4,           // Indentation size
      "hard_tabs": false,      // Use spaces instead of tabs
      "word_characters": ["@", "_"],  // Additional word characters
      "auto_close_tags": true, // Auto-close HTML tags
      "format_on_save": true   // Format on file save
    }
  }
}
```

## Performance

The extension is optimized for:

- **Fast Parsing**: Efficient Tree-sitter grammar
- **Incremental Updates**: Only re-parse changed sections
- **Memory Efficiency**: Minimal memory footprint
- **Large Files**: Handles files with thousands of lines

## Limitations

Current limitations that may be addressed in future versions:

1. **Complex Expressions**: Very complex nested Razor expressions might not highlight perfectly
2. **Custom Directives**: Third-party Razor directives require grammar updates
3. **Mixed Syntax**: Some edge cases with mixed HTML/C#/JavaScript might not parse perfectly
4. **Language Server**: Requires separate OmniSharp installation for advanced features

## Future Enhancements

Planned features for future releases:

- **Better Error Recovery**: Improved parsing of malformed syntax
- **More Directives**: Support for additional Razor directives
- **Blazor Components**: Enhanced support for Blazor-specific syntax
- **Snippets**: Built-in code snippets for common Razor patterns
- **Formatter**: Automatic code formatting
- **Semantic Highlighting**: More granular syntax highlighting