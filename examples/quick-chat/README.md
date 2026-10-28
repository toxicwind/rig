# Quick chat from the terminal

No API calls needed — the CLI talks to the kernel for you.

```bash
# chat with the default agent
rig chat "what can you do?"

# chat with a specific agent by name
rig chat burro "summarize last night's fleet log"

# see who's running first
rig agent list
```

The daemon must be running (`rig start`). First run? See the
[Quickstart](../../README.md#quickstart).
