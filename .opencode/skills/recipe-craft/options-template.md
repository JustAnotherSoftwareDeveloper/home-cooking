# Options List Template (Canonical)

This is the shared format for both recipe-chef and healthy-chef.
- recipe-chef: "Why it fits" references occasion directives and equipment-fit.
- healthy-chef: "Why it fits" references health constraints and equipment-fit.

---

## Emission policy

### Internal-only workflow sections (compute but DO NOT emit)
- Occasion/constraint extraction
- Research execution
- Research outputs (failure modes, guardrails, disagreements, carry-forward notes)
- Breadth scan

### Final output sections (emit in this order)
1. Required inputs
2. Shortlist (Top 5 to 8)
3. Runner-Ups (5 to 10)
4. Pick First / If You Want...
5. Optional: Comparative Matrix (only if triggered)
6. Sources (only if external browsing was performed; otherwise omit)

---

## Required inputs

### Title & Goal
[2-3 sentences: what you want, time window, equipment preferences, vibe/flavor direction, and either the target occasion (recipe-chef) or what "healthy" means here (healthy-chef).]

### Context & Constraints
- Serves:
- Time:
  - Active:
  - Total:
- Target eating model:
- Anti-target model:
- Effort tolerance: [low | med | high]
- Skill level: [novice | comfortable | advanced]
- Equipment on hand: [default is full equipment.md §1 inventory; list confirmed exceptions or additions only]
- Allergies / avoidances:
- Heat tolerance: [mild | medium | hot]
- Make-ahead preference: [none | partial | components day-before | full day-before OK]
- Notes / assumptions:

---

## Shortlist (Top 5 to 8)

### Shortlist rules
- Each option must cite one primary source [n].
- Each option must contain:
  - a **Description** line covering: what the dish is, what it eats like, what makes it distinct, and one familiar comparison when the dish may be unfamiliar.
  - a **Watch** line derived from Research outputs (specific failure mode or guardrail, not generic filler).
  - a **Why it fits** line referencing at least one occasion directive or health constraint, and equipment-fit.
- The Watch line must reference a specific listed failure mode or guardrail verbatim or near-verbatim.
- Do not mention every constraint in every option; mention only what materially differentiates it.
- Avoid vague cultural-label-only descriptions.

### Distinctness guardrails
Default (broad prompts):
- At least 3 distinct formats across the shortlist.
- No more than 2 options in the same format.
- No more than 2 options sharing the same primary protein/center-of-plate.

When the prompt constrains the space (e.g., "all sheet-pan", "all bowls"):
- Treat that constraint as fixed.
- Diversify across at least 3 axes: protein/center-of-plate, sauce/base style, cooking method, flavor profile, holding strategy, make-ahead strategy.

### Per-option template (target 6 lines; max 7)
Formatting: level-4 header per option; blank line between options.

#### 1) **[Option Name]** [tags: 3-5; format: ...; active: ~X min (est); effort: low|med|high]
**Description:** [What it is, what it eats like, what makes it distinct in this shortlist, one familiar comparison when needed.]
**Flavor profile:** richness [light|med|rich]; acidity [low|med|high]; heat [none|low|med|high]; notes: [2-4 descriptors]; texture: [1-2 descriptors]
**Make-ahead:** [what]. **Hold/Reheat:** [how + cue]
**Watch:** [1 failure mode or guardrail]. **Why it fits:** [occasion directive or health constraint + equipment-fit]
**Source:** [Blog|YT|IG|Forum|Authoritative]. [n]

Tag guidance: 3-5 tags max; select from tags.md vocabulary; do not invent new tags.

---

## Runner-Ups (5 to 10)
One-liners only. Each must include a hook and either a key technique, main protein, or why it was bumped.

Footnote only if the runner-up is traceable to the main research pool. In no-browse mode, omit footnotes entirely.
- [One-liner...]

---

## Pick First / If You Want...
4-7 chooser rules routing to specific options (1-2 options per rule). Reflect occasion or health directives.
- Fastest path to food:
- Lowest coordination load:
- Best make-ahead / holding:
- Minimal cleanup:
- Most impressive for the effort:
- Most crowd-friendly:
- Easiest allergy/avoidance-friendly with trivial swaps (if relevant):

---

## Optional: Comparative Matrix
Use when >= 6 shortlist options, or when occasion/constraints imply holding/coordination tradeoffs.

| Option | Format | Active (est) | Effort | Make-ahead | Hold/Reheat | Biggest watch | Why it fits |
|---:|---|---:|---|---|---|---|---|
| 1 |  |  |  |  |  |  |  |

---

## Sources
Plain URLs only, one per line. Each number matches the in-text [n] markers.

1. https://example.com/
2. https://example.com/

---

## URL and citation rules
- Do NOT embed raw URLs in the Shortlist, Runner-Ups, or chooser rules.
- Use numeric footnote markers [n] only.
- URLs go only in the Sources section; one per line; strip tracking params when practical.
- Never invent links.
- If external browsing is not available: write "No external browsing performed; sources omitted." Then omit footnotes and Sources entirely.

## Units policy
- Avoid quantities in options unless essential.
- U.S. customary units; metric in parentheses only if pulled directly from a source.

## Bolding rules
- Bold the option name.
- Bold field labels (e.g., **Description:**, **Watch:**, **Why it fits:**).
- Optionally bold one key endpoint or decision per option.
- Do not bold whole sentences.
