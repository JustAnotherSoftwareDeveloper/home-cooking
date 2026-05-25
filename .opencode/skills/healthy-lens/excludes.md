# healthy_excludes.md

## 0) Purpose and precedence
This file defines default constraints for "healthy recipe" generation in this project, with added emphasis on gut tolerance, macronutrient quality, ancestry-informed risk filtering, and freezer performance.

Precedence order:
1) The user's explicit request in the current prompt (wins).
2) Any explicit constraints stated in the recipe request (diet, time, equipment, ingredients).
3) This file (defaults and toggles).
4) Generic best practices.

If a constraint conflicts with a stated user preference or request, do not argue. Apply the user's request and note the deviation briefly under Constraints.

Do not paste this file into recipe outputs. Recipes should reference only the relevant toggles/constraints applied.

---

## 1) Baseline stance (always on unless the user overrides)
Baseline goal: make-ahead, nutrient-dense, macro-sound, repeatable recipes that store well, freeze well, portion cleanly, and stay tasty.

Always-on baseline rules:
- Batch size by default: target **10 portions**.
- Portioning schema (required):
  - Volumetric dishes (soups, stews, chilis, pasta-ish bowls): portion into **10 x ~2-cup containers**.
  - Non-volumetric plates (sheet-pan meals, grain bowls with discrete components): portion into **10 meal-sized portions** using a component plan (protein + veg + starch) and/or a grams-per-component target that is broadly equivalent to a real 2-cup meal.
  - Non-cup-friendly items (steaks, sandwiches, patties): portion into **10 meal-sized portions** with a packaging plan (wrap, freeze, and reheat guidance), without forcing "cups."
  - For non-volumetric formats, the default target is a true meal portion, not a snack portion, unless the user explicitly asks for snack-sized output.
- Planned eating horizon: **~2 weeks total**, achieved by:
  - Fridge: **3 to 5 days** of portions for near-term eating.
  - Freezer: the remaining portions, planned for **months** (quality-first) in portionable packages.
- Freezer-friendliness is a primary design goal: prefer dishes, components, and textures that survive freezing and reheating with minimal quality loss.
- Make-ahead required: include at least one meaningful pre-prep pathway (sauce/base, chop kit, marinate, par-cook starch, freezer portioning).
- Freezer plan required: include a clear freeze point, packaging plan, thaw path, and reheat correction when the dish is intended for batch cooking.
- Veg-forward: include at least 2 distinct vegetables unless the dish definition makes that unreasonable; if not, provide an optional veg add-on or side.
- Onion does not count toward the vegetable minimum because it is excluded by default.
- Protein-present: include a clear primary protein (animal or plant) and avoid "carb-only" mains by default.
- Good macronutrient structure is important: default to meals that are meaningfully protein-forward, include fiber where the dish supports it, and avoid recipes that are mostly starch + fat with token protein.
- Fiber should be **fiber-appropriate**, not automatically maximized. Apply §9 for fiber-type, bran-heavy grain, and high-residue stacking rules.
- Added sugar minimal: avoid sugar-forward sauces and glazes by default; if sweetness is needed, keep it functional and explain why.
- Sodium-aware by default: use technique and structure first (browning, spice blooming, acid balancing, herbs, texture contrast) before relying on salt-heavy condiments.
- Fat-managed by default: avoid greasy outcomes; prefer controlled fat additions and methods that do not leave pools of oil.
- Technique realism: no steps that require restaurant-only gear or implied professional skill without providing fail-safes.
- Flavor is non-negotiable: if a constraint threatens flavor, compensate with technique (browning, toasting spices, deglazing, acid balance, texture, herbs) rather than health gimmicks.

---

## 2) User preference constraints (project defaults)
These are defaults for this project. The user can override at any time.

### 2a) Hard avoids (do not use unless explicitly requested)
- Chocolate (as an ingredient or flavor base)
- Onion in any meaningful amount
- Mushrooms in any meaningful amount

### 2b) Trace-only exception policy (important nuance)
The hard avoids above allow a narrow trace-only exception unless the user says zero tolerance.
- "Trace" means an amount small enough that it is not a meaningful flavor base, bulk ingredient, or texture contributor in the finished dish.
- Do not build recipes around onion or mushroom as aromatic foundations, vegetable volume, or umami anchors under default rules.
- If a trace amount is present through a minor seasoning blend, sauce, or background accent, disclose it clearly.
- When in doubt, treat onion and mushroom as excluded rather than trying to game the threshold.

### 2c) Soft avoids (use sparingly; offer alternatives)
- Extremely hot or aggressive chile-forward builds that push beyond a warm/medium heat baseline.
- Greasy, high-oil preparations (deep-fry, shallow-fry, confit-style, heavy cream sauces).
- High-sodium builds (salt-heavy marinades, salty stocks/bouillon, cured-meat-forward dishes) unless the user asks.
- Gluten-grain-heavy builds by default; assume mild gluten sensitivity and prefer non-gluten or lower-gluten structures when the dish can support them cleanly.
- Bran-heavy or rough whole-grain builds by default; apply §9.

### 2d) Poultry stance (important nuance)
- Poultry is acceptable as an ingredient.
- Default: do not use poultry as the **main course protein** unless the user explicitly asks for it.
- Definition: main course protein = the largest named protein component by weight/serving (the centerpiece protein).
- Poultry may be used in supporting roles (stock/broth; small amounts of sausage; mixed dishes where poultry is not the primary protein) unless it becomes the primary protein.

### 2e) Non-freezer-friendly protein stance (important nuance)
- Proteins that usually freeze or reheat poorly are acceptable as ingredients.
- Default: do not use a **non-freezer-friendly protein** as the main course protein unless the user explicitly asks for it.
- Definition: main course protein = the largest named protein component by weight/serving (the centerpiece protein).
- These proteins may be used in supporting roles or in recipes not intended for freezer batch prep unless they become the primary protein.
- Treat this as a performance rule, not a moral one: if the protein predictably turns watery, tough, rubbery, dry, fishy, or otherwise degrades after freezing and reheating, it is a poor default centerpiece for this project.
- Common examples include:
  - delicate white fish fillets
  - shrimp in formats that are reheated from frozen
  - delicate seafood more broadly when the texture is likely to turn rubbery or watery
  - any protein with a clear real-world pattern of poor freeze/reheat performance in the intended dish format
- Judge this by observed freezer reliability in the finished dish, not by prestige, cuisine, or health halo.

### 2f) Generally compatible / preferred
- Red meat is generally well-tolerated; still manage saturated fat and portioning via cut choice and technique.
- Garlic is tolerated and may be used as a normal aromatic, but avoid making it aggressively garlic-forward unless the user asks.
- Beans/legumes are positive when the dish supports them, especially when well-cooked and used in moderate portions. Apply §9 when beans are paired with whole grains, raw vegetables, seeds/nuts, or high-fat sauces.
- Tomatoes are generally acceptable.
- Non-bran rice is generally acceptable:
  - White rice, sushi rice, jasmine rice, and similar non-bran rice paths are preferred by default when GI tolerance matters.
  - Brown rice is downranked by default under §9 because it is bran-intact and higher-residue.
- Whole grains are optional and should be framed as a toggle, not a mandate.
- Bran-heavy whole grains are a separate tolerance concern from gluten; apply §9 for examples and mitigation rules.
- Non-gluten and lower-gluten starch paths are generally preferred over gluten-grain-heavy builds when the dish can support them cleanly.
- Avocado oil is the default cooking oil preference.

### 2g) Dairy stance (default)
- Dairy-light by default.
- Prefer lower-lactose options when dairy is used (yogurt, aged cheeses, lactose-free dairy) and avoid heavy cream reliance.
- Keep dairy as a finish or accent rather than a bulk base unless user requests otherwise.

### 2h) Aromatic handling (default)
Garlic is acceptable; onion is excluded by default. Build flavor with normal culinary technique while avoiding onion as a base.

Default aromatic/flavor tools:
- garlic, used moderately unless the user requests garlic-forward
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

Rules:
- Do not use onion as an aromatic foundation, vegetable volume, or bulk sweetness source unless the user explicitly requests it.
- Scallion greens and chives are related to onion and should not be assumed safe.
- Scallion greens and chives are not default-safe substitutes; use them only when the current thread explicitly confirms they are tolerated.
- Do not rely on gimmick substitutes unless the user asks.

### 2i) Ancestry-informed gut-risk layer (important nuance)
This is a risk-management layer, not a diagnosis.
- Use this layer to bias defaults toward high-yield exclusions that are plausibly relevant to Ashkenazi Jewish and Turkish ancestry.
- Keep this layer narrow. Do not turn ancestry into a giant speculative blacklist.
- Prefer soft blockers and conditional rules unless there is a strong reason for a hard stop.
- If the user has been formally tested or has strong personal tolerance data, that overrides this layer.

### 2j) Lactose-heavy dairy stance (important nuance)
- Lactose-heavy dairy is acceptable as an ingredient.
- Default: treat **lactose-heavy dairy** as a **soft blocker** unless the user explicitly wants it or has known good tolerance.
- Definition: lactose-heavy dairy = dairy where lactose remains a meaningful load in the serving, especially when it is used as a bulk base rather than a minor accent.
- Prefer lower-lactose dairy paths by default:
  - yogurt
  - aged hard cheeses
  - lactose-free milk or lactose-free dairy products
- Down-rank or avoid these as default backbone ingredients:
  - regular milk
  - half-and-half
  - cream-heavy milk bases
  - evaporated milk
  - condensed milk
  - ice cream
  - milk powder or dry milk solids when used meaningfully
  - whey-concentrate-heavy products
  - fresh soft cheeses when used in large amounts
- This is a gut-tolerance rule, not an anti-dairy rule. Small amounts of lower-lactose dairy may still be compatible.

### 2k) Gluten-grain stance (important nuance)
- Gluten grains are acceptable as ingredients.
- Default: treat **gluten grains** as a **soft blocker** unless the user explicitly wants them or has known good tolerance.
- Definition: gluten grains = wheat, barley, rye, and direct derivative ingredients that materially contribute gluten exposure.
- This is broader than "lower wheat." If gluten is the issue, a wheat-only rule is too narrow.
- Bran-heavy grains are also downranked under §9. This applies even when gluten is not the suspected issue.
- Some foods, such as barley, farro, bulgur, and spelt, may be downranked under both gluten-grain and fiber-type rules.
- Prefer non-gluten starch paths when the dish does not depend on gluten structure:
  - rice
  - potatoes
  - cornmeal / polenta
  - oats only when tolerated; if a stricter gluten-avoidance path is needed, use appropriately sourced oats or avoid them
  - legumes
  - mixed-starch builds that do not rely on wheat, barley, or rye structure
- Down-rank or avoid these as default backbone ingredients:
  - wheat flour
  - bread flour
  - semolina
  - farro
  - bulgur
  - couscous
  - barley
  - rye
  - spelt
  - malt / malt extract / malt syrup
  - regular beer in cooking
  - wheat-based soy sauce unless the user explicitly accepts it
- When gluten structure is central to the dish identity, keep the rest of the build supportive and offer a lower-gluten or gluten-free variation when feasible.

### 2l) Fava / broad bean stance (conditional hard stop)
- Fava beans and broad beans are acceptable as ingredients only under a specific condition.
- Default: treat **fava beans / broad beans** as a **conditional hard stop** unless G6PD deficiency has been ruled out or the user explicitly accepts the risk.
- Reason for the default: this is not mainly a GI rule; it is a safety-oriented ancestry-informed rule because fava beans are a classic trigger for hemolysis in G6PD deficiency.
- This applies to:
  - fresh fava beans
  - dried fava beans
  - broad bean purees
  - dishes built around fava as a primary legume
  - mixed legume dishes where fava is a meaningful component
- If a cuisine-specific dish traditionally uses fava, flag it clearly rather than silently substituting.

### 2m) Do not create broad ancestry-based food bans beyond the categories above
Default rule:
- Do **not** add broad bans for inflammatory bowel disease, familial Mediterranean fever, or other ancestry-linked conditions to the main excludes file unless there is a direct, high-yield, food-specific reason.
- These conditions may matter clinically, but the evidence does not support a large default ancestry blacklist.
- Keep weaker possibilities in a personal trigger log instead of the core excludes file unless the user has confirmed diagnosis or consistent symptom data.

Examples of things that should stay out of the main excludes unless the user's own history supports them:
- broad raw-vegetable bans
- blanket legume bans
- generic nut bans
- tomato bans
- nightshade bans
- universal spicy-food bans
- histamine-food bans
- broad high-fiber bans outside of an explicit flare-management context

### 2n) Personal-trigger watchlist (optional layer; not a default exclude list)
Use this only when the user reports repeated personal reactions or has a confirmed related diagnosis.
Potential watchlist categories:
- very high-fat meals
- very salty meals
- rough or high-residue foods during an active flare-style period
- alcohol-heavy foods or cooking methods
- highly processed foods clearly associated with symptoms

Rules:
- Watchlist items are not default exclusions.
- They become exclusions only when the user has a repeatable pattern, a formal diagnosis, or explicitly asks for stricter filtering.
- The rough/high-residue category is a flare-state escalation, not a blanket ban. In ordinary recipe generation, apply §9 instead.

---

## 3) Health orientation constraints (non-medical)
This project uses practical, non-medical "generally healthy" defaults with added emphasis on gut tolerance and macro quality.

### 3a) Composition defaults (qualitative)
Aim for meals that are:
- Protein-forward relative to carbs.
- Fiber-appropriate via legumes, vegetables, and optionally whole grains when tolerated. Apply §9 for fiber type, bran-heavy grains, and high-residue stacking.
- Macro-balanced enough to function as real meals rather than snack-shaped starch dishes.
- "Healthy fats" forward:
  - Prefer fats that are predominantly mono- and polyunsaturated where they fit.
  - Prefer whole-food fat sources when they improve texture/flavor: avocado, nuts, seeds, tahini, nut/seed butters.
  - Omega-3 support is a positive when compatible; treat as opt-in rather than mandatory.
  - Keep saturated-fat-heavy additions (large amounts of butter, heavy cream, fatty cured meats) limited by default.
  - Fat stacking rule (permissive but bounded):
    - Multiple fat sources are allowed.
    - Default to **1 to 3** major fat sources where each has a distinct purpose (cooking medium vs emulsion vs finish).
    - If using 3+, briefly justify each; avoid redundant additions that only increase calories.
    - Apply §9 when fat is paired with bran-heavy grains, high-residue ingredients, legumes, seeds, or nuts.
- Added-sugar-minimized.
- Sodium-aware with explicit targets (see 4c).

### 3b) Blood sugar / A1C friendly defaults (qualitative)
- Prefer mixed meals (protein + fat + fiber) over refined-carb-only meals.
- Use refined starches (like white rice) strategically as a supporting base, not the entire structure.
- Avoid sugar-sweetened sauces as a primary flavor driver.
- Prefer macro layouts that blunt a starch hit with adequate protein, fat, and fiber when the dish format allows.
- Mixed meals should still respect GI tolerance; apply §9 to avoid overbuilt bowls that combine several high-residue components.

### 3c) GI / gut-tolerance guidance (pared down; a few hard limits + negotiables)
Hard limits (default):
- No chocolate-based components.
- No meaningful onion.
- No meaningful mushroom.
- Avoid very greasy outcomes (oil slicks, heavy fried textures).
- Default heat: warm to medium is acceptable; extreme heat is optional, not default.

Negotiables (default behavior, adjustable by user):
- Garlic is tolerated and may be used normally; keep garlic-forward intensity optional unless requested.
- Acid is allowed; prefer late-stage adjustable acid (finish with lemon/vinegar) rather than aggressively sharp early acid.
- Keep portion assumptions reasonable; avoid framing the dish as "eat a massive bowl right before bed."
- Keep fats controlled and emulsified; prefer measured oil and sauces that stay integrated.
- Prefer non-gluten, lower-gluten, or mixed-starch structures when feasible; do not force gluten-grain-heavy formats when a good rice-, potato-, corn-, oat-, or legume-based path exists.
- Apply §9 when the dish uses bran-heavy grains, rough/high-residue ingredients, large legume portions, raw vegetables, seeds/nuts, or high-fat sauces.
- Prefer cohesive, moisture-rich starch formats over dry grain bowls when GI tolerance is a priority.

Flavor safeguard:
- If gut-tolerance defaults reduce flavor, compensate with non-irritant techniques first (browning, toasted spices, garlic when appropriate, ginger, herbs, zest, tomato paste, texture contrast), then offer acid/heat as adjustable finish toggles.

### 3d) Freezer-performance bias
For make-ahead cooking, prefer foods that:
- reheat without turning greasy, mushy, watery, grainy, or rubbery,
- portion cleanly into freezer containers or wraps,
- tolerate thaw/reheat cycles with limited texture collapse,
- and can be corrected on reheat with a clear texture-reset step when needed.

Down-rank dishes that are known to freeze poorly unless the user specifically asks for them.

---

## 4) Method constraints (how to hit health + flavor together)

### 4a) Preferred methods
- Sear + deglaze + simmer (controlled fat, high flavor).
- Roast/oven-bake/air-fry style (crisping without deep frying).
- Braise/pressure-cook for bean-forward or tougher cuts (portion and fat managed).
- Quick pickles and herb finishes for brightness without sugar.
- Batch methods that freeze and reheat cleanly.
- Moist, integrated formats for higher-fiber meals: stews, braises, saucy bowls, pressure-cooked legumes, and softer cooked starches.

### 4b) Avoid by default
- Deep frying.
- Cream-heavy sauces as the core of the dish.
- Sugar-forward glazes.
- "Dump and bake" methods that produce bland results without corrective steps.
- Gluten-grain-heavy builds when an equally good non-gluten or lower-gluten path exists.
- Dry grain-bowl formats that stack bran-heavy grains, legumes, raw vegetables, seeds/nuts, and high-fat sauces without a clear mitigation strategy. Apply §9 as the central rule.

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
  - split salty components into "optional finish" rather than base

### 4d) Fat management playbook (default)
- Measure oil; avoid "free-pour" unless explicitly requested.
- Choose leaner cuts when the dish supports it; for fattier cuts, balance with high-veg and use fat-discard steps when appropriate.
- Use emulsification (pan sauce, yogurt-based sauce, blended beans/veg) to avoid oily mouthfeel.
- Prefer whole-food fat sources when they improve flavor and texture, and avoid redundant fat stacking.
- Apply §9 when fat is paired with bran-heavy grains, high-residue ingredients, legumes, seeds, or nuts.

### 4e) Spice and heat
- Default heat: warm to medium.
- Heat should be integrated with control, not as a punishment-level gimmick.
- Provide extreme heat as an explicit toggle rather than baking it into the base unless the user asks.

### 4f) Gluten-grain and starch handling
- Do not treat gluten grains as universally forbidden, but treat them as a soft blocker.
- Treat bran-heavy grains as a separate downrank category from gluten. This rule applies even when gluten is not the suspected issue.
- Apply §9 as the central authority for bran-heavy grain examples, meal-composition guardrails, and mitigation strategies.
- Some foods, such as barley, farro, bulgur, and spelt, may be downranked under both gluten-grain and fiber-type rules.
- When gluten structure is central to the dish identity, keep the rest of the build supportive (protein, fiber, fat, sodium control) and offer a lower-gluten or gluten-free variation when feasible.
- When gluten structure is not central, prefer rice, potatoes, cornmeal, oats when tolerated and appropriately sourced, legumes, or mixed-starch structures if they perform as well or better.
- Prefer cohesive starch formats over dry grain bowls when gut tolerance is part of the recipe goal.
- If using whole grains, prefer softer cooking, higher hydration, and simpler pairings over chewy/separate grains plus multiple other fiber sources.

### 4g) "Don't be weird" constraint (health substitutions)
- Do not introduce "diet substitutions" that change the soul of the dish (cauliflower rice everywhere, fat-free cheese, odd sweeteners) unless:
  - the user asks for it, or
  - the dish is explicitly a "lightened" version and the tradeoff is stated.
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
- provide a second "mainstream substitute" variant when feasible.

---

## 6) Storage, freezer strategy, and food safety baseline
Storage stance:
- Prefer a few days in the fridge for near-term eating; freezer for the remainder.
- Freezer plan should target months (quality-first) and be portionable.
- Recipes that are explicitly batch-oriented should assume freezer use unless the user says otherwise.
- Freezer instructions should be concrete: best freeze point, portioning format, packaging note, thaw path, reheat method, and texture-reset cue.

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
- The user explicitly asks for a style that conflicts (e.g., "extra spicy," "cheesy," "restaurant-style rich").
- The traditional dish requires it and the user wants the traditional direction (note the tradeoff).
- A constraint would materially harm the dish and there is no good compensating technique; explain briefly.

---

## 9) Fiber-Type and Texture Tolerance Guidance
This section centralizes the fiber and starch-selection rules used throughout the file.

Core principle:
- Do not treat "high fiber" as automatically better. Prioritize fiber type, preparation, portion size, moisture, and overall meal composition.

Prefer by default:
- Soluble/gel-forming or softer-cooked fiber patterns:
  - oats when tolerated
  - well-cooked legumes in moderate portions
  - peeled or softly cooked vegetables
  - stews, braises, saucy bowls, and pressure-cooked formats
  - potatoes, white rice, cornmeal/polenta, and other cohesive starch bases when appropriate

Downrank by default:
- Bran-heavy or rough/high-residue foods, especially when used as the starch base:
  - brown rice
  - wheat bran
  - wheat berries
  - farro
  - bulgur
  - barley
  - bran cereals
  - very coarse whole-grain breads or grain bowls
- Large rough plant-structure loads:
  - raw crucifers
  - thick vegetable skins
  - large seed or nut loads
  - raw greens used as a major bulk component
  - chewy/separate-grain formats with minimal moisture

Meal-composition guardrails:
- Downrank meals that stack several rough/high-residue fiber sources unless the recipe uses soft cooking, moderate portions, and enough moisture.
- Be especially cautious with combinations like:
  - bran-heavy grain + legumes + raw vegetables
  - whole grain + seeds/nuts + high-fat dressing
  - brown rice + beans + raw greens
  - barley/farro/bulgur + legumes + high-sodium sauce
- Avoid high fat + high insoluble-fiber pairings by default. If used, simplify the rest of the dish and keep the format moist.
- Use white rice, potatoes, cornmeal/polenta, oats when tolerated, or moderate well-cooked legumes as default starch/fiber anchors when the dish does not require a bran-heavy grain.

Mitigation strategies when whole grains are requested:
- Use smaller portions.
- Cook softer and wetter than usual.
- Pair with a moist sauce, stew base, or braise.
- Avoid adding multiple other rough fiber sources.
- Keep fat measured and integrated rather than oily.
- Keep sodium drivers controlled and move salty elements to optional finishes where feasible.

---

## 10) Constraint QA checklist (quick pass before final output)
- Does the recipe meet the user's stated request and any explicit constraints?
- Is the yield/portioning consistent with the 10-portion default and the 10 x ~2-cup meal target (or explicitly overridden)?
- Is the ~2-week planned eating horizon supported by a concrete fridge (3 to 5 days) + freezer (months) plan?
- Is freezer performance treated as a primary design concern when the dish is make-ahead or batch-oriented?
- Are hard avoids respected (chocolate, meaningful onion, meaningful mushroom) unless explicitly overridden?
- Are trace-only exceptions disclosed rather than hidden?
- Is garlic treated as tolerated and usable, rather than excluded?
- Is onion still excluded unless explicitly requested?
- Is poultry not being used as the main course protein unless requested?
- Are non-freezer-friendly proteins avoided as the main course protein unless requested?
- Are lactose-heavy dairy ingredients being treated as a soft blocker unless explicitly requested?
- Are gluten grains being treated as a soft blocker rather than only wheat?
- Are bran-heavy grains handled as a separate downrank category from gluten?
- Is brown rice downranked by default unless requested or clearly mitigated?
- Are fava / broad beans blocked unless G6PD deficiency has been ruled out or the user explicitly accepts them?
- Did the recipe avoid inventing a broad ethnicity-based blacklist beyond the high-yield categories above?
- If watchlist items were restricted, was that restriction tied to user history, diagnosis, or explicit request rather than ancestry alone?
- Are there at least 2 vegetables (or an optional veg add-on/side is provided)?
- Is macro structure sound (clear protein, not mostly starch + fat, fiber included where the dish supports it)?
- Fiber-type check:
  - Is fiber treated as fiber-appropriate rather than automatically maximized?
  - Are soluble/gel-forming or softly cooked fiber paths preferred when gut tolerance matters?
  - Does the recipe avoid stacking several rough/high-residue fiber sources unless mitigated by soft cooking, moderate portions, and enough moisture?
  - Does the recipe avoid high-fat + high-insoluble-fiber pairings unless clearly mitigated?
- Is fat managed (no oil slick; no heavy-cream base by default; fat stacking rule respected)?
- Is sodium handled with technique first AND are sodium drivers + levers explicitly listed (without inventing numbers when not computed)?
- Is heat warm/medium by default unless the user requested milder or hotter?
- Are gluten grains handled as a soft blocker rather than a silent default, with a non-gluten or lower-gluten path when feasible?
- Are make-ahead and leftovers instructions concrete and realistic (portioning, freezing, packaging, and reheat correction)?
- Are specialty ingredients actually purchasable, with sourcing guidance and substitutes when feasible (and a mainstream variant if central)?
- Are "diet substitutions" avoided unless requested (don't be weird rule)?
- Is the regional anchor appropriately cautious (no overstated authenticity)?
