---
name: recipe-craft
description: Format rules, templates, and pre-output checklist for producing correct options lists and full recipe artifacts.
compatibility: opencode
---

# Skill: recipe-craft

How to produce correct, well-structured recipe outputs (options lists and full recipes).

Load this skill before writing any options list or full recipe. After loading, read the appropriate backing template file using the skill base directory shown above.

---

## Backing template files

Two canonical template files live in this skill directory. Read the appropriate one before drafting output:

- `options-template.md` — canonical options list format (shared between recipe-chef and healthy-chef)
- `recipe-template.md` — canonical recipe format (shared; Nutrition Snapshot and Reheat Plan are required for healthy-chef, optional for recipe-chef)

To read them, use the absolute path constructed from this skill's base directory:
- `<skill_base_dir>/options-template.md`
- `<skill_base_dir>/recipe-template.md`

---

## Authoritative references (do not restate rules here)

- Research, sourcing, comment-mining, source tiers: `research-workflow` skill
- Occasion taxonomy and directives: `recipe-occasions` skill
- Health constraints and excludes: `healthy-lens` skill
- Nutrition calculation: `healthy-lens` skill -> `nutrition-calc.md`
- Equipment inventory and fit rules: `projects/recipes/equipment.md` (or `projects/healthy_recipes/equipment.md`)
- Tag vocabulary: `projects/recipes/tags.md`

---

## Emission policy (applies to all output)

### Internal-only sections (compute but do NOT emit)
- Occasion/constraint extraction
- Research execution and research outputs
- Breadth scan
- Internal synthesis (decisions, tradeoff reasoning)

### Emitted sections
Emit only what the template specifies. Do not add sections not defined by the template.

---

## Pre-output checklist

Before finalizing any deliverable:
- Does it honor selected occasion directives (optimize/avoid) or health constraint defaults?
- Are the top failure modes guarded against in Watch lines (options) or recipe technique?
- Are citations/URLs handled exactly per the target template?
- Is the output "pure" (no meta-instructions, no template rule restatements inside the recipe/options text)?
- Are tags drawn from `tags.md` vocabulary; count within limits (3-5 for options entries, 3-8 for full recipes)?
- Do all in-text [n] footnote markers resolve to Sources section entries?

---

## Key format rules (supplement to template files)

### Markdown and character set
- Plain Markdown; ASCII characters only.
- No emojis or Unicode punctuation.
- Temperatures: write "425 deg F" (no degree symbol).
- Regular hyphens "-", straight quotes, and apostrophes.

### Units
- U.S. customary units by default.
- Metric in parentheses only if the source provides it.
- For precision-critical small items (salt, leaveners): include grams in parentheses.

### Footnotes and URLs
- All in-text factual claims that rely on sources use numeric markers [n].
- Do NOT embed raw URLs anywhere except the Sources section.
- Do NOT use Markdown links outside Sources.
- Sources section: numbered entries matching in-text markers; format per template.

### Bolding
- Bold cooking verbs, heat/temp phrases, and one key endpoint phrase per step.
- Bold field labels in options entries (Description:, Watch:, Why it fits:).
- Do not bold whole sentences.

### No inference rule
- Do not fill in missing measurable parameters from intuition.
- A parameter may only be used if it appears in a primary source, or is corroborated by at least 2 independent sources, or is clarified by creator replies corroborated by at least one other source.
- If it cannot be validated: leave it as an open question or an explicitly uncertain variation.

---

## Source counts by mode (targets from research-workflow skill)

- Options mode: 20-35 candidate pool; 8-12 distinct source families in final evidence set.
  - healthy-chef: 15-25 candidate pool; 5-8 source families.
- Recipe mode: 12-20 pool; 6-9 families.
  - healthy-chef: 10-14 pool; 5-7 families.
- Revisions mode: 10-20 pool; 6-10 families.
  - healthy-chef: 8-15 pool; 5-7 families.

---

## Tags (reference rules)

- Count limits: options shortlist entry = 3-5 tags; full recipe = 3-8 tags.
- Selection: 1-2 course/cuisine, 0-1 diet (only if user requested), 1 method, 1 time/effort, 0-2 key-ingredient.
- All tags: lowercase, hyphen-separated; select from `tags.md` vocabulary only.
