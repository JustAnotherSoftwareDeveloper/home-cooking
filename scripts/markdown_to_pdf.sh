#!/usr/bin/env bash
#===============================================================================
# latex_pdf_conversion.sh — Convert Markdown files to PDF using Pandoc/LaTeX
#===============================================================================
#
# DESCRIPTION:
#   Recursively finds all *.md files in a specified directory and converts them
#   to PDF format using Pandoc with LaTeX engines. Supports customizable fonts,
#   margins, syntax highlighting, and input formats.
#
# USAGE:
#   ./latex_pdf_conversion.sh [OPTIONS]
#
# OPTIONS:
#   -d, --dir PATH        Directory to scan for Markdown files (default: current directory)
#   -f, --font FONT       Font name for PDF output (default: "TeX Gyre Pagella")
#   -m, --margin SIZE     Page margins (default: 1in)
#   -e, --engine ENGINE   LaTeX engine: xelatex, pdflatex, lualatex (default: xelatex)
#   -s, --style STYLE     Syntax highlighting style (default: kate)
#   -F, --from FORMAT     Input format (default: gfm - GitHub Flavored Markdown)
#   -v, --verbose         Enable verbose output with detailed conversion info
#   -h, --help            Show this help message
#
# EXAMPLES:
#   # Convert all .md files in current directory
#   ./latex_pdf_conversion.sh --dir .
#
#   # Convert with custom font and verbose output
#   ./latex_pdf_conversion.sh --dir docs --font "EB Garamond" --verbose
#
#   # Use different LaTeX engine and margins
#   ./latex_pdf_conversion.sh --dir articles --engine pdflatex --margin 0.75in
#
#   # Convert with custom syntax highlighting
#   ./latex_pdf_conversion.sh --dir code-docs --style github --from markdown
#
# REQUIREMENTS:
#   - pandoc (document converter)
#   - LaTeX distribution with chosen engine (texlive-xetex for xelatex)
#   - Font packages or system fonts for custom fonts
#
# OUTPUT:
#   - Creates PDF files in the same directory as source Markdown files
#   - Preserves original filename, changing .md extension to .pdf
#   - Provides progress tracking and conversion summary
#
# INSTALLATION NOTES:
#   Ubuntu/Debian: apt install pandoc texlive-xetex texlive-fonts-recommended
#   macOS: brew install pandoc mactex
#   Windows: Install MiKTeX and Pandoc
#
# AUTHOR: Created for efficient batch Markdown to PDF conversion
# VERSION: Enhanced with logging and progress tracking
#===============================================================================

set -euo pipefail

# ---------- Compatibility Check ----------
ensure_compatibility() {
  local missing=()
  local warnings=()
  
  # Check for pandoc (required)
  if ! command -v pandoc >/dev/null 2>&1; then
    missing+=("pandoc")
  fi
  
  # Check for LaTeX engines (at least one should be available)
  local has_latex=false
  for engine in xelatex pdflatex lualatex; do
    if command -v "$engine" >/dev/null 2>&1; then
      has_latex=true
      break
    fi
  done
  
  if [[ "$has_latex" == "false" ]]; then
    missing+=("LaTeX engine (xelatex, pdflatex, or lualatex)")
  fi
  
  # Check for common LaTeX packages (optional but recommended)
  if command -v kpsewhich >/dev/null 2>&1; then
    for pkg in geometry hyperref fontspec; do
      if ! kpsewhich "$pkg.sty" >/dev/null 2>&1; then
        warnings+=("LaTeX package '$pkg' not found (recommended)")
      fi
    done
  else
    warnings+=("kpsewhich not found - cannot verify LaTeX packages")
  fi
  
  # Report results
  if [[ ${#missing[@]} -gt 0 ]]; then
    echo "ERROR: Missing required dependencies:" >&2
    echo >&2
    for item in "${missing[@]}"; do
      echo "  ✗ $item" >&2
    done
    echo >&2
    echo "Installation instructions:" >&2
    echo "  Ubuntu/Debian: sudo apt install pandoc texlive-xetex texlive-fonts-recommended" >&2
    echo "  Fedora/RHEL:   sudo dnf install pandoc texlive-xetex texlive-collection-fontsrecommended" >&2
    echo "  macOS:         brew install pandoc mactex" >&2
    echo "  Arch:          sudo pacman -S pandoc texlive-core texlive-fontsrecommended" >&2
    echo >&2
    exit 1
  fi
  
  # Show warnings if any
  if [[ ${#warnings[@]} -gt 0 ]]; then
    echo "WARNING: Optional components missing:" >&2
    for item in "${warnings[@]}"; do
      echo "  ⚠ $item" >&2
    done
    echo >&2
  fi
  
  return 0
}

# Run compatibility check before proceeding
ensure_compatibility

# ---------- Defaults ----------
INPUT_DIR="."
OUTPUT_DIR=""
FONT="TeX Gyre Pagella"
MARGIN="1in"
ENGINE="xelatex"
STYLE="kate"
FROM="gfm"
VERBOSE="false"

# ---------- Arg parse ----------
while [[ $# -gt 0 ]]; do
  case "$1" in
    -d|--input-dir)
      INPUT_DIR="${2:-.}"; shift 2 ;;
    --dir)
      # Backward compatibility shim
      echo "[deprecation] --dir is deprecated; use --input-dir" >&2
      INPUT_DIR="${2:-.}"; shift 2 ;;
    -o|--output-dir)
      OUTPUT_DIR="${2}"; shift 2 ;;
    -f|--font)
      FONT="${2}"; shift 2 ;;
    -m|--margin)
      MARGIN="${2}"; shift 2 ;;
    -e|--engine)
      ENGINE="${2}"; shift 2 ;;
    -s|--style)
      STYLE="${2}"; shift 2 ;;
    -F|--from)
      FROM="${2}"; shift 2 ;;
    -v|--verbose)
      VERBOSE="true"; shift ;;
  -h|--help)
      cat << 'EOF'
Markdown → PDF Conversion Script (Pandoc + LaTeX)

USAGE:
  ./markdown_to_pdf.sh [OPTIONS]

OPTIONS:
  -d, --input-dir PATH  Directory to scan for Markdown files (default: current directory)
  -o, --output-dir PATH Directory to write PDFs (default: alongside source files)
    -f, --font FONT       Font name for PDF output (default: "TeX Gyre Pagella")
    -m, --margin SIZE     Page margins (default: 1in)
    -e, --engine ENGINE   LaTeX engine: xelatex, pdflatex, lualatex (default: xelatex)
    -s, --style STYLE     Syntax highlighting style (default: kate)
    -F, --from FORMAT     Input format (default: gfm - GitHub Flavored Markdown)
    -v, --verbose         Enable verbose output with detailed conversion info
    -h, --help            Show this help message

EXAMPLES:
    # Convert all .md files in current directory
  ./markdown_to_pdf.sh --input-dir .

    # Convert with custom font and verbose output
  ./markdown_to_pdf.sh --input-dir docs --font "Liberation Serif" --verbose

    # Use different LaTeX engine and margins
  ./markdown_to_pdf.sh --input-dir articles --engine pdflatex --margin 0.75in

    # Convert with custom syntax highlighting
  ./markdown_to_pdf.sh --input-dir code-docs --style github --from markdown

  # Write all PDFs to a separate build directory, preserving subfolders
  ./markdown_to_pdf.sh --input-dir docs --output-dir output/pdf

COMMON FONTS:
    - "Liberation Serif" (usually available)
    - "DejaVu Serif" (common on Linux)
    - "Times New Roman" (Windows/macOS)
    - "TeX Gyre Pagella" (requires texlive-fonts-extra)

SYNTAX HIGHLIGHTING STYLES:
    kate, github, pygments, tango, espresso, zenburn, haddock, monochrome

INPUT FORMATS:
    gfm (GitHub Flavored Markdown), markdown, markdown_strict, commonmark

REQUIREMENTS:
    - pandoc
    - LaTeX distribution (texlive-xetex for xelatex)
    - Font packages for custom fonts

EOF
      exit 0 ;;
    *)
      echo "Unknown option: $1"
      echo "Run with --help for usage."
      exit 1 ;;
  esac
done

# ---------- Basic checks ----------
[[ -d "$INPUT_DIR" ]] || { echo "Directory not found: $INPUT_DIR"; exit 1; }
if [[ -n "$OUTPUT_DIR" ]]; then
  mkdir -p "$OUTPUT_DIR"
fi

echo "Converting Markdown → PDF"
echo "  input  : $INPUT_DIR"
echo "  output : ${OUTPUT_DIR:-(source directories)}"
echo "  font   : $FONT"
echo "  margin : $MARGIN"
echo "  engine : $ENGINE"
echo "  style  : $STYLE"
echo "  from   : $FROM"
echo

# ---------- Conversion ----------
# Find all *.md (recursive), handle spaces safely
echo "Scanning for Markdown files in $INPUT_DIR..."
total_files=$(find "$INPUT_DIR" -type f -name '*.md' | wc -l)
echo "Found $total_files Markdown file(s) to convert"
echo

current=0
failed=0
success=0

while IFS= read -r -d '' f; do
  current=$((current + 1))
  if [[ -n "$OUTPUT_DIR" ]]; then
    # Build output path preserving relative structure under OUTPUT_DIR
    rel_path="${f#${INPUT_DIR%/}/}"
    out="$OUTPUT_DIR/${rel_path%.md}.pdf"
    mkdir -p "$(dirname "$out")"
  else
    out="${f%.md}.pdf"
  fi
  
  printf "[%d/%d] Converting: %s\n" "$current" "$total_files" "$(basename "$f")"
  
  if [[ "$VERBOSE" == "true" ]]; then
    echo "  Input:  $f"
    echo "  Output: $out"
  fi
  
  if pandoc "$f" -o "$out" \
    --pdf-engine="$ENGINE" \
    --from="$FROM" \
    --highlight-style="$STYLE" \
    -V "mainfont=${FONT}" \
    -V "geometry:margin=${MARGIN}" 2>/dev/null; then
    echo "✓ SUCCESS: $(basename "$out")"
    success=$((success + 1))
  else
    echo "✗ FAILED: $(basename "$f")"
    failed=$((failed + 1))
    [[ "$VERBOSE" == "true" ]] && echo "  Check that pandoc, $ENGINE, and font '$FONT' are installed"
  fi
  echo
done < <(find "$INPUT_DIR" -type f -name '*.md' -print0)

echo "==================== SUMMARY ===================="
echo "Total files: $total_files"
echo "Successful: $success"
echo "Failed: $failed"
echo "=================================================="

echo
echo "Done."
