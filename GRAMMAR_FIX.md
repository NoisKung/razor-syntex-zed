# Fixed Grammar Configuration

## What Was the Problem?

The error `symbol exported via --export not found: tree_sitter_razor` occurred because:

1. **Custom Grammar Conflict**: We defined a custom "razor" grammar in `extension.toml`
2. **Missing Grammar Implementation**: Zed tried to compile a "razor" grammar but we were pointing to HTML grammar repo
3. **Symbol Mismatch**: The HTML grammar exports `tree_sitter_html`, not `tree_sitter_razor`

## What I Fixed

1. **Removed Custom Grammar**: Deleted the `[grammars.razor]` section from `extension.toml`
2. **Use Built-in HTML**: Changed `languages/razor/config.toml` to use `grammar = "html"`
3. **Clean Rebuild**: Removed cached files and rebuilt the extension

## Current Configuration

**extension.toml**: No custom grammar definition (uses Zed's built-in HTML grammar)
**languages/razor/config.toml**: `grammar = "html"` (leverages existing HTML parsing)

## Why This Works

- **HTML Foundation**: Razor files are primarily HTML with embedded C# code
- **Built-in Support**: Zed already has robust HTML grammar support
- **Our Enhancements**: The `.scm` files add Razor-specific highlighting on top of HTML
- **File Recognition**: `.cshtml` and `.razor` files will be recognized as Razor language

## Installation Should Work Now! 

Try installing the extension again in Zed:
1. Command Palette: `Cmd+Shift+P`
2. Type: `zed: install dev extension`  
3. Navigate to: `/Users/supakit-s/Github/razor-syntex`
4. Click: `Open`

The extension should now install without grammar compilation errors! 🎉