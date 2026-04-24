---
name: recipe-occasions
description: Translates an occasion selection (base + optional modifiers) into concrete directives that drive options list and recipe output for recipe-chef.
compatibility: opencode
---

# Skill: recipe-occasions

Translates an occasion selection (base + optional modifiers) into concrete directives that drive options list and recipe output.

Load this skill when handling any recipe-chef request. After loading, read the backing file using the skill base directory shown above.

---

## Backing file

- `occasions-reference.md` — full taxonomy: base occasions, setting modifiers, service style modifiers, and menu shape modifiers. Each entry defines: optimize, avoid, assumptions, options-directives, recipe-directives, and common-modifiers.

Read `occasions-reference.md` before extracting directives.

---

## When this skill applies

- Any request routed to recipe-chef that involves a named or implied social context, event, or serving scenario.
- When the user does not name an occasion, infer the most plausible base from context and state the assumption explicitly.

---

## Occasion selection workflow

### Step 1: Select one base occasion
Choose the single best match from `occasions-reference.md`. Common bases:
- Everyday: `weeknight-dinner`, `meal-prep-batch`
- Two-person: `date-night`, `cozy-night-in`, `movie-night`, `cook-together`
- Small social (4-8): `small-gathering-4-8`, `dinner-with-friends-4-8`
- Large social (10-25): `party-10-25`, `cocktail-party-10-25`, `open-house-10-25`
- Logistics-heavy: `bring-over`, `picnic`, `tailgate`, `limited-infrastructure`
- Seasonal: `hot-weather`, `cold-weather`, `grilling-season`

If no occasion is named: state your assumption (e.g., "Treating this as weeknight-dinner — let me know if a different context applies").

### Step 2: Add 0-3 modifiers (only if clearly warranted)
- 0-1 setting modifier: `setting-outdoor`
- 0-1 service style modifier: `service-buffet`, `service-grazing-table`, `service-passed-bites`
- 0-1 menu shape modifier: `menu-board-and-bites`, `menu-one-warm-anchor`, `menu-dessert-forward`

Keep modifiers minimal. More than 2 total modifiers usually signals the base is wrong.

### Step 3: Extract directives
For the selected base (and each modifier), extract:
- **optimize** — what to design toward
- **avoid** — what to exclude from options/recipe design
- **assumptions** — serving count, service style, duration, equipment context
- **options-directives** — specific priorities for options list generation
- **recipe-directives** — specific requirements for recipe output

Merged directives: when a modifier's directives conflict with the base, the modifier takes precedence for its declared axis (setting, service, or menu shape). Base assumptions (servings) override modifier assumptions unless the modifier explicitly states a change.

### Step 4: Apply directives in output
- Options list: honor options-directives in shortlist selection and Why it fits line.
- Recipe: honor recipe-directives in method choices, make-ahead notes, and hold/reheat guidance.
- Do not emit the directive extraction block. It is internal-only.

---

## Directive injection rules

### Options list (why-it-fits)
Each shortlist entry's **Why it fits** line must reference at least one specific directive from the active occasion (optimize/avoid/assumptions/options-directives axis and equipment-fit). Vague statements ("good for this occasion") do not satisfy this requirement.

### Full recipe
Active recipe-directives translate into required recipe sections:
- Service plans, hold strategies, reheat notes, staging plans, scaling notes, portion guidance, and packing/transport instructions are required whenever the active occasion's recipe-directives call for them.
- If the recipe-directive requires it but the dish cannot support it, explain why and offer the closest alternative.

---

## Authoritative cross-references

- Template format: `recipe-craft` skill -> `options-template.md` and `recipe-template.md`
- Research: `research-workflow` skill
- Audit: `recipe-qa` skill
