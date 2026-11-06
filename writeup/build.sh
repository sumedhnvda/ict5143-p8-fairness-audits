#!/usr/bin/env bash
# Build the PDFs. Usage: ./build.sh            (compile only)
#                        ./build.sh --refresh  (first regenerate tables/ and figures/ from ../results and ../figures)
set -euo pipefail
cd "$(dirname "$0")"
if [[ "${1:-}" == "--refresh" ]]; then ../.venv/bin/python make_tables.py; fi
compile() {
  if command -v tectonic >/dev/null; then tectonic -X compile "$1.tex"
  elif command -v latexmk >/dev/null; then latexmk -pdf -interaction=nonstopmode "$1.tex" && latexmk -c "$1.tex"
  else pdflatex -interaction=nonstopmode "$1.tex" && pdflatex -interaction=nonstopmode "$1.tex"; fi
}
for doc in manuscript literature_review model_card assumptions_register contribution_statements; do compile "$doc"; done
(cd ../report && compile AFGML_Report)
(cd ../slides && compile AFGML_Presentation)
