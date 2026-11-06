# Write-up documents (LaTeX)

Everything for the model card and assumptions register is in this folder:

| File | What it is | Edit it? |
|---|---|---|
| `manuscript.tex` | 9-page manuscript + reproducibility appendix | yes |
| `literature_review.tex` | Literature review (19 verified papers), comparison table, gap verification, H1 | yes |
| `model_card.tex` | Model card (BN outreach ranking + Bayesian audit) | yes |
| `assumptions_register.tex` | Assumptions register (one row per assumption, status-coded) | yes |
| `contribution_statements.tex` | Template; each student fills in their own statement | yes |
| `references.tex` | Shared bibliography (every entry verified) | yes |
| `team.tex` | Names, roll numbers, contact, repository URL: shared by `writeup/`, `report/` and `slides/` | yes (roll numbers, team ID) |
| `preamble.tex` | Shared packages, the red `\TODO{}` marker, and shared facts (`\Nall`, `\epsTol`, ...) | yes |
| `tables/*.tex` | Tables generated from `../results/*.csv` | no, regenerate |
| `figures/*.png` | Copies of the notebook figures | no, regenerate |
| `make_tables.py` | Regenerates `tables/` and `figures/` from the notebook outputs | when results change |
| `build.sh` | Compiles all five PDFs plus the report and slides (tectonic, latexmk or pdflatex) | — |
| `*.pdf` | Compiled documents | — |

**Before submission:** fill the roll numbers and team ID in `team.tex` (the only remaining placeholders); `./build.sh`
then rebuilds every PDF, including `../report` and `../slides`.

**After re-running the notebook:** `./build.sh --refresh` regenerates the tables and figures and recompiles. Numbers in the
prose of `model_card.tex` and `assumptions_register.tex` are typed by hand from the notebook's findings cells, so check them
if the results change. With fixed seeds they do not change.

**Compiling:** this needs a LaTeX installation, e.g. `sudo dnf install texlive-scheme-medium latexmk`, or the single-binary
[Tectonic](https://tectonic-typesetting.github.io). Alternatively, zip this folder and upload it to Overleaf
(pdfLaTeX compiler); the main files are the five `.tex` documents listed above.
