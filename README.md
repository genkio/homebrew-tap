# genkio/homebrew-tap

Personal Homebrew tap.

## Formulae

### vidgrep

Natural-language scene search and clipping for local video files, fully local
(CLIP embeddings + shot detection, no cloud). Point it at a video or folder,
describe the scene, get timestamps or ready-cut clips.

```sh
brew install genkio/tap/vidgrep
vidgrep oneshot ~/Videos "a dog jumping into a lake" -k 5   # index + cut clips
vidgrep search "two people kissing in a coffee shop"        # print timestamps
```

First run downloads CLIP weights (~1.7 GB) to `~/.cache`; indexing is one-time
and resumable, search is instant afterwards.

Source: <https://github.com/genkio/vidgrep>

### cc-autoresume

Watches running Claude Code sessions in tmux and auto-resumes them after a
usage-limit reset, so a `You've hit your session limit` stop no longer leaves a
session idle until you nudge it by hand.

```sh
brew install genkio/tap/cc-autoresume
cc-autoresume --list                            # show live claude panes + status
cc-autoresume                                   # run the daemon in the foreground
brew services start genkio/tap/cc-autoresume    # or run it in the background
```

It discovers sessions across every window and pane of the running tmux server
(not just the current one), so a tmux server must be running.

Source: <https://github.com/genkio/cc-autoresume>

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
