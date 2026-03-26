#!/bin/bash
# Scan a directory of documents and report file types, sizes, and page counts.
# Used by document-summary-arrangement for the triage phase.
#
# Usage: ./scripts/scan-collection.sh <directory>
#
# Output: TSV table with file path, type, size, pages (for PDFs)

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIR="$1"

if [ ! -d "$DIR" ]; then
    echo "ERROR: Directory not found: $DIR"
    exit 1
fi

echo "=== Document Collection Scan ==="
echo "Directory: $DIR"
echo ""

# Count by type
PDF_COUNT=$(find "$DIR" -iname "*.pdf" -not -name ".DS_Store" | wc -l | tr -d ' ')
IMG_COUNT=$(find "$DIR" \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.tiff" \) -not -name ".DS_Store" | wc -l | tr -d ' ')
DOC_COUNT=$(find "$DIR" \( -iname "*.docx" -o -iname "*.doc" \) -not -name ".DS_Store" | wc -l | tr -d ' ')
XLS_COUNT=$(find "$DIR" \( -iname "*.xlsx" -o -iname "*.xls" \) -not -name ".DS_Store" | wc -l | tr -d ' ')
OTHER_COUNT=$(find "$DIR" -type f -not -iname "*.pdf" -not -iname "*.png" -not -iname "*.jpg" -not -iname "*.jpeg" -not -iname "*.tiff" -not -iname "*.docx" -not -iname "*.doc" -not -iname "*.xlsx" -not -iname "*.xls" -not -name ".DS_Store" | wc -l | tr -d ' ')
TOTAL=$(find "$DIR" -type f -not -name ".DS_Store" | wc -l | tr -d ' ')

echo "Summary:"
echo "  PDFs:   $PDF_COUNT"
echo "  Images: $IMG_COUNT"
echo "  Word:   $DOC_COUNT"
echo "  Excel:  $XLS_COUNT"
echo "  Other:  $OTHER_COUNT"
echo "  Total:  $TOTAL"
echo ""

TOTAL_SIZE=$(du -sh "$DIR" | awk '{print $1}')
echo "Total size: $TOTAL_SIZE"
echo ""

# Detailed listing
echo "=== File Details ==="
printf "%-60s %-8s %-8s %-6s\n" "FILE" "TYPE" "SIZE" "PAGES"
printf "%-60s %-8s %-8s %-6s\n" "----" "----" "----" "-----"

find "$DIR" -type f -not -name ".DS_Store" -print0 | sort -z | while IFS= read -r -d '' file; do
    # Get extension
    ext="${file##*.}"
    ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')

    # Get size
    size=$(du -h "$file" | awk '{print $1}')

    # Get page count for PDFs
    pages="-"
    if [ "$ext_lower" = "pdf" ]; then
        pages=$(pdfinfo "$file" 2>/dev/null | grep -i "^pages:" | awk '{print $2}' || echo "?")
    fi

    # Get type label
    case "$ext_lower" in
        pdf) type="PDF" ;;
        png|jpg|jpeg|tiff) type="IMAGE" ;;
        docx|doc) type="WORD" ;;
        xlsx|xls) type="EXCEL" ;;
        html|htm) type="HTML" ;;
        txt|eml) type="TEXT" ;;
        *) type="$ext_lower" ;;
    esac

    # Truncate filename for display
    relpath="${file#$DIR/}"
    if [ ${#relpath} -gt 58 ]; then
        relpath="...${relpath: -55}"
    fi

    printf "%-60s %-8s %-8s %-6s\n" "$relpath" "$type" "$size" "$pages"
done

echo ""
echo "=== Batch Planning ==="
echo "Recommended batches (max ~10MB per batch):"

# Estimate batches needed
LARGE_PDFS=$(find "$DIR" -iname "*.pdf" -size +5M | wc -l | tr -d ' ')
SMALL_PDFS=$(find "$DIR" -iname "*.pdf" -not -size +5M | wc -l | tr -d ' ')

echo "  Large PDFs (>5MB, read 1-2 per batch): $LARGE_PDFS"
echo "  Small PDFs (<5MB, read 5-8 per batch): $SMALL_PDFS"
echo "  Images (read 3-5 per batch): $IMG_COUNT"
echo "  Word docs (read 5-8 per batch): $DOC_COUNT"
