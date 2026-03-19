---
name: "osdf:start"
description: Start working on the next uncompleted task from the product backlog
category: Workflow
tags: [workflow, tasks]
---

Start working on the next uncompleted task from the product backlog.

**Steps**

1. **Read the backlog file**
   Read the file `docs/06-tasks.md`.

2. **Find the first uncompleted task**
   Look for the first line matching `- [ ]` (unchecked checkbox). Extract that task block — the `- [ ]` line and all its indented child lines (continuing until the next `- [ ]` or end of list).

3. **Run /osdf:openspec/propose with the task content**
   Use the **Skill tool** to invoke `osdf:openspec/propose`, passing the extracted task text as the argument.
