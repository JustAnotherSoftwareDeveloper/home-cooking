---
description: Generate a healthy, batch-cook recipe or options list via healthy-chef. Health constraints (hard avoids, freezer-first, macro defaults) apply automatically. Example: /healthy beef and bean chili, or /healthy show me options for a batch protein.
subtask: true
agent: healthy-chef
---

Route this request to the `healthy-chef` agent.

User request:
$ARGUMENTS

Pass the full user input (dish idea, constraints, serving count, any explicit health overrides) as the task context. Do not summarize or discard any detail.

Health constraint defaults (loaded via the `healthy-lens` skill) apply automatically. Any user-stated overrides in the input should be flagged explicitly to the agent.

If the user's input names a dish specifically, treat it as a recipe request unless they indicate they want options first. If the input is vague or exploratory, default to options mode.
