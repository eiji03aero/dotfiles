---
name: init
description: Interactive project bootstrapping - guide users through defining concept, service design, system design, dev rules, and task breakdown to set up a complete project foundation.
---

Interactively bootstrap a new project through guided conversation. Walk the user through defining their project from concept to implementation-ready task list.

**IMPORTANT: This is a guided conversation, not a script.** Each phase is a dialogue — ask questions, challenge assumptions, propose ideas, and iterate with the user until the output is solid. Do NOT just generate boilerplate. The value is in the thinking together.

---

## Overview

This skill produces the following project foundation through 5 phases of dialogue:

```
Phase 1: コンセプト     → docs/01-concept.md
Phase 2: サービス設計    → docs/02-service-design.md, docs/03-ui-design.md
Phase 3: システム設計    → docs/04-system-design.md
Phase 4: 開発ルール     → docs/05-development.md, CLAUDE.md
Phase 5: タスク分解     → docs/06-tasks.md, openspec/specs/*, openspec/changes/
```

**Input**: Optionally a project name or brief description. If nothing is provided, start from scratch.

---

## Before Starting

1. Check if project docs already exist:
   - If `docs/01-concept.md` exists, ask if the user wants to continue from where they left off or start fresh
   - If starting fresh with existing docs, confirm overwrite

2. Create directories if they don't exist:
   ```bash
   mkdir -p docs openspec/specs openspec/changes/archive
   ```

3. Read templates from the plugin for structural guidance:
   ```bash
   cat ${CLAUDE_PLUGIN_ROOT}/templates/docs/01-concept.md.tmpl
   ```
   Templates define the **section structure** — the content comes from the conversation.

---

## Phase 1: コンセプト

**Goal**: Define what the project is and why it matters.

**Conversation starters** (adapt to what the user brings):
- What are you building? One sentence.
- Who is it for? What problem does it solve?
- What makes this different from existing solutions?
- What's the MVP scope? What's explicitly out of scope?

**Iterate until solid**, then:
1. Read the template: `${CLAUDE_PLUGIN_ROOT}/templates/docs/01-concept.md.tmpl`
2. Generate `docs/01-concept.md` using the template structure, filled with conversation outcomes
3. Show the user the generated doc
4. Ask for confirmation before moving to the next phase

---

## Phase 2: サービス設計

**Goal**: Define the service model — domain entities, user flows, API surface, and UI screens.

**Conversation starters**:
- Walk through the core user journey step by step
- What are the main entities/data models? How do they relate?
- What does the user see on each screen? What can they do?
- What are the key API endpoints?

**Use ASCII diagrams** to visualize:
- Entity relationship diagrams
- User flow diagrams
- Screen wireframes (rough)

**Iterate until solid**, then:
1. Read templates: `${CLAUDE_PLUGIN_ROOT}/templates/docs/02-service-design.md.tmpl` and `03-ui-design.md.tmpl`
2. Generate `docs/02-service-design.md` (domain model, user flows, API design)
3. Generate `docs/03-ui-design.md` (screen designs, component specs, UI patterns)
4. Show and confirm

---

## Phase 3: システム設計

**Goal**: Define technical architecture, tech stack, and infrastructure.

**Conversation starters**:
- What tech stack are you considering? (or should we decide together?)
- Frontend framework preference? Backend language?
- Database choice? ORM?
- What architectural patterns? (monolith, microservices, modular monolith, etc.)
- How will you deploy? (Docker, cloud, etc.)

**Cover**:
- Frontend architecture (e.g., Feature-Sliced Design, component patterns)
- Backend architecture (e.g., onion/clean architecture, module structure)
- Database schema (initial)
- External integrations (APIs, auth providers, etc.)
- Infrastructure (Docker Compose, CI/CD)

**Iterate until solid**, then:
1. Read template: `${CLAUDE_PLUGIN_ROOT}/templates/docs/04-system-design.md.tmpl`
2. Generate `docs/04-system-design.md`
3. Show and confirm

---

## Phase 4: 開発ルール

**Goal**: Establish development conventions, testing strategy, and environment setup.

**Conversation starters**:
- How do you want to run dev commands? (Docker, local, etc.)
- Testing strategy? (unit, integration, e2e — what level of coverage?)
- Code style preferences? Linting?
- Error handling patterns?
- API response format conventions?

**Generate two files**:
1. `docs/05-development.md` — human-readable developer guide
2. `CLAUDE.md` — machine-readable development rules for Claude Code

**The CLAUDE.md is critical** — it governs how Claude Code behaves in this project. Include:
- Environment rules (where to run commands)
- Architecture constraints (dependency directions)
- Testing policies
- Error handling patterns
- API conventions

**Iterate until solid**, then:
1. Read templates: `${CLAUDE_PLUGIN_ROOT}/templates/docs/05-development.md.tmpl` and `CLAUDE.md.tmpl`
2. Generate both files
3. Show and confirm

---

## Phase 5: タスク分解

**Goal**: Break the MVP into an ordered task backlog and initialize OpenSpec specs.

**Conversation starters**:
- Based on what we've defined, here are the major work areas I see: [list]
- What order makes sense? What has dependencies?
- Should we start with infrastructure/scaffolding or a feature?

**Steps**:
1. Create the task backlog at `docs/06-tasks.md` with:
   - 未着手 (Not Started) section with ordered tasks
   - 完了済み (Completed) section (initially empty)
   - Each task should reference relevant docs with `@docs/` notation

2. For each major capability/feature, create an OpenSpec spec:
   ```bash
   mkdir -p openspec/specs/<capability-name>
   ```
   Create `openspec/specs/<capability-name>/spec.md` with requirements in Gherkin BDD format:
   ```markdown
   ### Requirement: <requirement-name>
   The system SHALL ...

   #### Scenario: <scenario-name>
   - **WHEN** <condition>
   - **THEN** <expected behavior>
   ```

3. Show the task list and specs overview
4. Confirm with the user

---

## Phase Transitions

Between each phase:
- Summarize what was decided
- Show the generated document(s)
- Ask: "This look good? Any changes before we move on?"
- Allow the user to request modifications before proceeding
- The user can also say "skip" to move past a phase (the doc won't be generated)

---

## Resumability

If the user has already completed some phases (docs exist):
- Detect which docs exist
- Offer to start from the next incomplete phase
- Read existing docs for context before continuing

---

## Completion

When all phases are done:

```
## Project Initialized!

**Documents created:**
- docs/01-concept.md
- docs/02-service-design.md
- docs/03-ui-design.md
- docs/04-system-design.md
- docs/05-development.md
- docs/06-tasks.md
- CLAUDE.md

**OpenSpec specs created:**
- openspec/specs/<capability-1>/spec.md
- openspec/specs/<capability-2>/spec.md
- ...

**Next steps:**
- Run `/osdf:core/start` to begin working on the first task
- Run `/osdf:openspec/explore` to think through any aspect further
- Run `/osdf:core/discuss` to discuss ideas or decisions
```

---

## Guardrails

- **Don't rush** — each phase should be a real conversation, not a form to fill out
- **Don't generate without confirming** — always show output before moving on
- **Don't skip phases silently** — if skipping, acknowledge it
- **Do challenge** — if the user's idea has gaps, surface them
- **Do visualize** — use ASCII diagrams for entity relationships, flows, architecture
- **Do reference templates** — use them as structural guides, not fill-in-the-blank forms
- **Do adapt** — if the user already has strong opinions, don't re-ask what's clear
