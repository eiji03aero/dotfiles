---
name: "osdf:apply"
description: Implement tasks from an OpenSpec change, delegating to sub-agents for parallel execution
category: Workflow
tags: [workflow, artifacts, experimental]
---

Implement tasks from an OpenSpec change, with sub-agent delegation.

**Steps**

1. **Run /osdf:openspec/apply with sub-agent delegation instruction**
   Use the **Skill tool** to invoke `osdf:openspec/apply`, passing the user's argument (change name, if any) along with the following additional instruction:

   > タスクの実装時、適当な粒度でサブエージェント（Agent tool）に実行を委譲してください。独立したタスクは並列でサブエージェントに投げ、依存関係のあるタスクは順番に実行してください。各サブエージェントには必要なコンテキスト（変更対象ファイル、仕様、設計方針など）を十分に渡してください。
