# Recipe filename conventions

Simple, readable, and consistent names make recipes easy to find and link. Use these rules for all recipe Markdown files.

## TL;DR
- lowercase kebab-case (words separated by hyphens)
- only: a-z, 0-9, and hyphens (-)
- keep it short (<= 80 chars, <= 8 words)
- base it on the dish name; add at most 1-2 qualifiers (key ingredient, method, or diet) when needed
- file extension is always `.md`

Examples
- chicken-noodle-soup.md
- eggplant-parmesan-baked.md
- shrimp-tacos-grill.md
- gluten-free-banana-bread.md
- kimchi-fried-rice.md

## Rules
1) Case and separators
	- Use lowercase only.
	- Use hyphens between words (kebab-case). Do not use spaces or underscores.

2) Allowed characters
	- Use ASCII letters a-z, digits 0-9, and hyphens (-) only.
	- Drop punctuation (commas, apostrophes, quotes, slashes, ampersands, parentheses, emojis).
	- Transliterate accented characters (e.g., "creme brulee" for creme brulee) and then hyphenate: creme-brulee.

3) What to include (and what to leave out)
	- Start with the canonical dish name (what a cook would search).
	- Add at most 1-2 short qualifiers if they materially distinguish the recipe:
	  - key ingredient or variant: `tofu`, `salmon`, `sweet-potato`, `turkey`
	  - primary method/equipment: `grill`, `baked`, `air-fryer`, `slow-cooker`, `sheet-pan`
	  - diet (only if central): `vegan`, `gluten-free`, `keto`
	- Do not include tags, times, quantities, or episode numbers in filenames.
	- Do not duplicate metadata already captured in the Tags section/front matter.

4) Length & readability
	- Prefer 3-5 words; cap at 8 words or ~80 characters.
	- Remove stopwords unless they are part of the canonical dish name: a, an, the, and, with, of.

5) Singular vs plural
	- Use singular nouns unless the canonical dish is normally plural (e.g., cookies, tacos).

6) Duplicates
	- If a name collides, append a short meaningful qualifier rather than -v2 when possible
	  (e.g., chili-beef vs chili-turkey).
	- If still ambiguous, append a numeric suffix: -2, -3.

7) Directory placement
	- Place recipe files wherever they belong in your content structure.
	- These rules are about filenames only; directories can reflect collections (e.g., weekday/, desserts/).

## Anti-patterns (rename these)
- steak_brown_rice_black_bean_burritos.md -> steak-brown-rice-black-bean-burritos.md
- Creamy Black Sesame Miso Tofu!!.md -> creamy-black-sesame-miso-tofu.md
- pasta-alla-zozzona-quick-and-easy-30-minutes-weeknight-budget-air-fryer.md -> pasta-alla-zozzona.md (keep extras in Tags)

## Optional: quick slugify from a title
If you start from a human-friendly title, this Bash one-liner gets you most of the way:

```bash
slugify() {
	echo "$1" \
	| iconv -t ascii//TRANSLIT \
	| tr '[:upper:]' '[:lower:]' \
	| sed -E "s/['’]//g" \
	| sed -E 's/[^a-z0-9]+/-/g' \
	| sed -E 's/^-+|-+$//g' \
	| sed -E 's/-{2,}/-/g'
}

# Example
slugify "Creamy Black Sesame Miso - Tofu & Shiitake (Easy)"  # creamy-black-sesame-miso-tofu-shiitake-easy
```

Tip: keep qualifiers short; prefer moving extras into the recipe's Tags section (see `tags.md`).
