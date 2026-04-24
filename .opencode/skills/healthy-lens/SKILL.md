---
name: healthy-lens
description: Health constraint defaults, hard avoids, soft blockers, macro and sodium targets, and nutrition calculation workflow for healthy-chef artifacts.
compatibility: opencode
---

# Skill: healthy-lens

Applies health constraint filtering and nutrition calculation workflow to all healthy-chef outputs.

Load this skill at the start of every healthy-chef session. After loading, read the backing files using the skill base directory shown above.

---

## Backing files

- `excludes.md` — constraint defaults: hard avoids, soft blockers, health orientation rules, ancestry-risk layer, macro defaults, sodium targets, fat management, aromatic replacements.
- `nutrition-calc.md` — source hierarchy (Tiers 1-6), daily values reference, per-field workflow, Added sugars derivation (Roles A-D), no-hard-stop rule, sub-recipe handling.

Read both before drafting any options list or recipe for healthy-chef.

---

## When this skill applies

- Any request routed to healthy-chef.
- Any task prompt that includes health constraints, dietary restrictions, batch-cook / make-ahead requirements, or nutrition output.
- Audit tasks for healthy-chef artifacts (used alongside `recipe-qa` skill).

---

## Constraint application workflow

### Step 1: Recover user-stated overrides
Before applying defaults, scan the conversation for any user override or exception stated in this session. User overrides win over defaults. Record overrides explicitly in the pre-output constraint block (internal-only; do not emit).

### Step 2: Apply hard avoids (no exceptions without explicit user request)
- Chocolate
- Meaningful garlic
- Meaningful onion
- Meaningful mushroom
- Fava / broad beans (conditional hard stop; see `excludes.md §2l`)
- Poultry as main course protein (unless user explicitly requests it)
- Non-freezer-friendly protein as main course protein (unless user explicitly requests it)

Trace-only exception policy: a hard-avoid ingredient may appear at trace level only when it is not a flavor base, bulk ingredient, or texture contributor. Disclose clearly; do not hide.

### Step 3: Apply soft blockers
Treat as down-ranked / avoided unless user requests otherwise:
- Lactose-heavy dairy (milk, half-and-half, cream-heavy bases, evaporated milk, condensed milk, large amounts of fresh soft cheese)
- Gluten grains (wheat, barley, rye, spelt, farro, bulgur, couscous, malt, wheat-based soy sauce)
- Extreme chile heat beyond warm/medium baseline

Preferred path: use lower-lactose dairy (yogurt, aged cheese, lactose-free products) and non-gluten starches (rice, potatoes, cornmeal, legumes) when the dish supports them.

### Step 4: Apply batch and portioning defaults
- Default yield: 10 portions.
- Portioning schema: volumetric dishes in ~2-cup containers; non-volumetric in meal-sized portions; non-cup-friendly in packaged meal-sized units. See `excludes.md §1` for full schema.
- Eating horizon: 3-5 days fridge + remainder frozen (months).
- Freezer-friendliness is a primary design goal.
- Make-ahead required; freezer plan required (freeze point, packaging, thaw, reheat correction).

### Step 5: Apply macro and sodium defaults
- Protein-forward relative to carbs.
- Fiber via legumes, vegetables, optional whole grains.
- Added sugar minimal; avoid sugar-forward sauces as primary driver.
- Sodium-aware: technique first; identify top 3 sodium drivers; provide 2-4 sodium levers in recipe output. See `excludes.md §4c` for level definitions and required behavior.
- Fat managed: prefer mono/polyunsaturated fats; 1-3 major fat sources with distinct purposes; no oil slicks or heavy-cream bases.
- Avocado oil is the default cooking oil.

### Step 6: Apply aromatic replacement bias
When garlic and onion are excluded, recover flavor with: ginger, celery or fennel (when structurally appropriate), citrus zest, herbs, toasted spices, tomato paste, browned meat or veg fond.

Scallion greens and chives are conditional-only: use them only when the current session explicitly confirms tolerance.

### Step 7: Pre-output constraint QA
Run the QA checklist in `excludes.md §5` before finalizing any deliverable. Do not emit until all checklist items pass or deviations are explicitly acknowledged.

---

## Nutrition Snapshot workflow

Required for all recipe artifacts from healthy-chef.

Workflow summary (full detail in `nutrition-calc.md`):
1. Confirm serving definition (yield and grams per serving).
2. Classify each ingredient by Added sugars role (A/B/C/D).
3. Match each ingredient to the best source tier (Tier 1 = USDA Foundation Foods; Tier 2 = manufacturer; Tier 3 = USDA Branded; Tier 4 = USDA FNDDS/SR Legacy; Tier 5 = yield/drained corrections; Tier 6 = public calculators).
4. Normalize quantities; apply yield/drained/edible corrections when materially relevant.
5. Compute per-ingredient contributions; sum to recipe totals; divide by servings.
6. Populate Nutrition Snapshot tables (core label + vitamins/minerals).
7. Add Nutrition Provenance subsection.

No-hard-stop rule: if a single field is unresolvable, set to NA and continue. Never drop the entire snapshot.

NA rule: a recipe-level nutrient row is numeric only when all ingredient contributions for that nutrient are numeric. If any ingredient is unresolved after tier exhaustion, the recipe-level row is NA.

Daily Values reference and %DV display rules: see `nutrition-calc.md §Daily Values Reference`.

---

## Authoritative cross-references

- Template format (options list and recipe): `recipe-craft` skill -> `options-template.md` and `recipe-template.md`
- Research and sourcing: `research-workflow` skill
- Equipment inventory: `projects/healthy_recipes/equipment.md`
- Tag vocabulary: `projects/healthy_recipes/tags.md`
