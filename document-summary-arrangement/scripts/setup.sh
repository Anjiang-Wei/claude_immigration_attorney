#!/bin/bash
# Install dependencies for document processing
# Run: ./scripts/setup.sh

set -e

echo "=== Claude for Legal — Setup ==="

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macOS detected"

    if ! command -v brew &> /dev/null; then
        echo "ERROR: Homebrew not installed. Install from https://brew.sh"
        exit 1
    fi

    # poppler: pdftotext, pdfinfo, pdftoppm
    if ! command -v pdftotext &> /dev/null; then
        echo "Installing poppler (PDF tools)..."
        brew install poppler
    else
        echo "✓ poppler already installed"
    fi

    # textutil is built into macOS (for .docx conversion)
    if command -v textutil &> /dev/null; then
        echo "✓ textutil available (macOS built-in)"
    fi

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Linux detected"

    if ! command -v pdftotext &> /dev/null; then
        echo "Installing poppler-utils..."
        sudo apt-get update && sudo apt-get install -y poppler-utils
    else
        echo "✓ poppler-utils already installed"
    fi

    # libreoffice for .docx on Linux
    if ! command -v libreoffice &> /dev/null; then
        echo "Installing libreoffice (for .docx conversion)..."
        sudo apt-get install -y libreoffice
    else
        echo "✓ libreoffice already installed"
    fi
fi

echo ""
echo "=== Checking tools ==="
echo -n "pdftotext: " && (command -v pdftotext && pdftotext -v 2>&1 | head -1) || echo "NOT FOUND"
echo -n "pdfinfo:   " && command -v pdfinfo || echo "NOT FOUND"
echo -n "pdftoppm:  " && command -v pdftoppm || echo "NOT FOUND"
echo ""
echo "Setup complete."
