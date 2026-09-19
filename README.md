# Scrolling Quest Text (Forever)

![GitHub License](https://img.shields.io/github/license/yak3d/wow4e-scrolling-quest-text?style=for-the-badge)
![CurseForge Game Versions](https://img.shields.io/curseforge/game-versions/1702027?style=for-the-badge)

A re-implementation of the [scrolling quest text](https://www.youtube.com/watch?v=NoRDskcH2vM) from World of Warcraft 1.x.

When you interact with a quest giver and pick up a quest, it will write out its text slowly, letting you read it as it writes for a more immersive experience.

## Settings

This addon lets you tweak the writing speed and if the writing audio plays while the text writes.

You can find the settings and their descriptions in Settings --> AddOns --> Scrolling Quest Text.

AddOn logo provided by [game-icons.net](https://game-icons.net)!

## Development

If you want to develop on this addon, you can use the `Makefile` to easily install it.

### Installation

#### Simple Install

If you're on Windows, Mac or Linux with Faugus this will likely "just work":

```shell
make install
```

#### Complex Install

If the path can't be found, then you can specify it with the `WOW_DIR` variable:

```shell
make install WOW_DIR="/path/to/World of Warcraft"
```

### Uninstallation

Same commands as above, just replace `install` with `uninstall`.
