# Home Cooking Recipes

A curated personal cookbook with standardized recipes, naming/tagging conventions, and a simple toolchain to generate PDFs.

## What’s here
- `src/` — finalized recipes formatted to the house template (ready for PDF).
- `test/` — incoming or WIP recipes to normalize and migrate into `src/`.
- `instructions/` — authoring guidance:
	- `recipe_template.md` — canonical structure for all recipes
	- `filename_instructions.md` — rules for kebab‑case filenames
	- other notes on sourcing, healthy options, etc.
- `tags.md` — shared tag taxonomy (course, cuisine, method, time/effort, ingredients, etc.).
- `scripts/markdown_to_pdf.sh` — Pandoc + LaTeX converter for Markdown → PDF.
- `Makefile` — convenience targets to render PDFs from `src/`, `test/`, `runbooks/`, and `events/`.
- `.gitignore` — ignores `output/` and `logs/`.

## Conventions
- Filenames: lowercase kebab‑case, short and descriptive (see `instructions/filename_instructions.md`).
- Recipe structure: follow `instructions/recipe_template.md` (includes Title & Overview, Tags, Yield & Timing, Grocery List, Equipment, Ingredients, Instructions with cues, Dietary Notes, Scaling, Make‑Ahead, Variations, Troubleshooting, Sources).
- Tags: pick 3–8 from `tags.md` (lowercase, hyphen‑separated). Aim for a mix of course/cuisine, method, time/effort, and key ingredient(s).

## Typical workflow
1) Drop rough recipes into `test/`.
2) Normalize filename + content to the template; add a Tags section.
3) Migrate to `src/` when finalized.
4) Generate PDFs (see below).

## Generate PDFs
Two options: use the script directly or the Makefile.

Requirements (Linux/macOS):
- pandoc
- LaTeX with a PDF engine (recommended: `texlive-xetex` for `xelatex`)
- Optional fonts/packages for prettiness (see script warnings)

Script usage:
- `scripts/markdown_to_pdf.sh --input-dir src --output-dir output`
- `scripts/markdown_to_pdf.sh --input-dir test --output-dir output`
- `scripts/markdown_to_pdf.sh --input-dir events/2025-05-26 --output-dir output/events/2025-05-26`

Makefile shortcuts:
- `make` or `make all` — build PDFs for `src/`, `test/`, `runbooks/`, and `events/` into `output/`
- `make src` — build PDFs from `src/` into `output/`
- `make test` — build PDFs from `test/` into `output/`
- `make runbooks` — build PDFs from `runbooks/` into `output/`
- `make events` — build PDFs from `events/` into `output/events/`
- `make events SUBDIR=2025-05-26` — build PDFs from one event into `output/events/2025-05-26/`
- `make clean` — remove `output/`

The converter runs a startup check and prints clear install hints if dependencies are missing.

## Notes
- Keep recipes concise but test‑backed. Use sensory cues (look/feel/sound) in steps.
- Prefer sources with reliable timing/ratios; cite them in the Sources section.
- If you need new tags, add them thoughtfully to `tags.md`.
