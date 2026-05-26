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
