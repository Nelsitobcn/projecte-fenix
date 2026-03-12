---
name: verify-deploy
description: >
  Mandatory verification after ANY code change to a web project. This skill MUST be triggered
  every time code is modified, deployed, or uploaded to Firebase/hosting. It forces visual
  browser verification before a task can be marked as complete. Use this skill whenever you
  modify HTML, JS, CSS, Python scripts that affect web output, Firestore data, or any
  deployed asset. Also trigger when deploying, uploading, or running firebase deploy.
  NEVER skip this skill. A change without verification is NOT complete.
---

# Verification Protocol

This skill exists because of a recurring problem: changes get marked as "done" without
actually verifying they work in production. This has caused repeated frustration and
wasted hours of debugging. The rule is simple: **if you can't prove it works, it's not done.**

## When This Skill Activates

Any time you:
- Edit JS, HTML, CSS, or Python files in a web project
- Deploy to Firebase Hosting or any hosting service
- Upload or modify data in Firestore
- Run build scripts that affect the deployed site
- Claim a bug is "fixed"

## The Verification Checklist

After making changes, you MUST complete ALL of these steps before saying "done":

### Step 1: Identify What Changed
- List the specific files modified
- Describe the expected visible change in the browser

### Step 2: Verify Deployment
- Confirm the deploy actually completed (check deploy logs)
- If using cache-busters, verify the new version string loads (not an old cached version)
- Check the browser console for any errors

### Step 3: Visual Verification in Browser
- Open the actual production URL (not localhost)
- Navigate to the specific page/feature affected
- Interact with the feature (click buttons, answer questions, etc.)
- Take a screenshot and show it to the user

### Step 4: Confirm With User
- Show the screenshot to the user
- Explain what the screenshot proves
- Only mark as complete AFTER the user confirms it works

## How to Verify (Tools Available)

### In Cowork (Claude Desktop)
You have Chrome browser tools. Use them:
1. `tabs_context_mcp` to get/create a tab
2. `navigate` to the production URL
3. `computer` with action `screenshot` to capture the state
4. `find` or `read_page` to check specific elements
5. Show the screenshot to the user

### In Claude Code (Terminal)
Options for verification:
1. Use Playwright MCP if configured
2. Use `open` command to open URL in user's browser and ask them to verify
3. Use `curl` to check response codes and content
4. Check Firebase deploy logs for success

## What NOT To Do

- NEVER say "done" or "fixed" without visual proof
- NEVER assume a deploy worked just because the command didn't error
- NEVER trust that Firestore data updated without querying it back
- NEVER skip verification because "it's a small change"
- NEVER mark a todo as "completed" without verification

## Escalation

If you cannot verify (no browser access, URL down, etc.):
1. Tell the user explicitly: "I cannot verify this change myself"
2. Give them exact steps to verify manually
3. Mark the task as "pending verification" NOT "completed"
