# [homebrew-joelpurra](https://github.com/joelpurra/homebrew-joelpurra), a tap for [Homebrew](https://brew.sh/)

A [Homebrew](https://brew.sh/) tap containing packages of specialized software created, forked, or maintained by [Joel Purra](https://joelpurra.com/). Primarily intended for macOS, might work on Linux.

## Usage

First install [Homebrew](https://brew.sh/) to get the `brew` tool.

```bash
# Install one or more programs:
brew install joelpurra/joelpurra/jqnpm
brew install joelpurra/joelpurra/npshell
brew install joelpurra/joelpurra/shell-keystroke-animator

# Install one or more forks:
brew install --HEAD joelpurra/joelpurra/jq
brew install --HEAD joelpurra/joelpurra/gitslave
```

## Projects and forks

A [`gits` git superproject/gitslave](https://gitslave.sourceforge.io/) fork. It picks up where the original maintainers left off, applying some community-provided patches.

- [jqnpm](https://github.com/joelpurra/jqnpm) is a package manage for [jq](https://stedolan.github.io/jq/). Uses the `joelpurra/joelpurra/jq` fork.
- [npshell](https://github.com/joelpurra/npshell) is a command-line music queue manager.
- [shell-keystroke-animator](https://github.com/joelpurra/shell-keystroke-animator) is a screen demo recording tool to produce animations/gifs of scripted keyboard input.

Forks:

- [joelpurra/joelpurra/gitslave](https://github.com/joelpurra/gitslave) which is a [gitslave](https://gitslave.sourceforge.io/) fork. It picks up where the original maintainers left off.
- [joelpurra/joelpurra/jq](https://github.com/joelpurra/jq) which is a [jq](https://stedolan.github.io/jq/) fork. Patches to enable package management are applied in the branches.

---

Copyright &copy; 2015, 2016, 2017, 2018, 2019, 2020 [Joel Purra](https://joelpurra.com/). Licensed under the [GNU Affero General Public License, Version 3 (AGPL-3.0)](https://www.gnu.org/licenses/agpl-3.0.html).
