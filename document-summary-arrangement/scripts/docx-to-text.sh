#!/bin/bash
# Extract text from a .docx file.
# Uses textutil on macOS, libreoffice on Linux.
#
# Usage: ./scripts/docx-to-text.sh <input.docx>
#
# Output: text to stdout

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <input.docx>"
    exit 1
fi

INPUT="$1"

if [ ! -f "$INPUT" ]; then
    echo "ERROR: File not found: $INPUT"
    exit 1
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    textutil -convert txt -stdout "$INPUT"
elif command -v libreoffice &> /dev/null; then
    TMPDIR=$(mktemp -d)
    libreoffice --headless --convert-to txt --outdir "$TMPDIR" "$INPUT" >/dev/null 2>&1
    BASENAME=$(basename "$INPUT" .docx)
    cat "$TMPDIR/$BASENAME.txt"
    rm -rf "$TMPDIR"
elif command -v python3 &> /dev/null; then
    python3 -c "
from docx import Document
doc = Document('$INPUT')
for para in doc.paragraphs:
    print(para.text)
" 2>/dev/null || echo "ERROR: No .docx reader available. Install textutil (macOS), libreoffice (Linux), or python-docx."
else
    echo "ERROR: No .docx reader available."
    exit 1
fi
