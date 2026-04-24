---
name: research-workflow
description: Complete sourcing protocol for recipe research: source tiers, dedup rules, comment-mining, research packet schema, and pre-QA checklist.
compatibility: opencode
---

# Skill: research-workflow

Complete sourcing protocol for recipe research. Load before executing any research task.

---

## 1) Intensity levels

- **Deep (default for all modes):** broad candidate discovery before narrowing; strict source-family dedup; active search for disagreements and failure reports; comment-mining required; origin-language and adjacent-dish searches when applicable.
- **Lightweight (only when user explicitly requests a quick answer or rough brainstorm):** reduce candidate pool; skip comment-mining and multilingual queries; state "lightweight research only" clearly in output.

---

## 2) Mode-specific targets

### General (recipe-chef)
| Mode | Candidate pool | Final evidence set (distinct source families) |
|---|---|---|
| Options | 20-35 | 8-12 |
| Recipe | 12-20 | 6-9 |
| Revisions | 10-20 | 6-10 |

### Healthy (healthy-chef)
| Mode | Candidate pool | Final evidence set |
|---|---|---|
| Options | 15-25 | 5-8 |
| Recipe | 10-14 | 5-7 |
| Revisions | 8-15 | 5-7 |

---

## 3) Source tiers

**Tier 1 — Core, Individual, Hands-On**
- Identifiable cook with concrete steps and measurable details, plus evidence of real execution and/or meaningful troubleshooting.
- Social/video (YouTube/Instagram/TikTok) where the creator demonstrably cooks the dish with enough measurable detail or passes follow-up checks.

**Tier 2 — Corroborating, Technique-Focused**
- Specialty forums and Q&A threads with multi-user agreement and dated replies.
- Chef/practitioner/test-kitchen pieces with deep method discussion (not listicles).

**Regional Anchor (required when dish is region-linked)**
A source that credibly ties the dish to its origin or diaspora practice:
- Creator from the region/diaspora presenting the dish as lived practice.
- Region-specialist practitioner writeup or community cookbook.
- Bilingual or origin-language source with authentic usage and method.

**Baseline recipe sites (triangulation only; never the sole basis)**
- Sanity-check ratio bands, temps/times, and terminology only.
- Mark as [secondary]; never use to define flavor profile or cultural framing.

### Hard requirements (always)
- 2+ Tier 1 individual creators (distinct people/handles; not the same person republished).
- 1+ long-form blog/personal site (text-first; not an aggregator).
- 1+ video/social source (YouTube preferred).
- 1+ discussion/feedback-loop source (forum thread or substantial comment section with troubleshooting).
- Regional Anchor when the dish has clear regional/cultural provenance.

---

## 4) Source-family dedup (strict)
Treat as one source family unless a specific exception is documented:
- Same creator across platforms.
- Same domain with same author.
- Same publication group or editorial network.
- Mirrored, syndicated, or template-shared content.
- Multiple pages that are minor variants of the same underlying method.

A source only counts as distinct if it adds materially independent evidence.

---

## 5) Exclusion policy (no blogspam)

**Immediate exclusion signals (any one is sufficient):**
- Content-farm pattern: template intros, endless filler, weak or generic method.
- Contradictory ingredients vs. steps, or missing measurable parameters with no clarifications.
- "Ultimate/best ever" roundup/listicle framing with shallow method content.
- Identical or near-identical text across multiple domains.
- Unclear authorship (no real identity, fake bios) with no evidence of iterative cooking.

**Search hygiene:**
- Negative filters: `-pinterest -buzzfeed -listicle -roundup` plus `-ai -chatgpt` when needed.
- Avoid recipe aggregators by default.

---

## 6) Search protocol

### Step 0: Identify provenance
- Determine whether the dish is strongly region-linked.
- Identify origin-language name(s) or common transliterations.

### Step 1: Build 4-6 queries
Bias toward competence signals: `tested` `trial` `notes` `method` `why it works` `technique` `ratio` `by weight` `grams` `step by step` `texture cues` `temperature` `thermometer`.

**Multilingual requirement (when applicable):** run at least 1-2 queries using the origin-language name/transliteration before finalizing the shortlist.

### Step 2: Build the candidate pool
Pull candidates per mode targets. Bias toward strong authenticity signals (§8), not just popularity.

### Step 3: Shortlist to final evidence set
Apply dedup rules. Ensure Regional Anchor is included when required. Avoid "different mirrors of the same recipe."

### Step 4: Comment-mining deep dive (required)
- Blogs/recipe pages: review at least 60 comments (or all if fewer), prioritizing outcome reports, substitutions, failures.
- YouTube: at least 150 comments (100 Top + at least 50 Newest); capture creator replies and pinned corrections.
- Forums: read full thread if reasonable; otherwise top-level posts + most upvoted + most disputed replies.

Comment-mining must produce: at least 3 recurring failure modes + at least 3 corrective adjustments/guardrails.

### Step 5: Viral recipe containment
If dish/technique is trending:
- Require 2+ independent Tier 1 creators (not referencing each other).
- Require 1 Regional Anchor or non-viral anchor (cookbook/practitioner/older source).
- Treat baseline recipe sites strictly as [secondary].

### Step 6: Recordkeeping
- Record publish/update dates and access dates.
- Save archive snapshot for fragile sources (IG/TikTok) when practical.

---

## 7) Data extraction

**Minimum (all pool candidates):** yield & vessel, time/temperature, core ratios, standout technique note. Use to qualify or exclude.

**Full (shortlisted sources only):**
- Yield & vessel: pan/tin dimensions, pot capacity, batch size.
- Time/temperature: preheats, simmer/bake ranges, internal targets.
- Core ratios: salt per lb/%, hydration %, fat %, spice ratios, flour:liquid.
- Technique & sequence: order of ops, rests/ferments, cut/grind sizes, emulsification.
- Cues: texture/visual/audio checkpoints (nappe, windowpane, bead size, sizzle level).
- Tools & materials: required/optional gear.
- Distinctives: choices to surface as variations.
- Comment-mined findings: failure modes + corrections/guardrails.

---

## 8) Reconcile and decide

- Identify the overlapping ratio band (e.g., 1.6-2.2% salt; 65-70% hydration).
- Choose a grounded middle; surface authentic alternatives as variations.
- Convert to U.S. customary units; include metric in parentheses when source is metric.

**No inference rule:**
- Do not fill in missing measurable details from intuition.
- A parameter may only be adopted if it appears in a primary source, OR is supported by at least 2 independent sources, OR is clarified by creator replies corroborated by at least one other independent source.
- If it cannot be validated: leave it as an open question or an explicitly uncertain variation.

If deviating from a popular method: include a one-line rationale grounded in comment-mined failures or multi-source disagreement.

---

## 9) Authenticity signals and follow-up checks

### Positive signals (strong indicators)
- Technique specificity: weights/ratios, temps, pan sizes, cut sizes, timing ranges, sensory cues.
- Evidence of real execution: process checkpoints, visible intermediate states, acknowledged edge cases.
- Iterative competence: explicit troubleshooting, what to do if it breaks, adjustments by environment.
- Feedback loop: meaningful comments/Q&A and creator replies; pinned corrections; updates over time.
- Creator legitimacy: consistent identity and body of work.
- Independence: method and prose feel unique, not re-skinned from a shared template.

### Red flags (blogspam / content-farm)
- Generic or templated language; long filler intros; "SEO voice."
- Missing measurable parameters; contradictions between ingredients and steps.
- Copy-like structure repeated across many recipes on the same site.
- Duplicate text across domains; syndication networks.
- Social content that is purely aesthetic with no method, no quantities, no clarifying replies.

### Follow-up checks (required when borderline; do at least 2)
1. Identity check: About page/creator profile; consistency across posts; non-syndicated presence.
2. Method check: are key measurable parameters present or clarified in comments/replies?
3. Evidence check: does the source show intermediate states and technique moments?
4. Feedback-loop check: do comments reveal real outcomes; does the creator respond?
5. Duplication/network check: spot-check a unique sentence; if it appears elsewhere, exclude.

### Quick scoring (optional; 0-2 each; 10 max)
Technique specificity / Evidence of execution / Troubleshooting depth / Feedback loop quality / Independence

- 8-10: strong Tier 1/2 candidate
- 5-7: borderline; include only if it fills a required slot and passes follow-up checks
- 0-4: exclude

---

## 10) Video and social (use + follow-up checks)

- Full measurements and clear technique: can be Tier 1 driver.
- Missing key measurable details: can inform technique cues and sequencing, but cannot set final ratios/times/temps unless validated per §8.
- Always apply §9 follow-up checks for IG/TikTok.
- Check caption/description, pinned comments, and creator replies for missing quantities.
- Cross-check adopted measurable claims against at least one other independent source.

---

## 11) Safety and correctness checks

- Food safety: cross-check hazards tied to method (beans/lectins, canning, sous-vide, eggs, cooling/holding).
- Technique correctness: flag and fix steps that are likely wrong unless strong evidence supports them.
- When adjusting for safety/correctness, keep a brief note in research and a succinct explanation in the recipe.

---

## 12) Research packet output schema

The researcher returns a structured YAML packet. This is internal-only — do not emit in user-visible output.

```yaml
recipe: <working title>
date: <YYYY-MM-DD>
mode: <options|recipe|revisions>
dish_origin:
  region_or_cuisine: <e.g., Yucatan; Sichuan; Levantine>
  regional_anchor_required: <yes|no>
language_queries_run:
  - <query 1>
  - <query 2>
core_question: <ratio/technique/timing being resolved>
buckets_explored:
  cuisine_analogs: <what was searched>
  format_analogs: <what was searched>
  occasion_fit: <what was searched>
  equipment_fit: <what was searched>
  experience_fit: <what was searched>
  health_constraint_fit: <what was searched; healthy-chef only>
sources:
  - author: <name or handle / site>
    type: <blog|youtube|instagram|tiktok|forum|cookbook|test-kitchen>
    url: <link>
    published: <YYYY-MM-DD or YYYY>
    accessed: <YYYY-MM-DD>
    tier: <1|2|regional-anchor|secondary>
    authenticity_checks: <pass|borderline|fail + short note>
    notes: <specific contribution: ratio, cue, timing, tool, technique>
comment_mining:
  reviewed:
    blog_comments: <count>
    youtube_comments: <count>
    forum_thread: <yes|no>
  recurring_failures:
    - <failure mode 1>
    - <failure mode 2>
    - <failure mode 3>
  corrections_or_guardrails:
    - <adjustment 1>
    - <adjustment 2>
    - <adjustment 3>
  key_disagreements:
    - <disagreement 1 and how reconciled>
    - <disagreement 2 and how reconciled>
variant_matrix:
  yield: [...]
  time_temp: [...]
  key_ratios: [...]
  technique: [...]
  tools: [...]
decisions:
  - <final ratio/technique/tools + rationale>
carry_forward_notes:
  - <note for options-writer or recipe-writer>
open_questions:
  - <what to test next>
excluded_sources:
  - url: <link>
    reason: <content-farm|duplicate|low-signal|unclear authorship|contradictions>
viral_or_trend_flag:
  is_trending: <yes|no>
  containment_applied: <yes|no>
```

### Variety gate (required before returning packet)
For options mode: confirm all 5 buckets under `buckets_explored` were searched before ranking. If fewer than 5 buckets were covered, the packet is incomplete — continue researching.
For recipe mode: confirm at least 3 buckets were covered.

---

## 13) Citation rules

Cite the top 2-4 sources. For videos/social, note timestamps when a specific segment informed the method.

- Baseline recipe sites must not dominate; keep as [secondary]; never use as sole basis for cultural framing.
- Citation format (in-text markers, links, metadata) is governed by the target deliverable template. Follow `recipe-template.md §Sources` for recipes; `options-template.md §Sources` for options lists.

---

## 14) Pre-QA checklist

Before returning the research packet:
- Mode-specific source-family threshold met.
- Strict source-family dedup applied.
- Platform mix satisfied: 2+ Tier 1 creators, 1+ blog, 1+ video/social, 1+ discussion.
- Regional Anchor included when dish is region-linked.
- Multilingual queries run when applicable.
- Comment-mining completed with 3 failures + 3 guardrails.
- Viral containment applied when trending.
- Exclusions logged; authenticity checks recorded for borderline sources.
- No inference rule followed; measurable details validated or left as open questions.
- Variety gate passed (buckets_explored complete per mode).
