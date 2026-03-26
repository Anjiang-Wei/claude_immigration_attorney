# Scripts

Utility scripts for document processing. Used by `document-summary-arrangement` and the petition skills.

## Setup

```bash
./scripts/setup.sh
```

Installs required dependencies: `poppler` (PDF tools), `textutil` (macOS built-in).

## Scripts

| Script | What It Does |
|--------|-------------|
| `setup.sh` | Installs dependencies |
| `pdf-to-text.sh` | Extracts text from a PDF (falls back to image conversion if scanned) |
| `pdf-to-images.sh` | Converts PDF pages to PNG images for multimodal reading |
| `scan-collection.sh` | Scans a directory of documents and reports file types, sizes, and page counts |
