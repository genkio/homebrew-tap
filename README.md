# genkio/homebrew-tap

Personal Homebrew tap.

## Formulae

### carbonyl

A fork of [fathyb/carbonyl](https://github.com/fathyb/carbonyl) (Chromium in
the terminal) packaged as a single self-contained binary.

```sh
brew install genkio/tap/carbonyl
carbonyl https://github.com
```

First launch extracts the embedded runtime (~165 MB) to
`$XDG_CACHE_HOME/carbonyl/<hash>/`; subsequent launches are fast.

Source: <https://github.com/genkio/carbonyl>

### tui

One launcher for four cookie-stealth terminal readers (x, inoreader, slack,
folo), shipped as a single binary.

```sh
brew install genkio/tap/tui
tui                 # pick an app
tui x --auth        # log in via your browser, once per app
```

Auth opens a Chromium-family browser (Brave, Chrome, Chromium, Edge, ...) to
capture your session; credentials and settings live in `~/.config/tui/env`. The
formula pulls in `carbonyl` for the in-terminal article view (the `o` key).

Source: <https://github.com/genkio/tui>
