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
| [nosleep](https://github.com/nymann/nosleep) | Menu-bar `caffeinate` toggle |
| [caps](https://github.com/nymann/caps) | Hyperkey replacement (Caps Lock → Hyper held / Escape tapped) |

## Notes

These apps are ad-hoc signed, not notarized. After install, clear the
Gatekeeper quarantine flag once:

```sh
xattr -dr com.apple.quarantine /Applications/<app>.app
```

## Release flow

Each app repo (micflip, nosleep, caps) has:

- a `just release X.Y.Z` recipe that builds, zips, tags `vX.Y.Z`, and
  publishes a GitHub release with the zip attached
- a `.github/workflows/bump-cask.yml` workflow that runs on
  `release: published`, downloads the zip, computes the sha256, and
  opens a PR against this tap updating the cask's `version` and
  `sha256`

So a new release is: `just release X.Y.Z` in the app repo, then merge
the auto-opened PR here.

### One-time setup

The bump workflow needs a token with write access to this tap. Create a
[fine-grained PAT](https://github.com/settings/personal-access-tokens/new)
with these settings:

- **Resource owner:** `nymann`
- **Repository access:** only `nymann/homebrew-tap`
- **Permissions:** `Contents: Read and write`, `Pull requests: Read and write`

Then add it as a secret named `HOMEBREW_TAP_TOKEN` in each app repo
(Settings → Secrets and variables → Actions).
