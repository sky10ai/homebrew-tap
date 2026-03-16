# homebrew-tap

Homebrew tap for [sky10](https://github.com/sky10ai/sky10) — encrypted storage & agent coordination.

## Install

```bash
brew tap sky10ai/tap
brew install sky10        # CLI only
brew install cirrus       # macOS app (builds from source, requires Xcode)
```

## Usage

```bash
sky10 key generate
sky10 fs init --bucket my-bucket --endpoint https://atl1.digitaloceanspaces.com
sky10 fs put ./file.txt
sky10 fs ls
```

## Cirrus (macOS app)

After installing, open the app:

```bash
open $(brew --prefix)/cirrus.app
```

Or copy to Applications:

```bash
cp -R $(brew --prefix)/cirrus.app /Applications/
```

Note: Cirrus is unsigned. Right-click → Open on first launch to bypass Gatekeeper.
