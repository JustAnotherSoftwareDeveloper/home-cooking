---
description: Generate an options list or full recipe via recipe-chef. Pass an occasion, dish idea, or serving context. Example: /recipe date night dinner for 2, or /recipe weeknight pasta.
subtask: true
agent: recipe-chef
---

Route this request to the `recipe-chef` agent.

User request:
$ARGUMENTS

Pass the full user input (occasion, dish idea, constraints, serving count, equipment notes) as the task context. Do not summarize or discard any detail.

If the user's input names a dish specifically, treat it as a recipe request unless they indicate they want options first. If the input is vague or exploratory, default to options mode.
