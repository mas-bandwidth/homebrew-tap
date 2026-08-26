# Más Bandwidth Homebrew Tap

If these projects help you, please support them: **[Become a supporter](https://www.patreon.com/MasBandwidth/membership)**

This tap carries the [schema](https://github.com/mas-bandwidth/schema)
compiler — write your data types once, generate the code that reads and
writes them in C, C++, C#, Go, Rust and JavaScript:

```sh
brew install mas-bandwidth/tap/schema
```

The formula builds from the upstream release tarball. License: AGPL-3.0-or-later
(the compiler; the code it generates is yours — see the LICENSE exception
upstream).

## The C libraries are in homebrew/core

Every Más Bandwidth C/C++ library is in `homebrew/core`, so install them
directly — no tap needed:

```sh
brew install serialize
brew install netcode
brew install reliable
brew install libyojimbo
```

Note that yojimbo's formula is named `libyojimbo`, not `yojimbo` — the shorter
name was already taken by an unrelated cask.

### If you tapped this repo for the libraries

Nothing to do. `tap_migrations.json` redirects `serialize` to `homebrew/core`, so
an existing `brew install mas-bandwidth/tap/serialize` resolves to the core
formula.

### Why the libraries moved and schema lives here

The tap started as a temporary distribution channel while the four library
formulae went through submission to `homebrew/core`; all four were accepted on
2026-07-18 and are kept current automatically by Homebrew's own autobump, so
the tap copies were removed rather than drift. `schema` is distributed from
this tap.
