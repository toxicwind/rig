# Minimal agent definition

Two files admit an agent the same way the `rig-join` tooling does:

- `agent.toml` — identity, model, lane
- `system.md` — the agent's system prompt / persona

```bash
# from the repo root, with the kernel running:
rig agent new --config examples/agent-definition/agent.toml
```

Or POST the TOML as `manifest_toml` to `/api/agents` (see `../admit-agent/`).
