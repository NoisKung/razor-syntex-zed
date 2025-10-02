# Installation Troubleshooting Guide

## What Was Changed to Fix Installation Issues

1. **Simplified Rust Extension**: Removed language server functionality that might have been causing compilation issues
2. **Removed Language Server Config**: Temporarily removed OmniSharp configuration from extension.toml
3. **Clean Rebuild**: Performed a complete clean and rebuild

## How to Install Now

1. **In Zed IDE**:
   - Open Command Palette: `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Windows/Linux)
   - Type: `zed: install dev extension`
   - Select: `Install Dev Extension`
   - Navigate to: `/Users/supakit-s/Github/razor-syntex`
   - Click: `Open`

2. **Alternative Method**:
   - In Zed, go to `Extensions` tab
   - Click `Install Dev Extension` button (top right)
   - Browse to the extension folder and select it

## What Should Work Now

✅ **Basic Syntax Highlighting**: Razor directives, code blocks, and mixed HTML/C# syntax
✅ **File Recognition**: `.cshtml` and `.razor` files should be recognized
✅ **Bracket Matching**: Auto-closing brackets and proper indentation
✅ **Commenting**: Proper Razor comment support

## Testing the Extension

After installation, try opening these test files:
- `sample.cshtml` - Basic Razor page with various features
- `advanced-sample.cshtml` - Complex Razor syntax examples  
- `weather.razor` - Blazor component example

## If It Still Doesn't Work

1. **Check Zed Version**: Make sure you're using a recent version of Zed
2. **Check Rust Installation**: Run `rustup show` to verify your toolchain
3. **Check WebAssembly Target**: Run `rustup target list --installed | grep wasm`
4. **View Zed Logs**: In Zed, go to `View > Developer > Open Log File`

## Re-enabling Advanced Features (Optional)

Once basic installation works, we can add back:
- OmniSharp language server integration
- Advanced IntelliSense features
- More complex syntax rules

The current version focuses on core syntax highlighting to ensure it installs successfully.