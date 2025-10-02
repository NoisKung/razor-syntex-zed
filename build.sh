#!/bin/bash

# Build script for the Razor Syntax Zed Extension

echo "Building ASP.NET Razor Syntax Extension for Zed..."

# Check if Rust is installed
if ! command -v cargo &> /dev/null; then
    echo "Error: Rust is not installed. Please install Rust first:"
    echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    echo "Then restart your terminal and run this script again."
    exit 1
fi

# Add wasm32-wasip1 target if not already installed
echo "Adding wasm32-wasip1 target..."
rustup target add wasm32-wasip1

# Build the extension
echo "Building extension..."
cargo build --release --target wasm32-wasip1

if [ $? -eq 0 ]; then
    echo "✅ Extension built successfully!"
    echo ""
    echo "To install the extension in Zed:"
    echo "1. Open Zed"
    echo "2. Go to Extensions (Cmd+Shift+X on macOS, Ctrl+Shift+X on Linux/Windows)"
    echo "3. Click 'Install Dev Extension'"
    echo "4. Select this directory: $(pwd)"
    echo ""
    echo "The extension will then be available for .cshtml and .razor files."
else
    echo "❌ Build failed. Please check the errors above."
    exit 1
fi