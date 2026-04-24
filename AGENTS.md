# AGENTS.md

## Repo Shape
- `src/` contains finalized recipe markdown.
- `test/` contains draft/WIP recipes; despite the name, it is not an automated test suite. `make test` renders PDFs for this folder.
- `runbooks/` contains multi-dish/session plans rendered with the same PDF pipeline.
- `to_convert_successful/` and `to_convert_to_try/` are PDF backlog/reference directories and are not part of the Makefile targets.

## Commands
- `make` or `make all` renders `src/`, `test/`, and `runbooks/` into `output/`.
- `make src`, `make test`, and `make runbooks` render a single top-level content directory.
- `bash scripts/markdown_to_pdf.sh --input-dir <src|test|runbooks> --output-dir output` is the direct wrapper the Makefile uses.
- `make clean` removes only `output/`.
- There is no CI, lint, formatter, or typecheck config in this repo; verification is usually a render of the directory you changed.

## PDF Pipeline Gotchas
- Use `--input-dir`, not `--dir`; `--dir` still works but prints a deprecation warning.
- The converter is directory-based only; there is no single-file wrapper in repo tooling.
- If you omit `--output-dir`, PDFs are written beside the source `.md` files. They stay untracked because `.gitignore` ignores `*.pdf`, and `make clean` will not remove them.
- Script defaults are `xelatex`, `TeX Gyre Pagella`, `1in` margins, and `gfm` input.
- `-v/--verbose` adds progress info only; the script still suppresses `pandoc` stderr, so stubborn render failures are easier to debug by running `pandoc` directly.

## Editing Content
- README is partially stale: it still mentions an `instructions/` directory that does not exist, and it omits `runbooks/` from the `make all` workflow. Trust `Makefile`, `scripts/markdown_to_pdf.sh`, and the current tree over README prose.
- For recipe structure, copy the nearest similar file in the same folder. There is no live template file in the repo.
- `src/` and `test/` recipes usually include sections like `Title & Overview`, `Tags`, `Yield & Timing`, `Grocery List`, `Equipment & Tools`, `Ingredients`, `Instructions`, and `Sources`, often with `**[pre-prep]**` markers and `**Checkpoint:**` cues.
- The corpus is not fully normalized: heading depth varies (`#` vs `##`/`###`), and `tags:` lines may be plain text or wrapped in backticks. Preserve the local style of the file you touch unless asked to normalize it.
- `tags.md` is useful but not exhaustive; existing recipes already use tags outside that list. Check nearby recipes before inventing or replacing tags.
- Prefer lowercase kebab-case for new filenames, but do not rename existing underscore-based files just for style consistency.

## Recipe Generation Pipeline

The `.opencode/` directory contains a full agentic pipeline for generating, auditing, and revising recipes.

### Agents
- `recipe-chef` — primary agent for occasion-based recipe generation (options lists, full recipes, revisions, audits). Switch to it or @-mention it for general recipe requests.
- `healthy-chef` — primary agent for healthy, batch-cook, make-ahead recipes. Applies health constraint defaults automatically. Switch to it or @-mention it for health-oriented requests.
- `recipe-researcher` — hidden subagent; handles all web research and source vetting. Delegated to by both primary agents.
- `recipe-options-writer` — hidden subagent; writes formatted options lists for recipe-chef.
- `recipe-writer` — hidden subagent; writes formatted full recipes for recipe-chef.
- `healthy-options-writer` — hidden subagent; writes formatted options lists for healthy-chef; loads healthy-lens and enforces hard avoids.
- `healthy-recipe-writer` — hidden subagent; writes formatted full recipes for healthy-chef; Nutrition Snapshot and Reheat Plan are mandatory.

### Commands
- `/recipe <request>` — routes to recipe-chef (occasion-based cooking).
- `/healthy <request>` — routes to healthy-chef (health-constrained, batch-cook cooking).

### Skills (loaded by agents at runtime)
- `recipe-craft` — format rules, templates, pre-output checklist. Backing files: `options-template.md`, `recipe-template.md`.
- `research-workflow` — full sourcing protocol, source tiers, dedup rules, comment-mining, research packet schema.
- `recipe-occasions` — occasion taxonomy and directive extraction. Backing file: `occasions-reference.md`.
- `healthy-lens` — health constraint defaults and nutrition calculation workflow. Backing files: `excludes.md`, `nutrition-calc.md`.
- `recipe-qa` — audit (7 passes) and revision workflow for all recipe artifacts.

### Feedback infrastructure
- `.lessons/research.md` — accumulated research process lessons.
- `.lessons/recipes.md` — accumulated recipe technique lessons.
- `.lessons/options.md` — accumulated options-writing lessons.
- `.lessons/workflow.md` — accumulated cross-cutting pipeline lessons.
- `.progress/` — session summaries (one file per session, `YYYY-MM-DD-<slug>.md`).

Agents read relevant `.lessons/*.md` files at session start and append new findings after completing tasks. Primary agents write `.progress/` summaries at session close.
