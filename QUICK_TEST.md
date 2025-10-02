# Quick Installation Test Guide

## 🎯 Testing Your Razor Extension

Now that the extension is built successfully, here's how to install and test it:

### 1. Install the Extension in Zed

1. **Open Zed IDE**
2. **Open the Extensions Panel:**
   - Press `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Windows/Linux)
   - Type "zed: extensions" and select it
   - OR use menu: `Zed > Extensions`

3. **Install Dev Extension:**
   - Click the "Install Dev Extension" button
   - Navigate to your extension folder: `/Users/supakit-s/Github/razor-syntex`
   - Select the folder and click "Open"

### 2. Test the Extension

Open these test files in Zed to verify syntax highlighting:

#### Basic Razor Page (`.cshtml`)
```bash
# Open the sample file
open sample.cshtml
```

#### Advanced Razor Features
```bash
# Open the advanced sample
open advanced-sample.cshtml  
```

#### Blazor Component (`.razor`)
```bash
# Open the Blazor component
open weather.razor
```

### 3. What to Look For

The extension should provide syntax highlighting for:

✅ **Razor Directives**: `@page`, `@model`, `@using`, `@inject`  
✅ **Code Blocks**: `@{ ... }`, `@code { ... }`, `@functions { ... }`  
✅ **Expressions**: `@variable`, `@method()`, `@(complex.expression)`  
✅ **Control Structures**: `@if`, `@foreach`, `@for`, `@while`  
✅ **HTML Elements**: Tags, attributes, content  
✅ **CSS Styles**: Embedded `<style>` blocks  
✅ **JavaScript**: Embedded `<script>` blocks  
✅ **C# Code**: Variables, methods, classes within code blocks  
✅ **Comments**: Razor comments `@* ... *@` and HTML comments `<!-- -->`  

### 4. Language Features

The extension also provides:

- **File Association**: `.cshtml` and `.razor` files
- **HTML Base Grammar**: Tree-sitter HTML parsing
- **Language Injection**: C#, JavaScript, CSS highlighting within Razor
- **OmniSharp Support**: Optional language server integration (requires OmniSharp installation)

### 5. Optional: Enable OmniSharp Language Server

For enhanced IntelliSense, auto-completion, and error checking:

1. **Install OmniSharp:**
   ```bash
   # Using Homebrew (macOS)
   brew install omnisharp
   
   # Using .NET tool (cross-platform)
   dotnet tool install --global OmniSharp
   ```

2. **Restart Zed** - The extension will automatically detect and use OmniSharp

### 6. Troubleshooting

If the extension doesn't work:

1. **Check Extension Installation:**
   - Go to Zed Extensions panel
   - Verify "Razor Syntax" appears in installed extensions

2. **Check File Association:**
   - Open a `.cshtml` or `.razor` file
   - Check status bar shows "Razor" as the language

3. **Rebuild Extension (if needed):**
   ```bash
   cd /Users/supakit-s/Github/razor-syntex
   cargo build --target wasm32-wasip1 --release
   ```

4. **View Logs:**
   - Open Zed's developer console for any error messages
   - Check terminal output when building the extension

### 🎉 Success!

If syntax highlighting is working correctly, you should see:
- Razor directives in bright colors
- C# code properly highlighted within `@{ }` blocks
- HTML elements and attributes colored appropriately
- CSS and JavaScript syntax highlighting in embedded blocks
- Proper indentation and bracket matching

The extension is now ready for use! You can create new `.cshtml` and `.razor` files and enjoy full Razor syntax highlighting in Zed IDE.