# nutrition_calculation_method.md

## Goal
Generate a "Nutrition Snapshot (per serving)" using a source-driven, calculator-assisted workflow:
- Authoritative nutrition data comes from ingredient-level sources when available.
- Calculator tools are execution aids and cross-checks, not authorities.
- Field-level exhaustion before NA; never snapshot-level failure.
- Source attribution is required per field or per tightly grouped row set.

---

## Definitions

### Required fields — core label (always attempt per serving)
- Calories
- Total fat
  - Saturated fat
  - Trans fat
  - Monounsaturated fat
  - Polyunsaturated fat
- Cholesterol
- Sodium
- Total carbohydrate
  - Dietary fiber
    - Soluble fiber
    - Insoluble fiber
  - Total sugars
  - Added sugars
- Protein

### Priority vitamins and minerals (always attempt when sourceable)
- Vitamin A, Vitamin D, Vitamin C, Vitamin B12, Folate (B9), Potassium, Calcium, Iron, Magnesium

### Extended vitamins and minerals (attempt when reasonably sourceable)
- Vitamin E, Vitamin K, Thiamin (B1), Riboflavin (B2), Niacin (B3), Pantothenic acid (B5), Vitamin B6, Choline, Phosphorus, Zinc, Copper, Manganese, Selenium

If a field is not resolvable after source-tier escalation:
- Amount = NA; %DV = --
- All rows must remain visible with NA; do not omit any row.
- A recipe-level nutrient row is numeric only if all included ingredient contributions for that nutrient are numeric.
- If any ingredient remains unresolved for a nutrient after source-tier exhaustion, the recipe-level nutrient row becomes NA. Do not publish partial sums.

---

## Source Hierarchy

**Tier 1: USDA FoodData Central — Foundation Foods**
Default for raw, generic, minimally processed, and commodity-style ingredients.
URL: https://fdc.nal.usda.gov/
Prefer Foundation Foods over SR Legacy or FNDDS when a matching record exists.

**Tier 2: Official manufacturer Nutrition Facts sources**
Default for branded packaged foods. Preferred order: manufacturer product page (current, exact SKU) > manufacturer PDF/spec sheet > package label text if explicitly provided.
Field-level fallback: if Tier 2 provides some fields but omits others, descend to next tier only for missing fields.

**Tier 3: USDA FoodData Central — Branded Foods**
Fallback for branded products when official manufacturer source is absent, stale, or inaccessible.

**Tier 4: USDA FoodData Central — FNDDS / SR Legacy / other USDA prepared-food entries**
For generic prepared foods, common mixed items, and institutional-style food records.

**Tier 5: USDA yield / portion-correction sources**
Yield factors, drained-weight factors, edible-portion factors. These are correction aids, not primary nutrient authorities.

**Tier 6: Public recipe calculators**
- MyFoodData Recipe Nutrition Calculator: https://tools.myfooddata.com/recipe-nutrition-calculator
- HappyForks Recipe Analyzer: https://happyforks.com/analyzer
- Verywell Fit Recipe Nutrition Analyzer: https://www.verywellfit.com/recipe-nutrition-analyzer-4157076

Use only as: fast-entry interfaces, gap-fill helpers when Tier 1-5 unavailable for a specific field, cross-check tools.
Calculator output does not outrank a cleaner ingredient-level source stack.
If calculator result materially diverges from source-derived total: prefer source-derived; note the mismatch in Nutrition Provenance only if it materially affected the displayed result.

---

## No-Hard-Stop Rule
A workflow-level hard stop is not permitted.
- If the first public calculator fails: escalate to the next listed Tier 6 tool.
- If all public calculators fail: continue with ingredient-level source derivation (Tiers 1-5).
- If one nutrient field is unresolvable: continue computing all other fields; set only the unresolvable field to NA.
- The entire Nutrition Snapshot must never be dropped because a single tool failed or a single field could not be resolved.

---

## Daily Values Reference (FDA 2020 revision, 2,000 kcal basis)

| Nutrient              | Daily Value            |
| --------------------- | ---------------------- |
| Total fat             | 78 g                   |
| Saturated fat         | 20 g                   |
| Trans fat             | no DV established      |
| Monounsaturated fat   | no FDA DV              |
| Polyunsaturated fat   | no FDA DV              |
| Cholesterol           | 300 mg                 |
| Sodium                | 2,300 mg               |
| Total carbohydrate    | 275 g                  |
| Dietary fiber         | 28 g                   |
| Soluble fiber         | no FDA DV              |
| Insoluble fiber       | no FDA DV              |
| Added sugars          | 50 g                   |
| Protein               | 50 g                   |
| Vitamin A             | 900 mcg RAE            |
| Vitamin C             | 90 mg                  |
| Vitamin D             | 20 mcg                 |
| Vitamin E             | 15 mg alpha-tocopherol |
| Vitamin K             | 120 mcg                |
| Thiamin (B1)          | 1.2 mg                 |
| Riboflavin (B2)       | 1.3 mg                 |
| Niacin (B3)           | 16 mg NE               |
| Pantothenic acid (B5) | 5 mg                   |
| Vitamin B6            | 1.7 mg                 |
| Folate (B9)           | 400 mcg DFE            |
| Vitamin B12           | 2.4 mcg                |
| Choline               | 550 mg                 |
| Potassium             | 4,700 mg               |
| Calcium               | 1,300 mg               |
| Phosphorus            | 1,250 mg               |
| Magnesium             | 420 mg                 |
| Iron                  | 18 mg                  |
| Zinc                  | 11 mg                  |
| Copper                | 0.9 mg                 |
| Manganese             | 2.3 mg                 |
| Selenium              | 55 mcg                 |

%DV display rules:
- Calories: never show %DV; use -- always.
- Total sugars: never show %DV; use -- always.
- Trans fat, Monounsaturated fat, Polyunsaturated fat: no DV; use -- always.
- Soluble fiber, Insoluble fiber: no FDA DV; use -- always.
- Protein: use -- unless the display context explicitly supports showing it.
- All other nutrients: compute and show when the amount is numeric; round to nearest whole percentage.
- If amount is NA: %DV = -- (do not compute from NA).
- Formula: %DV = (amount / Daily Value) x 100, rounded to nearest whole number.

---

## Workflow

### A. Confirm serving definition
Confirm total recipe yield (servings count). Confirm what constitutes one serving (e.g., "1 of 10 portions, approx. 300 g each"). If ambiguous: choose the most typical consumer portion and document in Nutrition Assumptions.

### B. Parse recipe into ingredient rows
For each ingredient, classify its role for Added sugars derivation:
- **Role A** (discrete added sweetener without a declared Added sugars value): honey, maple syrup, sugar, brown sugar, agave, molasses, corn syrup. All sugar contributed by Role A ingredients counts as added sugars.
- **Role B** (unsweetened whole food): plain vegetables, plain fruit, plain legumes, plain grains, plain dairy (milk, plain yogurt), plain eggs, plain meat, plain fish, plain nuts, plain seeds. No added sugars contribution.
- **Role C** (ingredient with declared Added sugars): any ingredient whose Tier 2 or Tier 3 source explicitly states an Added sugars value. Use the declared value directly. Role C takes precedence over Role A.
- **Role D** (processed/packaged ingredient without declared added sugars): use NA for Added sugars; do not infer from Total sugars.
- If role is ambiguous: treat as Role D.

### C. Match each ingredient to the best source tier
- Simple whole ingredient: start at Tier 1.
- Branded packaged ingredient: start at Tier 2.
- Generic prepared or mixed food without brand-specific source: start at Tier 4.
- Yield/drained/edible corrections: apply Tier 5 only as a correction layer after a primary nutrient source is selected.
- Field-level fallback: if matched tier provides some fields but not others, descend to next tier only for missing fields.

### D. Normalize quantity
- Prefer exact grams when present in the recipe.
- Otherwise use source-native serving units when the source provides a precise serving mapping.
- Only force gram conversion when needed for arithmetic or when the source requires it.
- Ambiguous conversions (e.g., "1 large onion") must use the most typical US retail size and be disclosed in Nutrition Assumptions.
- Normalize nutrient units/forms to display basis: Vitamin A = mcg RAE; Folate (B9) = mcg DFE; Niacin (B3) = mg NE; Vitamin E = mg alpha-tocopherol.
- If a source reports in a different form/unit and exact conversion is unavailable, set that nutrient to NA for that ingredient.

### E. Apply yield / drained / edible corrections (when materially relevant)
Document any correction applied in Nutrition Assumptions.

### F. Compute per-ingredient contributions
For each ingredient: (ingredient quantity / source serving size) x source nutrient per serving = ingredient contribution.

### G. Sum recipe totals
Total recipe nutrient = sum of all normalized per-ingredient contributions for that nutrient only when every included ingredient has a numeric value. If any ingredient remains unresolved after source-tier exhaustion, set the recipe-level nutrient to NA. Do not publish partial sums.

### H. Divide by servings
Per-serving nutrient = total recipe nutrient / servings count.

### I. Populate the Nutrition Snapshot tables
Enter values per the format in recipe-template.md. Compute %DV per Daily Values Reference above.
Source basis column: state the dominant source tier or specific source name per nutrient row or tightly grouped row set.

### J. Calculator use (optional accelerator / cross-check)
- If a calculator accelerates steps F-H: enter source-resolved ingredient quantities, not raw recipe text.
- If a calculator cross-checks: compare its per-serving totals to source-derived totals; prefer source-derived if they diverge materially.
- If a calculator fills a gap for a specific field where no Tier 1-5 source was found: use it only if the tool output matches the row's display unit/form or can be normalized exactly; record as source basis for that field.
- Tool citations appear in Sources (type: tool) only when the tool materially contributed to the Nutrition Snapshot.

---

## Sub-Recipe and Custom Component Handling
For sauces, marinades, rubs, dressings, mixed fillings:
- Compute the sub-component's nutrition independently using steps A-H.
- Roll the sub-component's per-serving contribution into the parent recipe as an ingredient-level contribution.
- For retained-portion adjustments (e.g., marinade where only a fraction is consumed): apply the retention fraction before rolling up and document in Nutrition Assumptions.

---

## Conflict Resolution
- Generic whole ingredients: prefer USDA Foundation Foods (Tier 1) over calculator output (Tier 6).
- Branded packaged foods: if Tier 2 and Tier 3 conflict and Tier 2 is clearly current and exact-match, prefer Tier 2. Otherwise prefer Tier 3 over Tier 6.
- Generic prepared foods: prefer USDA FNDDS (Tier 4) over public calculator guesses (Tier 6).
- Calculator mismatch: prefer source-derived totals. Document mismatch briefly in Nutrition Provenance only if it materially affected the displayed result.
