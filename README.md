# 🧠 CellForge - A Modular Cell Engine in C

**CellForge** is a minimal and powerful engine written in C that dynamically creates and manages modular "cells" from JSON definitions. Each cell represents a functional unit in a larger system (e.g., a UI block, a process node, a game element). The core idea: **make any data structure programmable, reactive, and extensible**.

This project is a demonstration of clean C architecture and a preparation for more advanced interfaces (CLI, Web, TUI). It focuses on flexibility, parsing, memory safety, and extensibility.

## 🔍 Features

- Load cells dynamically from a JSON file
- Each cell contains:
  - A unique ID
  - A type or role
  - Metadata (title, description, tags, etc.)
  - Optional logic hooks (future)
- Modular and clean C structure
- JSON parsing via [cJSON](https://github.com/DaveGamble/cJSON)
- Extensible design for CLI or UI later

## 📦 Example Cell JSON

```json
[
  {
    "id": "cell-001",
    "type": "text",
    "title": "Welcome Cell",
    "description": "This is the entry point of the system.",
    "metadata": {
      "category": "info",
      "tags": ["core", "entry"]
    }
  },
  {
    "id": "cell-002",
    "type": "action",
    "title": "Trigger Button",
    "description": "Triggers the next phase."
  }
]
