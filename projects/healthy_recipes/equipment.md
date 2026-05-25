# Equipment Authority (Kitchen Inventory and Fit Rules)

**Canonical authority for all equipment-fit decisions across all recipe workflows.**

Every file that makes equipment decisions must consult §1 and §2 of this file:

| Calling file | Where it hooks in | What it uses |
|---|---|---|
| `healthy_options.md` §Context & Constraints | "Equipment on hand" field | §1 inventory as default; user states exceptions only |
| `healthy_options.md` §Breadth scan | Equipment-fit search axis | §2 fit rules for down-ranking incompatible options |
| `healthy_template.md` §Equipment & Tools | Gear list in recipe body | §1 names, §3 substitutions, §Baking Vessels adjustments |
| `revisions.md` §6 | Equipment-fit and geometry pass | §1 inventory, §3 substitution hierarchy, §4 buy policy |
| `audit.md` §Pass 4 | Equipment-fit audit pass | Verify all recipe tools are in §1 or have a §3 substitute |

When this file is silent on a specific item (user confirms they own something not listed), apply §3 and add the item to §1 for future use.

---

## 1) Kitchen Inventory

All tables use the same schema: **Item | Size / Capacity | Material | Constraints | Status | Notes**

Status values: `preferred` | `reliable` | `avoid-unless-necessary` | `retired`

---

### Ovens

| Item | Size / Capacity | Material | Constraints | Status | Notes |
|---|---|---|---|---|---|
| Standard oven | Full-size | — | — | preferred | Default for all baking and roasting. Use when interior volume, sustained heat, or a full sheet pan is required. |
| Microwave / convection oven combo | Countertop | — | Smaller interior than standard oven; convection fan may run ~25°F hotter than stated temp | reliable | Use for small batches, reheating, and convection finishing when the main oven is occupied. Confirm temp calibration before precision baking. |

---

### Specialty Appliances

| Item | Size / Capacity | Material | Constraints | Status | Notes |
|---|---|---|---|---|---|
| Bread Maker — Hamilton Beach 29890 | 2 lb loaf max | — | Fixed-geometry pan; cycle programs are model-specific — confirm program names before specifying one in a recipe | preferred | Default for hands-off bread doughs and bakes. Can also mix and first-rise enriched doughs before hand-shaping. |
| KitchenAid Stand Mixer | Standard bowl (~5 qt) | — | Specify attachment in every recipe: dough hook / flat paddle / wire whisk | preferred | Default for doughs, batters, and whipped items. |
| Instant Pot — 6 QT | 6 QT | — | Max fill line is a hard batch ceiling; sauté mode has limited surface area — not suitable for high-volume browning | preferred | Available modes: pressure cook, slow cook, sauté, steam, rice/grain, yogurt. Account for 6 QT ceiling when scaling. |
| Cuckoo Rice Cooker | — | — | — | preferred | Default for plain and seasoned rice. Frees a stovetop burner. Also usable for grain-forward sides and rice-cooker one-pots. |
| Panini press (with waffle griddle attachment) | Countertop | Nonstick plates | Contact heat only; not suitable for open sautéing or saucing | reliable | Use as a flat contact griddle for flatbreads, quesadillas, and sandwiches. Swap plates for waffles and hash browns. |

---

### Stovetop Cookware

| Item | Size / Capacity | Material | Constraints | Status | Notes |
|---|---|---|---|---|---|
| Ceramic nonstick pans | Various | Ceramic-coated | No metal utensils; max ~400°F; never preheat dry; **cannot substitute for high-heat searing or broiling** | preferred | Default for eggs, fish, and delicate sautés. Do not use when the method requires sustained high heat. |
| Ceramic nonstick pots | Various | Ceramic-coated | Same constraints as nonstick pans | reliable | Everyday simmering, boiling, and gentle stovetop sauces. |
| Cast iron skillet | — | Cast iron | Heavy; slow to heat evenly; must be seasoned; avoid long acidic braises; oven-safe to very high temps | preferred | Default for deep browning, high-heat sears, cornbread, and skillet bakes. Strong radiant heat retention. |
| Carbon steel skillet | — | Carbon steel | Requires seasoning; lighter than cast iron; more temperature-responsive | reliable | High-heat alternative to cast iron. Heats faster; similar sear quality; better for stovetop-to-oven work where weight matters. |
| Stainless steel pots and pans | Various | Stainless steel | Sticks without adequate preheat and fat; requires active attention | reliable | Default for sauces, braises, reductions, and boiling. Deglazes well. Oven-safe to high temps. |

---

### Baking Vessels

**Calibration rules when substituting pan color or material:**
- Dark metal in place of light metal: reduce oven temp ~25°F **or** check doneness 5 min early.
- Glass in place of metal: expect gentler edge browning, longer heat retention, and slower cooling — may need 5–10 extra minutes; verify with a probe or toothpick.

| Item | Size | Material | Color | Constraints | Status | Notes |
|---|---|---|---|---|---|---|
| Sheet / baking tray | 13×9 | Metal | Light | — | preferred | General-purpose default. Fits wire racks. Use for sheet-pan meals, cookies, and roasting. |
| Sheet / baking tray | 8×8 | Metal | Light | — | preferred | Smaller batches; gentle browning. |
| Loaf pan | 9×5 | Metal | Light | — | preferred | Default for quick breads and yeasted loaves. |
| Baking tray | 9×9 | Metal | Dark | Bakes faster and darker; apply color calibration rule above | reliable | Use when a crispier bottom crust is desired; reduce temp ~25°F from any light-pan recipe. |
| Sheet / roasting trays | Various | Metal | Various | Color varies — note which pan you use | reliable | General roasting and overflow backup. |
| Baking pan | 8×8 | Glass | — | Retains heat longer; slower edge cooling; apply glass calibration rule above | reliable | Good for casseroles, custards, and bar cookies. |
| Baking pan | 13×9 | Glass | — | Same behavior as 8×8 glass | reliable | Default for large casseroles and layered bakes. |
| Wire racks | Fits 13×9 trays | Metal | — | — | preferred | Required for elevated cooling and convection-style airflow. Always use when air circulation is part of the method. |

---

### Processing and Mixing

| Item | Size / Capacity | Material | Constraints | Status | Notes |
|---|---|---|---|---|---|
| Food processor | — | — | — | preferred | Default for large-volume chopping, rough slicing, pie and tart doughs, nut butters, and thick pastes. |
| Blender | — | — | Vent lid when blending hot liquids | preferred | Default for smooth purees, soups, and wet sauces. |
| KitchenAid Stand Mixer | See Specialty Appliances | — | See Specialty Appliances | preferred | Listed above; repeated here for cross-reference. |

---

### Knives

| Item | Size / Capacity | Material | Constraints | Status | Notes |
|---|---|---|---|---|---|
| Chinese chef knife | — | Steel | — | preferred | Default for dense vegetables, rough chops. Wide blade useful for crushing and transferring. |
| 9-in chef knife | 9 in | Steel | — | preferred | Default Western all-purpose. Best for rocking cuts and general prep. |
| Santoku knife (×2) | — | Steel | — | preferred | Preferred for thin slices, delicate cuts, and boneless proteins. |
| Carving knife | — | Steel | — | reliable | Roasts and large whole proteins. |
| Paring knife | — | Steel | — | preferred | Detail work, peeling, and small-ingredient precision. |

---

## 2) Equipment-Fit Rules (Binding)

These rules apply in every workflow. Match all equipment references in output to a §1 item by name.

**All modes:**
- Use §1 item names exactly as written when listing equipment in any output.
- Keep geometry explicit every time: vessel size, batch depth, crowding limit.
- Keep heat-path explicit: burner level or oven temp, covered vs uncovered, when the lid or foil comes off.
- Do not assume tools outside §1 unless the user explicitly confirms ownership.

**Options mode** (see `healthy_options.md` §Context & Constraints and §Breadth scan before ranking):
- Score options partly on equipment-fit alongside flavor, time, and effort.
- Down-rank options requiring tools absent from §1 unless a §3 substitute exists.
- State equipment-fit reasoning explicitly in each option's **Why it fits** line.

**Recipe drafting** (see `healthy_template.md` §Equipment & Tools):
- List only §1 items or §3 substitutes; use §1 names throughout.
- When pan color or material changes outcome, apply the calibration rule from §Baking Vessels.
- List the preferred tool first; put the §3 alternate in parentheses.

**Revisions** (see `revisions.md` §6 Equipment-Fit and Geometry Pass):
- Diagnose against the actual §1 inventory; never diagnose against generic ideal equipment.
- Do not prescribe tools absent from §1 without meeting §4 recommendation policy.

**Audits** (see `audit.md` Pass 4):
- Verify every recipe tool is a §1 item or has a documented §3 substitute.
- Flag any tool assumption that goes beyond §1 without user confirmation as a Major issue.

---

## 3) Substitution Hierarchy

When the preferred tool is unavailable, use this order:
1. Another **preferred** item from §1 for the same task.
2. Another **reliable** item from §1 with a stated tradeoff.
3. A **new purchase** — only when §4 recommendation policy is met.

When substituting, always state:
- What changes in timing, browning, texture, or handling.
- What cue confirms the substitute is working.

**Common substitution pairs in this inventory:**

| Ideal tool | Best §1 substitute | Tradeoff to state explicitly |
|---|---|---|
| Cast iron skillet | Carbon steel skillet | Heats faster; less heat retention; sear quality similar; lighter for stovetop-to-oven. |
| Cast iron skillet | Stainless steel pan | Lower heat retention; increase preheat time; higher sticking risk without adequate fat. |
| Standard oven | Microwave / convection combo | Smaller interior; may run ~25°F hotter; reduce batch size; verify temp before precision baking. |
| Light metal 13×9 tray | Dark metal 9×9 tray | Bakes faster and darker; reduce temp ~25°F or pull 5 min early. |
| Metal baking pan | Glass baking pan | Retains heat longer; gentler edge browning; may need 5–10 extra min bake time; longer cooling window. |
| KitchenAid stand mixer | Food processor | Acceptable for many enriched doughs; gluten development varies; not suitable for whipped or aerated items. |
| Blender | Food processor | Chunky and dry work: food processor is better. Smooth wet purees: blender is better. |
| Ceramic nonstick pan | Cast iron or carbon steel skillet | **Ceramic nonstick is not a substitute for high-heat searing.** Use cast iron or carbon steel for any method that requires sustained high heat or crust development. |

---

## 4) Recommendation Policy (When to Suggest Buying)

Recommend a new purchase only when at least one of these conditions is true:
- No §1 item can physically perform the task.
- §1 gear predictably causes quality failures for this task (documented or clearly likely by method logic).
- The purchase has unusually high ROI given observed use patterns.
- The requested result is meaningfully easier, safer, or more repeatable with the new tool than with any §1 item.

When recommending:
- Name the purpose precisely.
- State minimum viable specs (size, material, capacity).
- State the best available §1 fallback path.

---

## 5) Equipment Output Standard

When emitting equipment lists in recipes, revisions, and audits:
- List critical tools first, then optional or alternate tools.
- Name items exactly as they appear in §1.
- Add size and material where they affect outcome.
- When pan color matters, include the calibration rule from §Baking Vessels.
- Include a one-sentence reason when a specific tool is critical to method success.
- Include substitutions only when they appear in §3.

---

## 6) Maintenance

To **add** a new item: append a row to the correct §1 table using the standard 6-column schema.

To **update** a constraint or note: edit the §1 row directly; do not add a duplicate entry.

To **retire** an item: change its Status to `retired` and add a note; do not delete the row.

If a recipe or revision repeatedly maps a failure to an equipment mismatch, update the Constraints or Notes column in §1 so every future output carries that corrective pattern forward automatically.
