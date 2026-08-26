# Más Bandwidth Homebrew Tap — retired

If these libraries help you, please support them: **[Become a supporter](https://www.patreon.com/MasBandwidth/membership)**

**This tap is retired. You do not need it.** Every Más Bandwidth library is now
in `homebrew/core`, so install them directly:

```sh
brew install serialize
brew install netcode
brew install reliable
brew install libyojimbo
```

Note that yojimbo's formula is named `libyojimbo`, not `yojimbo` — the shorter
name was already taken by an unrelated cask.

## If you tapped this repo

Nothing to do. `tap_migrations.json` redirects `serialize` to `homebrew/core`, so
an existing `brew install mas-bandwidth/tap/serialize` resolves to the core
formula. You can untap at your leisure:

```sh
brew untap mas-bandwidth/tap
```

## Why it existed

This tap was a temporary distribution channel, used to test tap-based delivery
while the formulae were going through submission to `homebrew/core`. All four
libraries were accepted on 2026-07-18, which made the tap redundant — and worse
than redundant, since a second copy of a formula has to be updated by hand and
silently drifts from the one in core. The formulae in `homebrew/core` are kept
current automatically by Homebrew's own autobump.
