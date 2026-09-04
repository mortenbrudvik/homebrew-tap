# homebrew-tap

Homebrew casks for [Morten Brudvik](https://github.com/mortenbrudvik)'s macOS apps.

## Loadstone

```bash
brew install --cask mortenbrudvik/tap/loadstone
```

Then grant Accessibility access as described in the [Loadstone README](https://github.com/mortenbrudvik/loadstone#accessibility-required). Upgrade with `brew upgrade --cask loadstone`; the Accessibility grant survives upgrades because the bundle id and signature stay the same.

## Releasing a new version

After publishing the GitHub release, in a clone of this repo (`brew --repo mortenbrudvik/tap` is one, once tapped):

```bash
./bump.sh 0.1.3
git push
```
