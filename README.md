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
| `gwt [branch]` | Creates a worktree for `branch` under `$GWT_ROOT/<repo>/<branch>` (default `~/Coding/worktrees`, `/` becomes `-`), copies untracked config files and clones dependency directories copy-on-write (see [Configuring gwt](#configuring-gwt)), then `cd`s in. If the branch is already checked out in a worktree, `cd`s there instead. With no argument it reads the branch name from the clipboard (`pbpaste`, `wl-paste`, `xclip` or `xsel`). |
| `gwt-rm [-D] [branch]` | Removes the worktree for `branch` (default: the current one) and `cd`s back to the main checkout if you were in it. `-D` also deletes the branch. Refuses dirty worktrees. |
| `handoff [plan]` | Opens the newest (or matching) `plans/*.md` in `agy` with an "implement this exactly" prompt. |
| `gac "msg"` | `git add -A && git commit`, appending the Linear-style ticket ID (`ABC-123`) from the branch name. |
| `ga` | Pick files to stage with fzf, previewing each diff with delta. |
| `fixup` | Stages everything and makes a fixup commit for the branch's first commit since the default branch. |
| `gcb <name>` | `git checkout -b`. |
| `lin` | Opens the branch's Linear ticket in the browser. |
| `gh-comments [pr]` | Prints a PR's review comments with file and line. |
| `gh` | Wraps `gh` so `gh stack` works without `GH_REPO` set. |
| `killport <port>` | Kills whatever is listening on a port. |
| `killdev` | Kills common dev servers (vite, next, wrangler, expo, webpack, …). |
| `extract <file>` | Extracts any common archive format. |
| `mkcd <dir>` | `mkdir -p` and `cd`. |

### Configuring gwt

What gets carried into a new worktree comes from, in order of precedence: a `.gwtinclude` file in the repo root, a `GWT_INCLUDE` array in your `.zshrc`, or the defaults (`.env*`, Firebase config, `.xcode.env.local`, `node_modules/`, `ios/Pods/`). One glob per line, relative to the repo root, `#` for comments. A trailing `/` marks a directory to clone copy-on-write; anything else is a file to copy. Tracked files are never copied.

```
# .gwtinclude
.env*
node_modules/
packages/*/node_modules/
```

```zsh
GWT_INCLUDE=('.env*' node_modules/)   # used when a repo has no .gwtinclude
GWT_ROOT=~/worktrees                  # where worktrees go
GWT_REMOTE=upstream                   # remote to fetch and branch from (default origin)
GWT_POST_CREATE='pnpm install'        # run in each new worktree
```

After creating a worktree, gwt runs `.gwt-post-create` from the repo root if it's executable, otherwise `$GWT_POST_CREATE`, inside the new worktree with `GWT_MAIN_WORKTREE` and `GWT_BRANCH` set. A failing hook only warns. A committed `.gwt-post-create` is code from the repo that runs automatically, so treat it like an `npm install` script.

## aq

`bin/aq` (added to `PATH` by the plugin) is a per-repo prompt queue for Claude Code and agy. Queues live in `<repo>/.queue/` (git-ignored) and are shared across worktrees.

```
aq add "fix the login redirect loop"   # or no text to write it in $EDITOR
aq                                     # list this repo's queue
aq next 3                              # send the next three prompts to claude as one session
aq g                                   # same, to agy
aq all ~/Coding                        # every queue under a directory
aq undo                                # restore the last sent batch
```

The [aq Claude Code mod](https://github.com/daviddecorso/claude-mods#aq) shows the same queue in a pane inside Claude Code.

## Dependencies

Install what you use: `git`, `fzf` and `git-delta` (`ga`), `gh` (`gh-comments`, `gh`), `eza` and `bat` (aliases), `agy` (`handoff`, `aq g`), `claude` (`aq next`).

## License

MIT
