#!/bin/bash
# Convert PDF pages to PNG images for multimodal reading.
# Useful for scanned documents, forms, certificates.
#
# Usage: ./scripts/pdf-to-images.sh <input.pdf> [output_dir] [dpi]
#
# Default DPI: 200 (good balance of quality vs. file size for OCR)
# Use 150 for large PDFs to keep image sizes manageable

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <input.pdf> [output_dir] [dpi]"
    exit 1
fi

INPUT="$1"
OUTPUT_DIR="${2:-/tmp/pdf_images_$$}"
DPI="${3:-200}"

if [ ! -f "$INPUT" ]; then
    echo "ERROR: File not found: $INPUT"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

PAGES=$(pdfinfo "$INPUT" 2>/dev/null | grep -i "^pages:" | awk '{print $2}')
echo "Converting $PAGES pages at ${DPI}dpi..." >&2

pdftoppm -png -r "$DPI" "$INPUT" "$OUTPUT_DIR/page" 2>/dev/null

IMAGE_COUNT=$(ls "$OUTPUT_DIR/"*.png 2>/dev/null | wc -l | tr -d ' ')
TOTAL_SIZE=$(du -sh "$OUTPUT_DIR" | awk '{print $1}')

echo "Done: $IMAGE_COUNT images, $TOTAL_SIZE total" >&2
echo ""
echo "OUTPUT_DIR=$OUTPUT_DIR"
echo "PAGES=$PAGES"
echo "IMAGES=$IMAGE_COUNT"
ls "$OUTPUT_DIR/"*.png
