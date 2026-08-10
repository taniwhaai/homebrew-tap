# Homebrew tap — Taniwha

```bash
brew install taniwhaai/tap/arai
```

Installs the **lean** Ārai binary (same default as [arai.taniwha.ai/install](https://arai.taniwha.ai/install)).

| Formula | What you get |
| --- | --- |
| `arai` | Lean CLI (hooks, audit, MCP). No local ONNX enrichment. |

For the full binary with local sentence-transformer enrichment:

```bash
ARAI_FULL=1 curl -sSf https://arai.taniwha.ai/install | sh
# or: cargo install arai --features enrich
```

## Updating the formula

On each [arai release](https://github.com/taniwhaai/arai/releases), bump `version` and the four `sha256` values from that tag's `checksums.txt` (lean assets only: `arai-darwin-*`, `arai-linux-*`).

The arai repo can push formula bumps via `.github/workflows/homebrew-tap.yml` when `HOMEBREW_TAP_TOKEN` is configured.

## License

MIT OR Apache-2.0 — same as [taniwhaai/arai](https://github.com/taniwhaai/arai).
