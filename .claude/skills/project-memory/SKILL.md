---
name: project-memory
description: >
  Project memory and lessons learned system. This skill manages LEARNINGS.md — a knowledge
  base of past mistakes, bugs, and their solutions. MUST be consulted before making changes
  to prevent repeating known errors. MUST be updated after every bug fix with the new lesson.
  Trigger this skill when: fixing bugs, generating questions/content, uploading to Firestore,
  naming collections, creating test data, or any task where a past mistake could repeat.
  Also trigger when starting any new work session to review recent learnings.
---

# Project Memory System

This skill prevents the #1 productivity killer: repeating the same mistakes.
Every bug fix generates a lesson. Every lesson becomes a rule. Rules are checked
before every change.

## The LEARNINGS.md File

Location: `LEARNINGS.md` in the project root.

This file is the project's institutional memory. It contains every lesson learned
from past bugs, organized by category.

## When to READ LEARNINGS.md

Before ANY of these actions, read LEARNINGS.md first:
- Generating questions or content with AI
- Uploading data to Firestore
- Naming Firestore collections or document IDs
- Modifying test-logic.js, corrections.js, or question-loaders.js
- Creating new oposicion tests
- Deploying changes

## When to WRITE to LEARNINGS.md

After fixing ANY bug, add a new entry with this format:

```markdown
### [CATEGORY] Brief description
- **Date**: YYYY-MM-DD
- **Bug**: What went wrong
- **Root cause**: Why it happened
- **Fix**: What was done to fix it
- **Rule**: The permanent rule to prevent this from happening again
- **Files affected**: List of files
```

Categories: FIRESTORE, QUESTIONS, DEPLOY, CODE-LOGIC, UI, NAMING, CACHE, TESTING

## How to Use This Skill

### Starting a new task:
1. Read LEARNINGS.md
2. Check if any existing rules apply to your current task
3. Follow those rules as you work

### After fixing a bug:
1. Add the new lesson to LEARNINGS.md
2. If the lesson implies a code change (like adding validation), make that change too
3. If the lesson affects the generation prompt, update the prompt

### Reviewing patterns:
If the same category has 3+ entries, consider:
- Creating an automated check (hook, test, linter rule)
- Adding it to the main CLAUDE.md as a permanent rule
- Creating a validation script
