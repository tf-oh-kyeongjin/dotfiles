# Sample Dotfiles Repository

This directory shows a minimal dotfiles setup that works nicely with VS Code Dev Containers (or the `devcontainer` CLI) without checking any configuration into your project repository.

## Structure

- `install.sh` – called automatically by Dev Containers after the repo is cloned to `~/.dotfiles`. It installs the Git configuration fragment and a custom Git subcommand into your home directory.
- `git/git-aliases.gitconfig` – a separate Git config fragment that is included from your `~/.gitconfig`. You can keep any Git tweaks here without polluting the project repository.
- `bin/git-hello` – an example Git custom command. Any executable named `git-*` on your `PATH` becomes invokable as `git *`.

## How to use

1. Push this directory to your private dotfiles repository. Its root should contain `install.sh`.
2. In VS Code, open **Settings** and set `Dev › Containers: Dotfiles Repository` to the Git URL (or configure `devcontainer` CLI with `--dotfiles-repository`).
3. Reopen your Dev Container. The dotfiles repo is cloned into `~/.dotfiles` and `install.sh` runs automatically.
4. In the container, run `git hello` to confirm that the custom command is available.

You can extend the repo by adding more scripts to `bin/`, shell configuration, editor settings, and so on. Only files in your dotfiles repository are synced—your project repository stays untouched.
