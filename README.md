# [homebrew-joelpurra](https://github.com/joelpurra/homebrew-joelpurra), a tap for [Homebrew](https://brew.sh/)

A [Homebrew](https://brew.sh/) tap containing packages of specialized software created, forked, or maintained by [Joel Purra](https://joelpurra.com/). Primarily intended for macOS, might work on Linux.

## Requirements

First install [Homebrew](https://brew.sh/) to get the `brew` tool.

## [jqnpm](https://github.com/joelpurra/jqnpm)

Package manager for [jq](https://stedolan.github.io/jq/). Depends on [joelpurra/joelpurra/jq](https://github.com/joelpurra/jq) which is a `jq` fork with patch branches to enable package management.

```bash
# NOTE: depends on joelpurra/joelpurra/jq which conflicts with homebrew-core's jq.
brew install joelpurra/joelpurra/jqnpm
```

## [npshell](https://github.com/joelpurra/npshell)

Command-line music queue manager.

```bash
brew install joelpurra/joelpurra/npshell
```

## [shell-keystroke-animator](https://github.com/joelpurra/shell-keystroke-animator)

Screen demo recording tool to produce animations/gifs of scripted keyboard input.

```bash
brew install joelpurra/joelpurra/shell-keystroke-animator
```

## [joelpurra/joelpurra/gitslave](https://github.com/joelpurra/gitslave)

A [`gits` git superproject/gitslave](https://gitslave.sourceforge.io/) fork. It picks up where the original maintainers left off, applying some community-provided patches.

```bash
brew install --HEAD joelpurra/joelpurra/gitslave
```

---

Copyright &copy; 2015, 2016, 2017, 2018, 2019, 2020 [Joel Purra](https://joelpurra.com/). Licensed under the [GNU Affero General Public License, Version 3 (AGPL-3.0)](https://www.gnu.org/licenses/agpl-3.0.html).
