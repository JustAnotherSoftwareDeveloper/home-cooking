# healthy_constraints.md

## 0) Purpose and precedence
This file defines default constraints for "healthy recipe" generation in this project.

Precedence order:
1) The user's explicit request in the current prompt (wins).
2) Any explicit constraints stated in the recipe request (diet, time, equipment, ingredients).
3) This file (defaults and toggles).
4) Generic best practices.

If a constraint conflicts with a stated user preference or request, do not argue. Apply the user's request and note the deviation briefly under Constraints.

Do not paste this file into recipe outputs. Recipes should reference only the relevant toggles/constraints applied.

---

## 1) Baseline stance (always on unless the user overrides)
Baseline goal: make-ahead, nutrient-dense, repeatable recipes that store well, portion cleanly, and stay tasty.

Always-on baseline rules:
- Batch size by default: target **10 portions**.
- Portioning schema (required):
  - Volumetric dishes (soups, stews, chilis, pasta-ish bowls): portion into **10 x ~1-cup containers**.
  - Non-volumetric plates (sheet-pan meals, grain bowls with discrete components): portion into **10 portions** using a component plan (protein + veg + starch) and/or a grams-per-component target.
  - Non-cup-friendly items (steaks, sandwiches, patties): portion into **10 portions** with a packaging plan (wrap, freeze, and reheat guidance), without forcing “cups.”
- Planned eating horizon: **~2 weeks total**, achieved by:
  - Fridge: **3 to 5 days** of portions for near-term eating.
  - Freezer: the remaining portions, planned for **months** (quality-first) in portionable packages.
- Make-ahead required: include at least one meaningful pre-prep pathway (sauce/base, chop kit, marinate, par-cook starch, freezer portioning).
- Veg-forward: include at least 2 distinct vegetables (not counting garlic/onion) unless the dish definition makes that unreasonable; if not, provide an optional veg add-on or side.
- Protein-present: include a clear primary protein (animal or plant) and avoid "carb-only" mains by default.
- Added sugar minimal: avoid sugar-forward sauces and glazes by default; if sweetness is needed, keep it functional and explain why.
- Sodium-aware by default: use technique and structure first (browning, aromatics, spice blooming, acid balancing) before relying on salt-heavy condiments.
- Fat-managed by default: avoid greasy outcomes; prefer controlled fat additions and methods that do not leave pools of oil.
- Technique realism: no steps that require restaurant-only gear or implied professional skill without providing fail-safes.
- Flavor is non-negotiable: if a constraint threatens flavor, compensate with technique (browning, toasting spices, deglazing, acid balance, texture).

---

## 2) User preference constraints (project defaults)
These are defaults for this project. The user can override at any time.

### 2a) Hard avoids (do not use unless explicitly requested)
- Tilapia
- Catfish
- Chocolate (as an ingredient or flavor base)

### 2b) Soft avoids (use sparingly; offer alternatives)
- Very spicy heat levels (heavy chile-forward recipes). Mild heat is acceptable; provide heat as an optional toggle.
- Greasy, high-oil preparations (deep-fry, shallow-fry, confit-style, heavy cream sauces).
- High-sodium builds (salt-heavy marinades, salty stocks/bouillon, cured-meat-forward dishes) unless the user asks.

### 2c) Poultry stance (important nuance)
- Poultry is acceptable as an ingredient.
- Default: do not use poultry as the **main course protein** unless the user explicitly asks for it.
- Definition: main course protein = the largest named protein component by weight/serving (the centerpiece protein).
- Poultry may be used in supporting roles (stock/broth; small amounts of sausage; mixed dishes where poultry is not the primary protein) unless it becomes the primary protein.

### 2d) Generally compatible / preferred
- Red meat is generally well-tolerated; still manage saturated fat and portioning via cut choice and technique.
- Beans/legumes are positive (both flavor and structure).
- Tomatoes, garlic, and onion are generally acceptable.
- Rice is generally acceptable; whole grains are optional and should be framed as a toggle, not a mandate.
- Avocado oil is the default cooking oil preference.

### 2e) Dairy stance (default)
- Dairy-light by default.
- Prefer lower-lactose options when dairy is used (yogurt, aged cheeses, lactose-free dairy) and avoid heavy cream reliance.
- Keep dairy as a finish or accent rather than a bulk base unless user requests otherwise.

---

## 3) Health orientation constraints (non-medical)
This project uses practical, non-medical "generally healthy" defaults.

### 3a) Composition defaults (qualitative)
Aim for meals that are:
- Protein-forward relative to carbs.
- Fiber-forward via legumes, vegetables, and optionally whole grains.
- "Healthy fats" forward:
  - Prefer fats that are predominantly mono- and polyunsaturated where they fit.
  - Prefer whole-food fat sources when they improve texture/flavor: avocado, nuts, seeds, tahini, nut/seed butters.
  - Omega-3 support is a positive when compatible; treat as opt-in rather than mandatory.
  - Keep saturated-fat-heavy additions (large amounts of butter, heavy cream, fatty cured meats) limited by default.
  - Fat stacking rule (permissive but bounded):
    - Multiple fat sources are allowed.
    - Default to **1 to 3** major fat sources where each has a distinct purpose (cooking medium vs emulsion vs finish).
    - If using 3+, briefly justify each; avoid redundant additions that only increase calories.
- Added-sugar-minimized.
- Sodium-aware with explicit targets (see 4c).

### 3b) Blood sugar / A1C friendly defaults (qualitative)
- Prefer mixed meals (protein + fat + fiber) over refined-carb-only meals.
- Use refined starches (like white rice) strategically as a supporting base, not the entire structure.
- Avoid sugar-sweetened sauces as a primary flavor driver.

### 3c) GI / reflux guidance (pared down; a few hard limits + negotiables)
Hard limits (default):
- No chocolate-based components.
- Avoid very greasy outcomes (oil slicks, heavy fried textures).
- Default heat: none to low (heat is a toggle).

Negotiables (default behavior, adjustable by user):
- Acid is allowed; prefer late-stage adjustable acid (finish with lemon/vinegar) rather than aggressively sharp early acid.
- Keep portion assumptions reasonable; avoid framing the dish as "eat a massive bowl right before bed."
- Keep fats controlled and emulsified; prefer measured oil and sauces that stay integrated.

Flavor safeguard:
- If GI defaults reduce flavor, compensate with non-irritant techniques first (browning, toasted spices, aromatics, herbs, zest), then offer acid/heat as optional finish toggles.

---

## 4) Method constraints (how to hit health + flavor together)

### 4a) Preferred methods
- Sear + deglaze + simmer (controlled fat, high flavor).
- Roast/oven-bake/air-fry style (crisping without deep frying).
- Braise/pressure-cook for bean-forward or tougher cuts (portion and fat managed).
- Quick pickles and herb finishes for brightness without sugar.

### 4b) Avoid by default
- Deep frying.
- Cream-heavy sauces as the core of the dish.
- Sugar-forward glazes.
- "Dump and bake" methods that produce bland results without corrective steps.

### 4c) Sodium targets + explicit levers (default)
Sodium levels are classification guidance, not a hard requirement unless the user requests low sodium.
- If nutrition is computed, report:
  - Sodium (mg) per serving
  - Sodium per 1000 kcal (mg)
- If nutrition is not computed, do not claim numeric sodium levels; still provide drivers + levers.

Sodium levels (project guidance; not medical):
- Low: < 500 mg/serving
- Moderate: 500 to 900 mg/serving
- High: > 900 mg/serving

Required behavior:
- Identify the top sodium drivers (top 3).
- Provide 2 to 4 concrete sodium levers, such as:
  - low-sodium stock vs regular
  - reduce soy/bouillon/cured meats
  - drain/rinse canned items
  - finish with acid/herbs instead of more salt
  - use no-salt-added tomato products
  - split salty components into “optional finish” rather than base

### 4d) Fat management playbook (default)
- Measure oil; avoid "free-pour" unless explicitly requested.
- Choose leaner cuts when the dish supports it; for fattier cuts, balance with high-veg and use fat-discard steps when appropriate.
- Use emulsification (pan sauce, yogurt-based sauce, blended beans/veg) to avoid oily mouthfeel.
- Prefer whole-food fat sources when they improve flavor and texture, and avoid redundant fat stacking.

### 4e) Spice and heat
- Default heat: none to low.
- Provide heat as an explicit toggle (add chile, hot sauce, pepper) rather than baking it into the base.

### 4f) “Don’t be weird” constraint (health substitutions)
- Do not introduce "diet substitutions" that change the soul of the dish (cauliflower rice everywhere, fat-free cheese, odd sweeteners) unless:
  - the user asks for it, or
  - the dish is explicitly a “lightened” version and the tradeoff is stated.
- If a substitution materially changes the dish identity, it must be labeled as a Variation (not silently integrated into the base recipe).

---

## 5) Pantry, shopping, and ingredient realism
Ingredient realism is defined as: can be actually purchased in the U.S., either:
- standard grocery, or
- specialty store (international market, butcher, spice shop), or
- reputable online retailer.

Specialty ingredients are allowed, but avoid ultra-specific regional brands as hard requirements.
If a specialty ingredient is used, provide:
- what to look for (brief)
- where to buy (generic category; no links unless requested)
- a common substitute that preserves technique when feasible

If a specialty ingredient is central to the dish:
- provide a second “mainstream substitute” variant when feasible.

---

## 6) Storage, freezer strategy, and food safety baseline
Storage stance:
- Prefer a few days in the fridge for near-term eating; freezer for the remainder.
- Freezer plan should target months (quality-first) and be portionable.

Food safety baseline (default; keep brief, non-medical):
- Cooling: portion hot food into shallow containers; cool promptly before refrigerating.
- Storage: refrigerate promptly; freeze portions intended for later-in-the-2-weeks window.
- Reheat: reheat leftovers until steaming hot; use 165 deg F for mixed leftovers when relevant.

---

## 7) Regional anchor and naming (variety discipline)
For full recipes and options lists:
- Declare a regional anchor when applicable (e.g., "Basque-ish," "Yucatan-inspired," "Sichuan adjacent").
- If the dish has a common non-English name, include it (and transliteration if relevant) in Recipe Metadata.
- Do not claim authenticity beyond what sources support; use "inspired," "adjacent," or "adapted" when appropriate.

---

## 8) Allowed deviations (when to break defaults)
It is acceptable to deviate from these constraints when:
- The user explicitly asks for a style that conflicts (e.g., "spicy," "cheesy," "restaurant-style rich").
- The traditional dish requires it and the user wants the traditional direction (note the tradeoff).
- A constraint would materially harm the dish and there is no good compensating technique; explain briefly.

---

## 9) Constraint QA checklist (quick pass before final output)
- Does the recipe meet the user's stated request and any explicit constraints?
- Is the yield/portioning consistent with the 10-portion default (or explicitly overridden) and does the portioning schema fit the dish?
- Is the ~2-week planned eating horizon supported by a concrete fridge (3 to 5 days) + freezer (months) plan?
- Are hard avoids respected (tilapia, catfish, chocolate) unless explicitly overridden?
- Is poultry not being used as the main course protein unless requested?
- Are there at least 2 vegetables (or an optional veg add-on/side is provided)?
- Is fat managed (no oil slick; no heavy-cream base by default; fat stacking rule respected)?
- Is sodium handled with technique first AND are sodium drivers + levers explicitly listed (without inventing numbers when not computed)?
- Is heat optional unless requested?
- Are make-ahead and leftovers instructions concrete and realistic (portioning, packaging, and reheat correction)?
- Are specialty ingredients actually purchasable, with sourcing guidance and substitutes when feasible (and a mainstream variant if central)?
- Are "diet substitutions" avoided unless requested (don’t be weird rule)?
- Is the regional anchor appropriately cautious (no overstated authenticity)?
