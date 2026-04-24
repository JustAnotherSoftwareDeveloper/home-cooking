---
name: recipe-qa
description: Audit and revision workflow for all recipe artifacts: 7 passes, severity model, issue format, corrected re-emit rules, and revisions workflow.
compatibility: opencode
---

# Skill: recipe-qa

Audit and revision workflow for all recipe artifacts (options lists, full recipes, revised recipes).

Load when performing an audit or recipe revision. This skill covers both recipe-chef (general) and healthy-chef artifacts; agent-specific differences are called out inline.

---

## 1) Triggers and output modes

### Artifact-type detection (required first step)
Before running any pass, identify what is being audited:
- **Options artifact**: conforms to `options-template.md` shortlist structure.
- **Recipe artifact**: conforms to `recipe-template.md` structure.
- **Revisions artifact**: contains a diagnosis + updated recipe.
- **Unknown / mixed**: treat as recipe artifact by default; state the assumption in the output.

### Output modes
- **Issue list only**: output all issues in severity order; do not re-emit the artifact.
- **Corrected re-emit**: apply fixes and output the full corrected artifact in canonical format.
- Default (no explicit preference stated): issue list only.

---

## 2) Pre-audit intake

Before running any pass, recover the thread constraint set from conversation history:
- Selected option or variation (if locked).
- Equipment limits and pan/tray count.
- **[healthy-chef]** Health constraint overrides stated by the user (overrides to `healthy-lens/excludes.md` defaults).
- Ingredient-source constraints (brands, origins, exclusions).
- Format requests (ordering, naming, length, special sections).
- Rejected paths that must not reappear (techniques, ingredients, formats).
- Any explicit user overrides or exceptions to defaults.

Record which constraints are recoverable. Flag any that are ambiguous. These drive Pass 2.

---

## 3) Required audit passes

Run all passes in order. Do not skip a pass. Record "no issues found" only after completing all checks.

---

### Pass 1 -- Template compliance

Verify the artifact satisfies all required structural rules for its type.

**Options artifact** -- check against `options-template.md`:
- Required inputs section present; all fields filled (Title & Goal, Context & Constraints including Serves, Time, Equipment, Allergies/avoidances).
- Shortlist: 5-8 entries. Runner-Ups: 5-10 entries.
- Each shortlist entry:
  - Level-4 header with option name, tags (3-5), format, active time estimate, and effort level.
  - **Description** addresses all 4 sub-points: what the dish is, what it eats like, what makes it distinct from the other shortlisted options, and one familiar comparison when the dish may be unfamiliar.
  - **Flavor profile** present with richness, acidity, heat, notes, and texture fields.
  - **Make-ahead** and **Hold/Reheat** lines present.
  - **Watch** line derived from research outputs (specific failure mode or guardrail); not generic filler.
  - **[recipe-chef]** **Why it fits** references at least one specific occasion directive (optimize/avoid/assumptions/options-directives) and equipment-fit.
  - **[healthy-chef]** **Why it fits** references at least one health constraint or user constraint and equipment-fit.
  - **Source** field present per option.
- Pick First / If You Want section present.
- Internal-only workflow sections not visible in final output unless user explicitly requested them.
- Sources section present only if external browsing was performed; absent (not placeholder) if no browsing occurred.

**Recipe artifact** -- check against `recipe-template.md`:
- Required sections present and in canonical order: Title & Overview, Tags, Yield & Timing, Grocery List, Equipment & Tools, Ingredients, Allergy & Dietary Notes, Quick Overview, Instructions, Common Issues, Make-Ahead Notes, Troubleshooting, (Variations if present), Sources.
- **[healthy-chef only]** Additional required sections: Reheat Plan (first-class section, not merged into Make-Ahead Notes; includes best method, texture reset cue, and at least one reheat failure branch) and Nutrition Snapshot (per serving).
- Tags: 3-8 tags; lowercase, hyphen-separated; drawn from `tags.md` vocabulary where applicable.
- Yield & Timing: all five time fields present (Active Prep, Inactive Prep / Hands-Off, Cook, Total, Make-ahead).
- Grocery List: every ingredient exactly once under a correct category; no empty categories.
- Equipment & Tools: uses `equipment.md` item names; lists critical tools first; pan-color and glass-vs-metal calibration notes present when relevant.
- Gather & Stage section present as a standalone section immediately before numbered instructions, with a Checkpoint bullet; numbered steps begin at 1; minimum 4 numbered steps; every heat step includes heat level or oven temp + time range + sensory cue; minimum 2 branch sub-bullets in "If X -> do Y -> cue it's fixed" form; Taste-adjust loop present in the final step.
- Troubleshooting: 2-4 entries; arrow format (Symptom -> Likely cause -> Primary fix -> Recovery cue).
- Variations: 2-4 entries, each 1-2 sentences; no sub-bullets.
- **[healthy-chef]** Nutrition Snapshot present and uses the table format from `recipe-template.md`:
  - Nutrition Label Core and all Vitamins and Minerals tables present.
  - All rows including fat sub-type rows and fiber sub-type rows present (NA acceptable; rows must not be omitted).
  - Source basis column populated per row or tightly grouped row set.
  - Nutrition Provenance subsection present.
  - No invented numbers; NA used only for amounts unresolvable after source-tier escalation; -- used for %DV when not displayed.
  - Calculator output does not outrank a cleaner ingredient-level source stack.
  - Added sugars follows Role A/B/C/D rules in `nutrition-calc.md`; not inferred from Total sugars for Role D or ambiguous ingredients.
  - **[healthy-chef]** Diet toggles present in Allergy & Dietary Notes when relevant.

**Revisions artifact** -- check against the revisions workflow in this skill (see §Revisions workflow below):
- Failure classification stated (1-3 failure classes from the taxonomy).
- Locked decisions and constraint carry-forward listed before proposed changes.
- Root-cause hypotheses present with confidence levels (minimum Hypothesis A; each implies a falsifiable test).
- Every proposed change maps explicitly to Hypothesis A or B; unmapped changes are flagged.
- Diagnosis Summary + What Changes and Why sections both present.
- Updated Recipe is a full drop-in in `recipe-template.md` format and contains: inventory-aware equipment list, explicit geometry limits, explicit covered/uncovered and reduction plan, Gather & Stage section, Troubleshooting entries for the observed failure mode.
- **[healthy-chef]** Updated Recipe also contains: Reheat Plan, Nutrition Snapshot.

---

### Pass 2 -- Carry-forward

Verify all locked thread constraints recovered in §2 are preserved in the artifact.

Checks:
- **Selected option/variation**: artifact is consistent with the chosen option; rejected variations do not reappear as core methods.
- **Equipment limits and pan/tray count**: no item exceeds on-hand inventory without a compliant substitution documented inline.
- **[healthy-chef]** **Health constraint defaults**: hard avoids (chocolate, meaningful garlic, meaningful onion, meaningful mushroom, fava/broad beans) do not appear anywhere including Variations; poultry is not the main course protein unless user explicitly requested it; non-freezer-friendly protein is not the main course protein unless user explicitly requested it; health orientation defaults honored unless user stated an override; lactose-heavy dairy and gluten grains treated as soft blockers.
- **[healthy-chef]** **User-stated health overrides**: any constraint the user explicitly relaxed is applied and traceable.
- **Ingredient-source constraints**: user-specified brands, origins, or exclusions honored; no silent substitution.
- **Format requests**: section ordering, naming conventions, output length match user-stated preferences.
- **Rejected paths**: techniques, ingredients, or formats the user explicitly rejected do not reappear anywhere, including Variations.

Any silent deviation from a locked constraint is at minimum a Major issue.

---

### Pass 3 -- Source quality

Verify the sources section against `research-workflow` skill.

Checks:
- **[recipe-chef]** Mode-specific source-family minimum met: options = 8-12 families; recipe = 6-9; revisions = 6-10.
- **[healthy-chef]** Mode-specific source-family minimum met: options = 5-8 families; recipe = 5-7; revisions = 5-7.
- Required source-type mix: 2+ Tier 1 individual creators (distinct people/handles), 1+ long-form blog/personal site, 1+ video/social source, 1+ discussion/feedback-loop source (forum thread or substantial comment section with troubleshooting).
- Regional Anchor present when the dish has clear regional/cultural provenance.
- Strict dedup rules followed (same creator across platforms, same domain/author, same publication network, mirrored content = one family).
- No invented citations or non-verifiable URLs.
- All in-text [n] markers resolve to numbered Sources entries; no orphaned markers.
- Baseline recipe sites marked [secondary]; none used as sole basis for flavor profile or cultural framing.
- If browsing was not available: sources section absent (options) or citations/URLs properly omitted (recipe/revisions); no fabricated sources.
- **[healthy-chef]** Nutrition tool citations appear in Sources (marked `type: tool`) only when the tool materially contributed to the Nutrition Snapshot.

Flag any invented or unverifiable citation as Critical.

---

### Pass 4 -- Equipment fit and geometry

Checks:
- Every tool in Equipment & Tools exists in `equipment.md` inventory, or has a compliant substitution documented inline.
- Substitution hierarchy: on-hand preferred -> common household substitute -> purchase recommendation only when justified (cannot physically do the task; repeated quality failures likely; high ROI for frequent use; result is meaningfully easier/safer/more repeatable).
- Pan-color and material calibration applied: dark metal in place of light -> reduce oven temp ~25 deg F or check doneness 5 min early; glass in place of metal -> expect slower edge browning, longer heat retention, may need 5-10 extra minutes.
- Batch depth and crowding limits explicit when method creates crowding risk.
- Covered/uncovered and reduction plan explicit when method requires evaporation or moisture management.
- Vessel capacity consistent with stated yield (Instant Pot 6 QT max fill; stand mixer bowl ~5 QT; bread maker 2 lb loaf max).
- Tools with status `avoid-unless-necessary` or `retired` have explicit justification.
- Ceramic nonstick not specified for high-heat searing or broiling (hard constraint).

---

### Pass 5 -- Timing plausibility

Checks:
- Active Prep + Inactive / Hands-Off + Cook =~ Total (within +-10 minutes; flag larger discrepancies).
- Time ranges in each instructional step are plausible for the stated method, heat level, vessel size, and portion count.
- Parallel tasks (While X cooks, do Y) are achievable within stated Active Prep time.
- Sensory cues align with the stated time range.
- If the dish has a well-established timing norm, flag outliers that are unexpectedly short or long without explanation.
- Make-ahead hold times within accepted safe storage windows; freeze durations plausible.
- **[healthy-chef]** Reheat Plan times consistent with stated method and portion quantity.
- Rest times for proteins and baked goods present where they materially affect texture or carryover cooking.

---

### Pass 6 -- Internal contradiction

Checks:
- **Ingredient list vs. Instructions**: every ingredient used in instructions appears in Ingredients; every Ingredients item is used in instructions.
- **Ingredients vs. Grocery List**: every ingredient exactly once in Grocery List under a plausible category; no duplicates, missing items, or Grocery List items absent from Ingredients.
- **Temperature and heat references**: oven temp in Equipment & Tools or Yield & Timing matches instructions; no two steps specify conflicting temps for the same phase.
- **Yield vs. vessel capacity**: stated yield achievable in listed vessel without exceeding fill limits.
- **Troubleshooting vs. Instructions**: troubleshooting entries do not contradict the method they supplement.
- **Allergy & Dietary Notes**: Contains list consistent with actual Ingredients; no undisclosed allergen.
- **[healthy-chef]** **Diet toggles vs. Ingredients**: if a toggle describes a swap, it must be coherent with the base ingredient list.
- **Common Issues vs. Troubleshooting**: the two sections do not flatly contradict each other on the same symptom.
- **Variations**: no variation silently contradicts a locked constraint or core method the user selected.
- **[healthy-chef]** No variation introduces a hard-avoid ingredient from `healthy-lens/excludes.md`.
- **[healthy-chef]** **Reheat Plan vs. Make-Ahead Notes**: the two sections do not contradict each other on storage windows, reheat temperatures, or method.

---

### Pass 7 -- User-request and constraint compliance

Checks:
- Every direct user request is reflected in the artifact, or its absence is acknowledged with a reason.
- No excluded ingredient, technique, equipment item, or flavor direction reappears anywhere, including Variations.
- **[recipe-chef]** Occasion directives from `recipe-occasions` skill honored: the optimize and avoid axes are visible in method choices, framing, and sequencing.
- **[healthy-chef]** Health constraint defaults honored: hard avoids absent; sodium-aware choices present (top sodium drivers identified and/or sodium levers included); fat management approach consistent with `healthy-lens/excludes.md §4d`; make-ahead path present; batch size consistent with defaults (10 portions unless user states otherwise).
- **[healthy-chef]** User-stated health overrides applied and deviation acknowledged.
- If the user requested deep research: sources section reflects the mode-appropriate source-family minimum; a shallow evidence base is a Major issue.
- Make-ahead preference reflected in Make-Ahead Notes; mismatch is at least a Minor issue.
- **[healthy-chef]** Nutrition Snapshot present in recipe artifacts; NA used only for amounts unresolvable after source-tier escalation; -- used for %DV when not displayed; provenance internally consistent.

---

## 4) Severity model

| Severity | Definition |
|---|---|
| **Critical** | Likely causes a cook failure, creates a safety risk, [healthy-chef] violates a hard health constraint, or directly violates an explicit user constraint. Fix is mandatory before re-emit. |
| **Major** | High risk of reliability failure, strong inconsistency, silent constraint violation, or [healthy-chef] silent health-constraint violation. Fix is strongly recommended. |
| **Minor** | Clarity gap, suboptimal phrasing, or low-failure-risk inconsistency. Fix improves output quality but does not block cooking. |

A single root cause may produce multiple visible symptoms. Group related symptoms under one issue ID when they share a single fix.

---

## 5) Issue format

```
ISSUE-[N]
Severity:       [Critical | Major | Minor]
Pass:           [Pass 1-7 and label]
Location:       [Section > subsection or step]
Problem:        [1-2 sentences: what is wrong; found vs. expected]
Why it matters: [1 sentence: likely consequence if unfixed]
Required fix:   [Specific and actionable; reference the authority source when the rule lives there]
```

Do not use vague language. Name the specific value, field, or rule that is violated.

---

## 6) Corrected re-emit rules

1. Apply all Critical fixes without exception.
2. Apply all Major fixes without exception.
3. Apply Minor fixes only when they do not reduce clarity, change the dish's method intent, or conflict with a locked constraint.
4. Re-emit the full artifact in canonical format per its target template.
5. Do not include audit chain-of-thought, issue list, pre-audit intake notes, or internal-only workflow sections in the re-emitted artifact.
6. After the re-emitted artifact, append exactly one summary line: `[N Critical, N Major, N Minor fixes applied; N Minor issues noted but not applied.]`

---

## 7) Audit completion checklist

- [ ] Artifact type identified and stated.
- [ ] Thread constraints recovered (§2 Pre-Audit Intake).
- [ ] All 7 passes completed; none skipped.
- [ ] Each issue has: ID, severity, pass label, location, problem, why-it-matters, required fix.
- [ ] Issues ordered: Critical first, Major second, Minor last.
- [ ] If re-emit requested: corrected artifact is full, in canonical format, and contains no audit artifacts.
- [ ] Fix summary line appended after re-emit.

---

## Revisions workflow

Use this when a dish cooked wrong or tasted off. Goal: diagnose root causes, corroborate fixes, and output a corrected recipe the user can cook immediately.

### Step 0: Intake requirements
Minimum needed:
- Recipe markdown (preferred), or short dish description.
- What went wrong (1-2 lines).
- Any swaps/changes made.

Helpful if available: pan/pot size and material, covered/uncovered timing, approx thickness/layer depth, whether the issue happened fresh, on reheat, or both.

Ask follow-ups only when ambiguity blocks a reliable fix.

### Step 1: Classify the failure (pick 1-3)
- Doneness/timing: undercooked center, overcooked edges, too slow/fast.
- Texture/structure: dry, watery, greasy, split, dense, gummy.
- Flavor balance: too salty, bland, too sour/sweet/bitter.
- Workflow/complexity: too many pans, fragile timing, hard coordination.
- Equipment/geometry: wrong vessel size/material, crowding, batch depth mismatch.
- Substitution breakage: swaps that changed structure, emulsions, moisture, or seasoning.

### Step 2: Locked decisions carry-forward (required)
List and preserve thread-level constraints before proposing fixes:
- selected option/variation, equipment limits, pan/tray count, ingredient-source constraints, format requests, rejected paths.
- **[healthy-chef]** Also carry forward health constraint defaults and user-stated overrides.

If a proposed fix conflicts with a locked decision: provide a compliant alternative, or call out the conflict and ask for explicit permission.

### Step 3: Quick triage (big levers first)
No-ask checks: geometry (vessel vs. batch depth), heat path (preheat, browning, rack placement), moisture path (covered/uncovered, reduction capacity), salinity concentration risk, sequence integrity (emulsion order, acid/dairy timing, rests), crowding risk.

Minimal follow-ups only when needed: pan size/material, actual heat/oven setting used, rough layer depth, covered or uncovered (when?), substitutions, did it sizzle on contact.

### Step 4: Root-cause hypotheses (required)
State at least one:
- Hypothesis A: [one-sentence cause] -- confidence: high|med|low
- Hypothesis B (optional): [one-sentence cause] -- confidence: high|med|low

Rules: each hypothesis must imply a falsifiable test; every proposed change must map to Hypothesis A or B; remove changes that do not map.

### Step 5: Research and corroboration
Follow `research-workflow` skill. Revision emphasis: build queries around dish + failure symptom; prefer sources discussing mistakes, troubleshooting, pan geometry, and sensory cues; prefer sources whose equipment/geometry resembles user setup. When sources disagree, choose the fix that is failure-specific and physics-consistent.

### Step 6: Equipment-fit pass (required)
Follow `equipment.md` before finalizing. Revised vessel and tool list compatible with on-hand inventory; substitutions follow hierarchy; batch depth and crowding limits explicit; covered/uncovered and reduction strategy explicit.

### Step 7: Fix design rules
- Keep fixes minimal but decisive.
- Prefer ratio bands and sensory cues over brittle single numbers.
- Include at least one preventive guardrail for each high-confidence failure mode.
- Preserve user intent and flavor direction.

### Emission policy for revisions
**Internal-only (compute but do NOT emit):** Steps 0-7 (intake, failure classification, locked decisions, triage, hypotheses, research, equipment analysis, fix design).

**Emitted output (in this order):**
- A) Diagnosis Summary: failure class(es), hypotheses with confidence, evidence summary.
- B) What Changes and Why: change list (old -> new), hypothesis mapping, any locked-decision conflicts and resolutions.
- C) Updated Recipe: full drop-in in `recipe-template.md` format; must include inventory-aware equipment list, explicit geometry limits, explicit covered/uncovered and reduction plan, Gather & Stage section, troubleshooting entries for the observed failure mode. **[healthy-chef]** Also include Reheat Plan and Nutrition Snapshot.
- D) Optional Validation Plan: 2-5 bullet next-cook checklist, only if useful.
