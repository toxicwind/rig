# Admit an agent via the REST API

The fastest way to put an agent to work programmatically. Tested against a live
Rig kernel (`rig start`, API on `127.0.0.1:25196`).

## Admit

```bash
./admit.sh my-helper "a helpful assistant" "toolcall-local/qwen3.5-9b-tool"
```

Returns `{"agent_id":"…","name":"…","persona":"…"}`.

## List

```bash
curl -s http://127.0.0.1:25196/api/agents | python3 -m json.tool | grep '"name"'
```

## Kill

```bash
curl -s -X DELETE http://127.0.0.1:25196/api/agents/<agent_id>
```

Full endpoint docs: [docs/api-reference.md](../../docs/api-reference.md)
