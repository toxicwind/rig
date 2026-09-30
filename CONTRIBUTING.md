# Contributing to Rig

Thanks for helping. This is a fast-moving fork — small, working PRs beat big perfect ones.

## Setup

```bash
git clone https://github.com/toxicwind/rig.git
cd rig
cargo build --workspace --lib
```

Rust 1.75+, edition 2021. That's the whole toolchain.

## Before you PR

```bash
cargo test --workspace                              # 2,696+ tests, all must pass
cargo clippy --workspace --all-targets -- -D warnings  # must be 0 warnings (CI-enforced)
cargo fmt --all -- --check                          # must be clean
```

If any of these fail, the PR isn't ready.

## PR process

1. Fork, branch from `main`, keep it focused — one change per PR.
2. Update `CHANGELOG.md` if user-visible.
3. Docs changes: update the README/docs, not just code comments.
4. Open the PR against `main` using the template. Describe what and why, not just what.

## What we merge

- Bug fixes with a regression test
- Hands, skills, channel adapters that work end-to-end
- Docs that make the 10-second test pass (hook → proof → trust)
- Performance wins with measured numbers

## What we don't

- Drive-by refactors of the kernel without a measured reason
- New dependencies without justification (single binary is the product)
- Breaking API changes without a migration note

## Naming note

Binary, crate, config-path and env-var names still say `openfang` for ecosystem
compatibility. Don't rename them in passing — the full rename is tracked separately.

Questions? Open an issue — fastest response there.
