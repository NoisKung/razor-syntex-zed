# ASP.NET Razor Syntax Extension for Zed

This extension provides syntax highlighting and language support for ASP.NET Razor files (`.cshtml` and `.razor`) in the Zed editor.

## Features

- 🎨 **Comprehensive Syntax Highlighting**: Supports HTML, C#, and Razor-specific syntax
- 🔗 **Language Injection**: Proper highlighting for embedded C# code, JavaScript, and CSS
- 🏗️ **Code Structure**: Outline view with methods, classes, and HTML elements
- 📝 **Smart Indentation**: Automatic indentation for HTML and C# code blocks
- 🔍 **Bracket Matching**: Matching for HTML tags, C# blocks, and Razor comments
- 💡 **Auto-completion**: Basic support through OmniSharp language server (optional)

## Supported File Types

- `.cshtml` - ASP.NET Core Razor Pages and MVC Views
- `.razor` - Blazor Components

## Supported Razor Syntax

### Directives
- `@page`, `@model`, `@using`, `@namespace`
- `@inherits`, `@layout`, `@section`
- `@inject`, `@implements`

### Code Blocks
- `@{ ... }` - Server-side code blocks
- `@( ... )` - Explicit expressions  
- `@variable` - Implicit expressions
- `@code { ... }` - Component code blocks
- `@functions { ... }` - Helper functions

### Control Structures
- `@if`, `@else`, `@elseif`
- `@switch`, `@case`, `@default`
- `@for`, `@foreach`, `@while`, `@do`
- `@try`, `@catch`, `@finally`
- `@await`, `@async`

### Comments
- `@* ... *@` - Razor comments
- `<!-- ... -->` - HTML comments

## Installation

### Method 1: Development Installation (Recommended for testing)

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/razor-syntax-zed.git
   cd razor-syntax-zed
   ```

2. Install Rust (required for Zed extensions):
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```

3. Open Zed and go to Extensions (`Cmd+Shift+X` on macOS, `Ctrl+Shift+X` on Linux/Windows)

4. Click "Install Dev Extension" and select the cloned directory

### Method 2: From Zed Extensions Registry (When published)

1. Open Zed
2. Go to Extensions (`Cmd+Shift+X` on macOS, `Ctrl+Shift+X` on Linux/Windows)  
3. Search for "ASP.NET Razor Syntax"
4. Click Install

## Language Server Integration

For enhanced features like IntelliSense, go-to-definition, and error checking, you can install the OmniSharp language server:

### Install OmniSharp

**macOS (using Homebrew):**
```bash
brew install omnisharp
```

**Windows:**
```bash
dotnet tool install --global omnisharp
```

**Linux:**
```bash
# Download the latest release from GitHub
# https://github.com/OmniSharp/omnisharp-roslyn/releases
```

## Configuration

You can customize the extension behavior by modifying your Zed settings:

```json
{
  "languages": {
    "Razor": {
      "tab_size": 4,
      "hard_tabs": false,
      "word_characters": ["@", "_"]
    }
  }
}
```

## Syntax Highlighting Themes

The extension uses semantic highlighting with the following token types:

- `@keyword` - Razor directives and C# keywords
- `@operator` - The `@` symbol and C# operators
- `@tag` - HTML tag names
- `@attribute` - HTML attributes
- `@string` - String literals
- `@number` - Numeric literals
- `@comment` - Razor and HTML comments
- `@embedded` - Embedded C# code
- `@punctuation.bracket` - Brackets and braces
- `@punctuation.delimiter` - Semicolons and commas

## Example Razor File

```razor
@page "/counter"
@using MyApp.Services

<h1>Counter: @currentCount</h1>

<button @onclick="IncrementCount">Click me</button>

@code {
    private int currentCount = 0;

    private void IncrementCount()
    {
        currentCount++;
    }
}

@section Scripts {
    <script>
        console.log("Counter page loaded");
    </script>
}
```

## Development

### Building the Extension

```bash
cargo build --release --target wasm32-wasi
```

### Testing

Create test files with various Razor syntax patterns and verify:
1. Syntax highlighting works correctly
2. Indentation behaves properly
3. Bracket matching functions
4. Code outline shows structure

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Known Limitations

- Complex nested expressions may not highlight perfectly
- Some advanced Razor syntax might need additional grammar rules
- Language server features require OmniSharp to be installed separately

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built using the [Zed Extension API](https://zed.dev/docs/extensions/developing-extensions.html)
- Uses Tree-sitter for syntax parsing
- Inspired by existing Razor syntax support in other editors