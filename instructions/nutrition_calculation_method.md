# nutrition_calculation_method.md

## 0) Purpose
Define a predictable, repeatable method for producing the "Nutrition Snapshot (per serving)" in Full Recipe outputs.

Core rule:
- Never invent numbers.
- A metric is eligible for numeric output only if two independent, trustworthy calculators provide it and agree within 10 percent (see Section 5).

If eligibility is not met, output "N/A" for that metric and provide a short explanation of why (missing field vs spread vs ambiguous mapping).

This method is about estimates, not targets.

---

## 1) Scope
Applies to:
- Full Recipe outputs that include a "Nutrition Snapshot (per serving)" section.

Does not apply to:
- Options Lists (nutrition should be qualitative unless the agreement rule is satisfied).
- Medical guidance or individualized dietary advice.

---

## 2) Required output fields
The Full Recipe Nutrition Snapshot must contain these lines (even if some are "N/A"):
- Calories
- Protein (g)
- Fiber (g)
- Fat (g) (sat g)
- Added sugar (g)
- Potassium (mg)
- Sodium (mg)

Optional extended fields (include only if requested AND eligible):
- Carbs (g), sugar (g), net carbs (g) if available
- Cholesterol (mg)
- Iron (mg), calcium (mg)
- Soluble vs insoluble fiber (g) only if calculators explicitly provide them (do not infer)

---

## 3) Calculator eligibility (what counts as "trustworthy")
A calculator may be used if it:
- Lets you build a full recipe and divide by servings, AND
- Uses a reputable nutrition database (e.g., USDA-based, NCCDB, or similarly curated), AND
- Allows selecting entries that are not obviously user-generated junk, AND
- Surfaces enough detail to verify the ingredient mapping (food name + serving/grams).

Independence rule:
- Calculator A and Calculator B must be meaningfully independent (different tool and/or different primary database), not the same database presented through two skins.

---

## 4) Standardized input normalization
The goal is to reduce ambiguity so two calculators are comparing the same recipe.

### 4a) Servings normalization
- Use the recipe's stated yield as the serving count in both calculators.
- If the recipe yield is ambiguous, set a clear servings count before calculating (and do not calculate until yield is explicit).

### 4b) Ingredient normalization rules (default assumptions)
Use the Ingredients section as the source of truth. Normalize as follows:

1) Use grams whenever possible.
- If the recipe lists grams (e.g., 1 tsp (5 g) salt), input grams directly.
- If not listed in grams, use the calculator's built-in gram conversion for that specific ingredient when available.

2) If you must estimate grams for a volume measure:
- Prefer the calculator's conversion for that ingredient.
- If the calculator does not provide a reliable conversion, make a conservative, standard assumption and record it in the "Nutrition assumptions" note (see Section 7).

3) Edible portion:
- Use edible portion weights (trimmed, peeled) when the recipe implies trimming/peeling.
- If ambiguous, assume common edible prep (e.g., onion peeled; garlic peeled) and note that it is an assumption.

4) Dry vs cooked:
- Use the form specified by the ingredient line.
  - If it says "1 cup cooked rice", input cooked rice.
  - If it says "1/2 cup dry rice", input dry rice.
- Do not silently convert dry to cooked or vice versa.

5) Drained vs not drained (high impact items):
- If ingredient implies draining (canned beans, tuna, canned tomatoes with draining, etc.), input the drained form if the calculator supports it.
- If ambiguous, do not guess. Either:
  - choose the most explicit entry available, OR
  - mark the affected metrics as "N/A" if this ambiguity materially changes results (commonly sodium, calories).

6) Oils and cooking fat retention:
- Default assumption: all added oils and fats are consumed unless the recipe explicitly discards rendered fat or drained oil.
- If the recipe instructs draining fat, input only the portion reasonably retained, and note the retention assumption.

7) "Negligible" ingredients rule (do not overfit):
- Ingredients that are typically nutritionally negligible may be omitted only if they do not affect sodium, added sugar, or fat meaningfully.
- Never omit:
  - salt, soy sauce, bouillon, salty condiments
  - added sugars (honey, maple, sugar)
  - oils and fats
  - cheese
  - cured meats
If in doubt, include it.

---

## 5) Agreement test (10 percent rule)
For each required metric where both calculators provide numeric values:

Compute percent difference as:
- diff = abs(A - B) / ((A + B) / 2)

Eligibility:
- If diff <= 0.10, the metric is eligible for numeric output.
- If diff > 0.10, the metric is NOT eligible. Output "N/A" and state the spread.

Missing field rule:
- If either calculator does not provide the metric, it is NOT eligible. Output "N/A" and state that a calculator did not provide it.

Important:
- Apply the agreement test on the unrounded values from each calculator (round only after eligibility is confirmed).

---

## 6) Output selection and rounding rules
### 6a) Which number to publish when eligible
If eligible, publish the midpoint:
- published = (A + B) / 2

### 6b) Rounding (after midpoint)
- Calories: round to nearest 10 calories.
- Grams (protein/fiber/fat/sat fat/added sugar): round to nearest 1 g.
- Milligrams (sodium/potassium): round to nearest 10 mg.
- If rounding would show "0" for a nonzero value, use "<1 g" or "<10 mg" only if both calculators are nonzero AND eligible; otherwise use "N/A".

---

## 7) Required disclosure behavior (concise)
If any nutrition numbers are shown, include a single brief note in the Nutrition Snapshot section:

"Nutrition assumptions: Estimated using two calculators per nutrition_calculation_method.md; values are midpoints after agreement test. Assumptions: [list only the 1 to 3 highest-impact assumptions]."

Examples of high-impact assumptions:
- "Oil retention assumed 100% (no draining step)."
- "Beans entered as drained."
- "Rice entered as cooked weight."

Do not include per-recipe totals.

---

## 8) When estimates are not available
If one or more required metrics are ineligible:
- Keep the Nutrition Snapshot section with all required lines.
- Use "N/A" for ineligible metrics.
- Provide one short explanation line:
  - "Reliable estimate not available for: [metrics]. Reason: [missing field vs >10% spread vs ambiguous ingredient mapping]."

If most metrics are ineligible:
- Provide qualitative nutrition notes instead (bean-forward, high-veg, added sugar minimal, sodium-sensitive levers) without numbers.

---

## 9) Common failure modes and what to do
- Ingredient mapping mismatch (raw vs cooked; drained vs not drained):
  - Fix mapping first, then re-run both calculators.
- Sodium discrepancies:
  - Check whether either calculator used "salted" vs "no-salt-added" entries.
  - Check bouillon/soy/cheese entries.
- Added sugar missing:
  - If a calculator does not report added sugar, do not estimate it. Output "N/A".
- Potassium missing or wildly divergent:
  - Output "N/A" if not eligible; do not infer from foods.

---

## 10) Short checklist (before publishing nutrition numbers)
- Servings match recipe yield in both calculators.
- High-impact ingredients are mapped consistently (oil, salt, broths, drained items).
- Agreement test passed for each published metric.
- Rounding applied only after passing.
- "N/A" used where needed; no invented values.
- Short assumptions note included (1 to 3 items max).
