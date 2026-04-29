# nymann/homebrew-tap

Personal Homebrew tap for small macOS utilities.

## Install

```sh
brew tap nymann/tap
brew install --cask nymann/tap/micflip
```

## Casks

| Cask | What it is |
| --- | --- |
| [micflip](https://github.com/nymann/micflip) | Menu-bar mic input toggle |

More to come (`nosleep`, `caps`).

## Notes

These apps are ad-hoc signed, not notarized. After install, clear the
Gatekeeper quarantine flag once:

```sh
xattr -dr com.apple.quarantine /Applications/micflip.app
```
