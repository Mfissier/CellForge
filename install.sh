#!/bin/bash

# CellForge Installation Script
# Installs all required dependencies for all language bindings

set -e

echo "🔧 Installing CellForge dependencies..."

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo "📦 Detected Linux - installing packages with apt..."
    
    # Update package lists
    sudo apt update
    
    # Install build tools and compilers
    sudo apt install -y build-essential gcc g++ make
    
    # Install language runtimes
    sudo apt install -y python3 python3-pip nodejs npm php php-ffi ruby ruby-dev
    
    echo "✅ Linux packages installed successfully"
    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "📦 Detected macOS - installing packages with brew..."
    
    # Install build tools
    xcode-select --install 2>/dev/null || true
    
    # Install language runtimes via Homebrew
    brew install python3 
    
    echo "✅ macOS packages installed successfully"
    
else
    echo "❌ Unsupported OS: $OSTYPE"
    echo "Please install manually: python3"
    exit 1
fi