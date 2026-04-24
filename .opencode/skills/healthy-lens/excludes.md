# excludes.md

## 0) Purpose and precedence
This file defines default constraints for "healthy recipe" generation in this project, with emphasis on gut tolerance, macronutrient quality, ancestry-informed risk filtering, and freezer performance.

Precedence order:
1) The user's explicit request in the current prompt (wins).
2) Any explicit constraints stated in the recipe request (diet, time, equipment, ingredients).
3) This file (defaults and toggles).
4) Generic best practices.

If a constraint conflicts with a stated user preference or request, do not argue. Apply the user's request and note the deviation briefly under Constraints.

Do not paste this file into recipe outputs. Recipes should reference only the relevant toggles/constraints applied.

---

## 1) Baseline stance (always on unless user overrides)
Baseline goal: make-ahead, nutrient-dense, macro-sound, repeatable recipes that store well, freeze well, portion cleanly, and stay tasty.

Always-on baseline rules:
- Batch size by default: target **10 portions**.
- Portioning schema (required):
  - Volumetric dishes (soups, stews, chilis, pasta-ish bowls): portion into **10 x ~2-cup containers**.
  - Non-volumetric plates (sheet-pan meals, grain bowls with discrete components): portion into **10 meal-sized portions** using a component plan (protein + veg + starch) and/or a grams-per-component target broadly equivalent to a real 2-cup meal.
  - Non-cup-friendly items (steaks, sandwiches, patties): portion into **10 meal-sized portions** with a packaging plan (wrap, freeze, reheat guidance), without forcing "cups."
  - Default target is a true meal portion, not a snack portion, unless user explicitly asks for snack-sized output.
- Planned eating horizon: **~2 weeks total**, achieved by:
  - Fridge: **3 to 5 days** of portions for near-term eating.
  - Freezer: remaining portions, planned for **months** (quality-first) in portionable packages.
- Freezer-friendliness is a primary design goal: prefer dishes and textures that survive freezing and reheating with minimal quality loss.
- Make-ahead required: include at least one meaningful pre-prep pathway.
- Freezer plan required: include a clear freeze point, packaging plan, thaw path, and reheat correction when the dish is batch-oriented.
- Veg-forward: include at least 2 distinct vegetables unless unreasonable; if not, provide an optional veg add-on or side.
- Alliums do not count toward the vegetable minimum.
- Protein-present: include a clear primary protein (animal or plant); avoid "carb-only" mains by default.
- Good macronutrient structure: default to protein-forward meals that include fiber where the dish supports it; avoid mostly starch + fat with token protein.
- Added sugar minimal: avoid sugar-forward sauces and glazes by default; if sweetness is needed, keep it functional and explain why.
- Sodium-aware: use technique first (browning, spice blooming, acid balancing, herbs, texture contrast) before relying on salt-heavy condiments.
- Fat-managed: avoid greasy outcomes; prefer controlled fat additions and methods that do not leave pools of oil.
- Technique realism: no steps requiring restaurant-only gear or professional skill without fail-safes.
- Flavor is non-negotiable: if a constraint threatens flavor, compensate with technique (browning, toasting spices, deglazing, acid balance, texture, herbs) rather than health gimmicks.

---

## 2) User preference constraints (project defaults)

### 2a) Hard avoids (do not use unless explicitly requested)
- Chocolate (as an ingredient or flavor base)
- Garlic in any meaningful amount
- Onion in any meaningful amount
- Mushrooms in any meaningful amount

### 2b) Trace-only exception policy
The hard avoids above allow a narrow trace-only exception unless the user says zero tolerance.
- "Trace" means an amount small enough that it is not a meaningful flavor base, bulk ingredient, or texture contributor in the finished dish.
- Do not build recipes around garlic, onion, or mushroom as aromatic foundations, vegetable volume, or umami anchors under default rules.
- If a trace amount is present through a minor seasoning blend, sauce, or background accent, disclose it clearly.
- When in doubt, treat garlic, onion, and mushroom as excluded rather than trying to game the threshold.

### 2c) Soft avoids (use sparingly; offer alternatives)
- Extremely hot or aggressive chile-forward builds beyond a warm/medium heat baseline.
- Greasy, high-oil preparations (deep-fry, shallow-fry, confit-style, heavy cream sauces).
- High-sodium builds (salt-heavy marinades, salty stocks/bouillon, cured-meat-forward dishes) unless user asks.
- Gluten-grain-heavy builds by default; assume mild gluten sensitivity and prefer non-gluten or lower-gluten structures when the dish can support them cleanly.

### 2d) Poultry stance
- Poultry is acceptable as an ingredient.
- Default: do not use poultry as the **main course protein** unless user explicitly asks.
- Main course protein = the largest named protein component by weight/serving (the centerpiece protein).
- Poultry may be used in supporting roles (stock/broth; small amounts of sausage; mixed dishes where poultry is not the primary protein).

### 2e) Non-freezer-friendly protein stance
- Proteins that usually freeze or reheat poorly are acceptable as ingredients.
- Default: do not use a **non-freezer-friendly protein** as the main course protein unless user explicitly asks.
- These proteins may be used in supporting roles or in recipes not intended for freezer batch prep.
- Judge by observed freezer reliability in the finished dish, not by prestige or health halo.
- Common examples: delicate white fish fillets, shrimp in formats reheated from frozen, delicate seafood that turns rubbery or watery.

### 2f) Generally compatible / preferred
- Red meat is generally well-tolerated; still manage saturated fat and portioning via cut choice and technique.
- Beans/legumes are positive when the dish supports them.
- Tomatoes are generally acceptable.
- Rice is generally acceptable; whole grains are optional and should be framed as a toggle, not a mandate.
- Non-gluten and lower-gluten starch paths are generally preferred over gluten-grain-heavy builds when the dish can support them cleanly.
- Avocado oil is the default cooking oil preference.

### 2g) Dairy stance (default)
- Dairy-light by default.
- Prefer lower-lactose options when dairy is used (yogurt, aged cheeses, lactose-free dairy) and avoid heavy cream reliance.
- Keep dairy as a finish or accent rather than a bulk base unless user requests otherwise.

### 2h) Aromatic replacement bias
When garlic/onion are excluded, recover flavor with:
- ginger
- celery or fennel where structurally appropriate
- citrus zest
- herbs
- toasted spices
- tomato paste
- browned meat or vegetable fond

Conditional path only if explicitly acceptable in the current thread:
- scallion greens
- chives

Rules: scallion greens and chives are not default-safe substitutes; use them only when the current thread explicitly confirms they are tolerated.

### 2i) Ancestry-informed gut-risk layer
This is a risk-management layer, not a diagnosis.
- Bias defaults toward high-yield exclusions plausibly relevant to Ashkenazi Jewish and Turkish ancestry.
- Keep this layer narrow. Do not turn ancestry into a giant speculative blacklist.
- Prefer soft blockers and conditional rules unless there is a strong reason for a hard stop.
- If user has been formally tested or has strong personal tolerance data, that overrides this layer.

### 2j) Lactose-heavy dairy stance
- Default: treat **lactose-heavy dairy** as a **soft blocker** unless user explicitly wants it or has known good tolerance.
- Down-rank or avoid as default backbone ingredients: regular milk, half-and-half, cream-heavy milk bases, evaporated milk, condensed milk, ice cream, milk powder when used meaningfully, whey-concentrate-heavy products, fresh soft cheeses when used in large amounts.
- Prefer: yogurt, aged hard cheeses, lactose-free dairy products.

### 2k) Gluten-grain stance
- Default: treat **gluten grains** as a **soft blocker** unless user explicitly wants them.
- Gluten grains: wheat, barley, rye, and direct derivative ingredients that materially contribute gluten exposure.
- Prefer non-gluten starch paths when the dish does not depend on gluten structure: rice, potatoes, cornmeal/polenta, legumes, mixed-starch builds.
- Down-rank or avoid as default backbone: wheat flour, bread flour, semolina, farro, bulgur, couscous, barley, rye, spelt, malt/malt extract, regular beer in cooking, wheat-based soy sauce unless user explicitly accepts it.
- When gluten structure is central to the dish identity, keep the rest of the build supportive and offer a lower-gluten or gluten-free variation when feasible.

### 2l) Fava / broad bean stance (conditional hard stop)
- Default: treat **fava beans / broad beans** as a **conditional hard stop** unless G6PD deficiency has been ruled out or user explicitly accepts the risk.
- Reason: fava beans are a classic trigger for hemolysis in G6PD deficiency.
- Applies to: fresh fava beans, dried fava beans, broad bean purees, dishes built around fava as a primary legume, mixed legume dishes where fava is a meaningful component.
- If a cuisine-specific dish traditionally uses fava, flag it clearly rather than silently substituting.

### 2m) Do not create broad ancestry-based food bans
Default rule: do NOT add broad bans for inflammatory bowel disease, familial Mediterranean fever, or other ancestry-linked conditions unless there is a direct, high-yield, food-specific reason with user confirmation.

### 2n) Personal-trigger watchlist (optional layer; not a default exclude list)
Use only when user reports repeated personal reactions or has a confirmed related diagnosis.
Potential watchlist categories: very high-fat meals, very salty meals, rough or high-residue foods during active flare-style period, alcohol-heavy foods or cooking methods, highly processed foods clearly associated with symptoms.
Watchlist items become exclusions only when user has a repeatable pattern, formal diagnosis, or explicitly asks for stricter filtering.

---

## 3) Health orientation constraints

### 3a) Composition defaults (qualitative)
Aim for meals that are:
- Protein-forward relative to carbs.
- Fiber-forward via legumes, vegetables, and optionally whole grains when tolerated.
- Macro-balanced enough to function as real meals rather than snack-shaped starch dishes.
- Healthy-fats forward: prefer mono- and polyunsaturated fats; whole-food fat sources when they improve texture/flavor (avocado, nuts, seeds, tahini).
- Fat stacking rule: multiple fat sources allowed; default to 1-3 major fat sources where each has a distinct purpose; if using 3+, briefly justify each.
- Added-sugar-minimized.
- Sodium-aware with explicit targets (see §4c).

### 3b) Blood sugar / A1C friendly defaults
- Prefer mixed meals (protein + fat + fiber) over refined-carb-only meals.
- Use refined starches (like white rice) strategically as a supporting base, not the entire structure.
- Avoid sugar-sweetened sauces as a primary flavor driver.
- Prefer macro layouts that blunt a starch hit with adequate protein, fat, and fiber.

### 3c) GI / gut-tolerance guidance
Hard limits (default):
- No chocolate-based components.
- No meaningful garlic or onion.
- No meaningful mushroom.
- Avoid very greasy outcomes (oil slicks, heavy fried textures).
- Default heat: warm to medium is acceptable; extreme heat is optional, not default.

Flavor safeguard: if gut-tolerance defaults reduce flavor, compensate with non-irritant techniques first (browning, toasted spices, ginger, herbs, zest, tomato paste, texture contrast), then offer acid/heat as adjustable finish toggles.

---

## 4) Method constraints

### 4a) Preferred methods
- Sear + deglaze + simmer (controlled fat, high flavor).
- Roast/oven-bake/air-fry style (crisping without deep frying).
- Braise/pressure-cook for bean-forward or tougher cuts.
- Quick pickles and herb finishes for brightness without sugar.
- Batch methods that freeze and reheat cleanly.

### 4b) Avoid by default
- Deep frying.
- Cream-heavy sauces as the core of the dish.
- Sugar-forward glazes.
- "Dump and bake" methods that produce bland results without corrective steps.
- Gluten-grain-heavy builds when an equally good non-gluten path exists.

### 4c) Sodium targets + explicit levers (default)
Sodium levels (project guidance; not medical):
- Low: < 500 mg/serving
- Moderate: 500 to 900 mg/serving
- High: > 900 mg/serving

Required behavior:
- Identify the top 3 sodium drivers.
- Provide 2-4 concrete sodium levers: low-sodium stock vs regular; reduce soy/bouillon/cured meats; drain/rinse canned items; finish with acid/herbs instead of more salt; use no-salt-added tomato products; split salty components into "optional finish" rather than base.
- If nutrition is computed: report sodium (mg) per serving and sodium per 1000 kcal.
- If nutrition is not computed: do not claim numeric sodium levels; still provide drivers + levers.

### 4d) Fat management playbook
- Measure oil; avoid free-pour unless explicitly requested.
- Choose leaner cuts when the dish supports it; for fattier cuts, balance with high-veg and use fat-discard steps when appropriate.
- Use emulsification to avoid oily mouthfeel.
- Prefer whole-food fat sources when they improve flavor and texture; avoid redundant fat stacking.

### 4e) Spice and heat
- Default heat: warm to medium.
- Provide extreme heat as an explicit toggle rather than baking it into the base unless user asks.

### 4f) "Don't be weird" constraint (health substitutions)
- Do not introduce diet substitutions that change the soul of the dish unless user asks or the dish is explicitly a lightened version with the tradeoff stated.
- If a substitution materially changes the dish identity, label it as a Variation, not the base recipe.

---

## 5) Constraint QA checklist (quick pass before final output)
- Does the recipe meet the user's stated request and explicit constraints?
- Is the yield/portioning consistent with the 10-portion default (or explicitly overridden)?
- Is the ~2-week eating horizon supported by a concrete fridge (3-5 days) + freezer (months) plan?
- Is freezer performance treated as a primary design concern when the dish is make-ahead or batch-oriented?
- Are hard avoids respected (chocolate, meaningful garlic, meaningful onion, meaningful mushroom) unless explicitly overridden?
- Are trace-only exceptions disclosed rather than hidden?
- Is poultry not used as the main course protein unless requested?
- Are non-freezer-friendly proteins avoided as the main course protein unless requested?
- Are lactose-heavy dairy ingredients treated as a soft blocker?
- Are gluten grains treated as a soft blocker rather than only wheat?
- Are fava/broad beans blocked unless G6PD has been ruled out or user explicitly accepts them?
- Are there at least 2 vegetables (or an optional veg add-on/side is provided)?
- Is macro structure sound (clear protein, not mostly starch + fat, fiber included where dish supports it)?
- Is fat managed (no oil slick; no heavy-cream base by default; fat stacking rule respected)?
- Is sodium handled with technique first AND are sodium drivers + levers explicitly listed?
- Is heat warm/medium by default?
- Are gluten grains handled as a soft blocker with a non-gluten path when feasible?
- Are make-ahead and leftovers instructions concrete (portioning, freezing, packaging, and reheat correction)?
- Are "diet substitutions" avoided unless requested (don't be weird rule)?
