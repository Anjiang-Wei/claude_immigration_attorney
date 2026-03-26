#!/bin/bash
# Extract text from a PDF. If the PDF is scanned (no text layer),
# falls back to converting pages to images for multimodal reading.
#
# Usage: ./scripts/pdf-to-text.sh <input.pdf> [output_dir]
#
# If text extraction succeeds: outputs text to stdout (or output_dir/text.txt)
# If scanned PDF detected: converts to images in output_dir/pages/

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <input.pdf> [output_dir]"
    exit 1
fi

INPUT="$1"
OUTPUT_DIR="${2:-/tmp/pdf_extract_$$}"

if [ ! -f "$INPUT" ]; then
    echo "ERROR: File not found: $INPUT"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Get page count
PAGES=$(pdfinfo "$INPUT" 2>/dev/null | grep -i "^pages:" | awk '{print $2}')
echo "Pages: ${PAGES:-unknown}" >&2

# Try text extraction
pdftotext "$INPUT" "$OUTPUT_DIR/text.txt" 2>/dev/null

# Check if text was actually extracted (scanned PDFs produce empty output)
CHAR_COUNT=$(wc -c < "$OUTPUT_DIR/text.txt" | tr -d ' ')

if [ "$CHAR_COUNT" -gt 100 ]; then
    echo "TEXT PDF — extracted $CHAR_COUNT characters" >&2
    cat "$OUTPUT_DIR/text.txt"
else
    echo "SCANNED PDF — no text layer detected ($CHAR_COUNT chars). Converting to images..." >&2
    mkdir -p "$OUTPUT_DIR/pages"
    pdftoppm -png -r 200 "$INPUT" "$OUTPUT_DIR/pages/page" 2>/dev/null
    IMAGE_COUNT=$(ls "$OUTPUT_DIR/pages/"*.png 2>/dev/null | wc -l | tr -d ' ')
    echo "Converted $IMAGE_COUNT pages to images in: $OUTPUT_DIR/pages/" >&2
    echo ""
    echo "SCANNED_PDF"
    echo "PAGES=$PAGES"
    echo "IMAGES_DIR=$OUTPUT_DIR/pages"
    ls "$OUTPUT_DIR/pages/"*.png
fi
