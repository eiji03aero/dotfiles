---
name: "osdf:complete"
description: Archive the current change, mark the task as done in the backlog, and reflect delta specs into docs
category: Workflow
tags: [workflow, tasks, archive]
---

Complete the current task — archive the change, update the backlog, and reflect changes into docs.

**Steps**

1. **Run /osdf:openspec/archive**
   Use the **Skill tool** to invoke `osdf:openspec/archive`. Let it handle change selection, spec sync, and archiving.

2. **Update the backlog** (sub-agent)
   Use the **Agent tool** to delegate this to a sub-agent. Pass the following prompt:

   > Read `docs/06-tasks.md`. Determine which task was just completed by matching it against the most recently archived change under `openspec/changes/archive/` (read the latest directory's `proposal.md` to identify it). Find the corresponding `- [ ]` task in the 未着手 section.
   >
   > Then update `docs/06-tasks.md`:
   > - Change the task's checkbox from `- [ ]` to `- [x]`
   > - Move the entire task block (the `- [x]` line and all its indented child lines) from the 未着手 section to the end of the 完了済み section (before the `---` separator)
   > - Keep the 未着手 section intact with remaining tasks
   >
   > Report back which task was marked complete.

3. **Reflect delta specs into docs** (sub-agent)
   Use the **Agent tool** to delegate this to a sub-agent. Pass the following prompt:

   > Check the most recently archived change directory under `openspec/changes/archive/` for delta specs and design artifacts:
   > - Read the archived change's `proposal.md` and `design.md`
   > - Read any delta specs under the archive's `specs/` directory
   > - Review the existing docs files (`docs/02-service-design.md`, `docs/03-ui-design.md`, `docs/04-system-design.md`) and update them to reflect the newly implemented functionality
   > - Add or update sections as appropriate — integrate the new capability's design decisions, API endpoints, data models, UI components, etc. into the relevant docs
   > - Do NOT simply append — merge the information naturally into the existing document structure
   >
   > Report back which docs files were updated and what was added.

   Steps 2 and 3 can run in parallel since they are independent.

4. **Summary**
   Collect results from both sub-agents and show what was done:
   - Which change was archived and where
   - Which task was marked complete in the backlog
   - Which docs files were updated and what was added
