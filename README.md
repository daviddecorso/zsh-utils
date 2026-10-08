# zsh-utils

Git, worktree and dev-workflow functions for zsh, plus an optional set of aliases. Written on macOS.

## Install

```zsh
git clone https://github.com/daviddecorso/zsh-utils ~/.zsh-utils
echo 'source ~/.zsh-utils/zsh-utils.plugin.zsh' >> ~/.zshrc
```

It's a standard `*.plugin.zsh` layout, so it also works as an oh-my-zsh custom plugin or with antidote, zinit, etc.

Aliases are off by default because several replace common commands (`ls` → eza, `cat` → bat, `..` → `cd ..; ls`). To load them, set this before sourcing:

```zsh
ZSH_UTILS_ALIASES=1
```

## Functions

| Function | What it does |
| --- | --- |
| `gwt [branch]` | Creates a git worktree under `$GWT_ROOT/<repo>/<branch>` (default `~/Coding/worktrees`), copies `.env*` and Firebase config files, clones `node_modules` and `ios/Pods` with APFS copy-on-write, and `cd`s in. With no argument it reads the branch name from the clipboard (`pbpaste`, macOS only). |
| `handoff [plan]` | Opens the newest (or matching) `plans/*.md` in `agy` with an "implement this exactly" prompt. |
| `gac "msg"` | `git add . && git commit`, appending the Linear-style ticket ID (`ABC-123`) from the branch name. |
| `ga` | Pick files to stage with fzf, previewing each diff with delta. |
| `fixup` | Stages everything and makes a fixup commit for the branch's first commit since `main`. |
| `gcb <name>` | `git checkout -b`. |
| `lin` | Opens the branch's Linear ticket in the browser. |
| `gh-comments [pr]` | Prints a PR's review comments with file and line. |
| `gh` | Wraps `gh` so `gh stack` works without `GH_REPO` set. |
| `eas build …` | Wraps the Expo `eas` CLI and warns before a build if `app.json`'s version wasn't bumped. |
| `killport <port>` | Kills whatever is listening on a port. |
| `killdev` | Kills common dev servers (vite, next, wrangler, expo, webpack, …). |
| `extract <file>` | Extracts any common archive format. |
| `mkcd <dir>` | `mkdir -p` and `cd`. |

## aq

`bin/aq` (added to `PATH` by the plugin) is a per-repo prompt queue for Claude Code and agy. Queues live in `<repo>/.queue/` and are shared across worktrees.

```
aq add "fix the login redirect loop"   # or no text to write it in $EDITOR
aq                                     # list this repo's queue
aq next 3                              # send the next three prompts to claude as one session
aq g                                   # same, to agy
aq all ~/Coding                        # every queue under a directory
aq undo                                # restore the last sent prompt
```

The [aq Claude Code mod](https://github.com/daviddecorso/claude-mods#aq) shows the same queue in a pane inside Claude Code.

## Dependencies

Install what you use: `git`, `fzf` and `git-delta` (`ga`), `gh` (`gh-comments`, `gh`), `eza` and `bat` (aliases), `node` (`eas`), `agy` (`handoff`, `aq g`), `claude` (`aq next`).

## License

MIT
