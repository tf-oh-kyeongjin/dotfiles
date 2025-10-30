#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="${SCRIPT_DIR}"
BIN_DIR="${HOME}/.local/bin"
GIT_FRAGMENT_DIR="${HOME}/.gitconfig.d"
GIT_FRAGMENT_PATH="${GIT_FRAGMENT_DIR}/custom.gitconfig"
TARGET_GITCONFIG="${HOME}/.gitconfig"

mkdir -p "${BIN_DIR}"
install -m 755 "${DOTFILES_DIR}/bin/git-hello" "${BIN_DIR}/git-hello"

mkdir -p "${GIT_FRAGMENT_DIR}"
install -m 644 "${DOTFILES_DIR}/git/git-aliases.gitconfig" "${GIT_FRAGMENT_PATH}"

if [ ! -f "${TARGET_GITCONFIG}" ]; then
  printf "[include]\n\tpath = %s\n" "${GIT_FRAGMENT_PATH}" > "${TARGET_GITCONFIG}"
elif ! grep -Fq "${GIT_FRAGMENT_PATH}" "${TARGET_GITCONFIG}"; then
  printf "\n[include]\n\tpath = %s\n" "${GIT_FRAGMENT_PATH}" >> "${TARGET_GITCONFIG}"
fi

if ! command -v git-hello >/dev/null 2>&1; then
  echo "export PATH=\"${BIN_DIR}:\$PATH\"" >> "${HOME}/.bashrc"
fi

echo "Dotfiles install complete. Try 'git hello'."
