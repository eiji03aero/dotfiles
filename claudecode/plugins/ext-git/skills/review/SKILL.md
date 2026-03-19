---
name: review
description: Review branch diff interactively - summarize changes, visualize flows with mermaid, review quality, and support follow-up investigation. Use when the user wants to review changes between branches or a PR.
argument-hint: <source> <target> OR <pr-url>
---

# Branch Diff Review

Review the diff between two branches and produce a structured review document.

## Arguments

Two input modes are supported:

### Mode A: Branch names
- `$0` — Source branch (the branch with changes, e.g. feature branch)
- `$1` — Target branch (the branch to merge into, e.g. main)

### Mode B: PR URL
- `$0` — A GitHub PR URL (e.g. `https://github.com/owner/repo/pull/123`)

If arguments are missing, ask the user to provide either a PR URL or both branch names.

## Phase 1: Generate Review

### Step 0: Resolve branches

Determine which input mode was used:

- If `$0` looks like a GitHub PR URL (contains `github.com` and `/pull/`), resolve branches from it:
  ```bash
  gh pr view "$0" --json headRefName,baseRefName,title
  ```
  Use `headRefName` as source branch and `baseRefName` as target branch.
  Fetch the remote branches if needed so the diff can be computed locally:
  ```bash
  git fetch origin <headRefName> <baseRefName>
  ```
- Otherwise, use `$0` as source and `$1` as target directly.

### Step 1: Gather diff

Run the following to get the full diff and changed file list:

```bash
git diff <target>...<source>
git diff --stat <target>...<source>
git log --oneline <target>...<source>
```

### Step 2: Analyze and write review

Read the diff carefully. Understand what changed, why it changed, and how the changes interact.

Create the output directory and file:

- Path: `.ai-tmp/reviews/[YYYYMMDD]-[slug]/review.md`
  - `YYYYMMDD` is today's date
  - `slug` is a short kebab-case summary of the change (2-4 words, e.g. `add-user-auth`, `fix-payment-flow`)

Write the review with the following sections. **Include only the sections that are meaningful for the given diff — skip sections that add no value.**

```markdown
# Review: [short title]

> `$0` → `$1`
> Generated: [date]

## Summary
A concise explanation of the purpose and motivation behind these changes.

## Before / After Comparison
(Include only if it clarifies the change — e.g. behavior changes, API changes, config changes. Skip for simple additions or refactors where comparison adds no value.)

A brief comparison of key behavioral or structural differences.

## Flow Visualization
(Include only if the changes involve non-trivial logic flows, state transitions, or component interactions.)

Visualize relevant processing flows, state transitions, or architecture using mermaid diagrams.
Use the diagram type that best fits: flowchart, sequence diagram, state diagram, etc.

\```mermaid
(appropriate diagram here)
\```

Provide a brief explanation of the diagram.

## Changed Files

| File | Change Summary |
|------|---------------|
| `path/to/file` | Brief description of what changed |
| ... | ... |

## Quality Review

### Bugs / Potential Issues
- List any bugs, edge cases, race conditions, or logic errors found.
- If none found, state that briefly.

### Implementation Quality
- Observations on code quality: naming, structure, duplication, error handling, etc.
- Note any deviations from existing patterns in the codebase.
- Suggestions for improvement (if any).
```

### Step 3: Notify user

After writing the file, tell the user:
- The path to the review file
- A brief (2-3 sentence) summary of the review highlights
- Invite follow-up: ask if they want to deep-dive into any section, investigate specific files further, or explore additional concerns

## Phase 2: Follow-up Investigation

When the user asks follow-up questions or requests additional investigation:

1. Investigate thoroughly — read relevant code, trace logic, check related files
2. Append findings to `.ai-tmp/reviews/[YYYYMMDD]-[slug]/research.md`

The research file should be structured as:

```markdown
# Research: [same title as review]

## Investigation: [topic from user's question]
> Requested: [date/time context]

[Detailed findings, code references, diagrams if helpful]

### Conclusion
[Clear answer or recommendation]

---

## Investigation: [next topic]
...
```

Each new investigation is appended as a new `## Investigation` section. Do not overwrite previous investigations.

After appending, tell the user what you found and ask if they want to continue investigating.
