# Installation Guide

This guide will walk you through installing and setting up the ASP.NET Razor Syntax extension for Zed IDE.

## Prerequisites

1. **Zed Editor**: Download and install from [zed.dev](https://zed.dev)
2. **Rust**: Required for building Zed extensions

### Installing Rust

**macOS and Linux:**
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
```

**Windows (PowerShell):**
```powershell
# Download and run rustup-init.exe from https://rustup.rs/
# Or use winget:
winget install Rustlang.Rustup
```

## Installation Steps

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-username/razor-syntax-zed.git
cd razor-syntax-zed
```

### Step 2: Build the Extension

Run the build script:

```bash
./build.sh
```

Or manually:

```bash
# Add WebAssembly target
rustup target add wasm32-wasi

# Build the extension
cargo build --release --target wasm32-wasi
```

### Step 3: Install in Zed

1. Open Zed
2. Press `Cmd+Shift+X` (macOS) or `Ctrl+Shift+X` (Windows/Linux) to open Extensions
3. Click "Install Dev Extension"
4. Navigate to and select the `razor-syntax-zed` directory
5. Click "Open"

### Step 4: Verify Installation

1. Create a new file with `.cshtml` or `.razor` extension
2. Start typing some Razor syntax - you should see syntax highlighting
3. Check the language mode in the bottom-right corner shows "Razor"

## Optional: Language Server Setup

For enhanced features (IntelliSense, error checking, go-to-definition):

### Install OmniSharp

**macOS (Homebrew):**
```bash
brew install omnisharp
```

**Windows:**
```bash
dotnet tool install --global omnisharp
```

**Linux (Ubuntu/Debian):**
```bash
# Download latest release
wget https://github.com/OmniSharp/omnisharp-roslyn/releases/latest/download/omnisharp-linux-x64.tar.gz
tar -xzf omnisharp-linux-x64.tar.gz -C ~/.local/share/omnisharp
echo 'export PATH="$PATH:~/.local/share/omnisharp"' >> ~/.bashrc
```

### Configure Zed Settings

Add to your Zed settings (`Cmd+,` or `Ctrl+,`):

```json
{
  "languages": {
    "Razor": {
      "tab_size": 4,
      "hard_tabs": false,
      "word_characters": ["@", "_"],
      "auto_close_tags": true
    }
  },
  "language_servers": {
    "omnisharp": {
      "initialization_options": {
        "FormattingOptions": {
          "EnableEditorConfigSupport": true,
          "OrganizeImports": true
        },
        "RoslynExtensionsOptions": {
          "EnableAnalyzersSupport": true,
          "EnableImportCompletion": true
        }
      }
    }
  }
}
```

## Testing the Extension

Use the provided `sample.cshtml` file to test various features:

1. **Syntax Highlighting**: All Razor directives, HTML tags, and C# code should be highlighted
2. **Bracket Matching**: Clicking on brackets should highlight matching pairs
3. **Indentation**: Pressing Enter should auto-indent based on context
4. **Code Outline**: The outline panel should show methods, classes, and HTML structure
5. **Language Injection**: C# code in `@{ }` blocks should use C# highlighting

## Troubleshooting

### Extension Not Loading

1. Check that Rust is properly installed: `cargo --version`
2. Ensure the WebAssembly target is installed: `rustup target list --installed | grep wasm32-wasi`
3. Rebuild the extension: `cargo build --release --target wasm32-wasi`
4. Restart Zed completely

### No Syntax Highlighting

1. Verify the file extension is `.cshtml` or `.razor`
2. Check the language mode in the bottom-right corner
3. Manually set the language: `Cmd+Shift+P` → "Select Language" → "Razor"

### Language Server Not Working

1. Verify OmniSharp is installed: `omnisharp --version`
2. Check Zed logs: `Cmd+Shift+P` → "Open Log"
3. Restart Zed after installing OmniSharp

### Build Errors

1. Update Rust: `rustup update`
2. Clear cargo cache: `cargo clean`
3. Check for correct `zed_extension_api` version in `Cargo.toml`

## Uninstalling

1. Open Zed Extensions panel
2. Find "ASP.NET Razor Syntax" in the installed list
3. Click "Uninstall" or "Disable"
4. Restart Zed

## Support

If you encounter issues:

1. Check the [Issues](https://github.com/your-username/razor-syntax-zed/issues) page
2. Look at Zed logs for error messages
3. Create a new issue with:
   - Your OS and Zed version
   - Steps to reproduce the problem
   - Any error messages from the logs