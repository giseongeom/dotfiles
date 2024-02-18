#!/usr/bin/env bash
set -e

DEFAULT_CONFIG="config.msys2.yml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

# https://stackoverflow.com/questions/57635562/how-to-check-whether-shell-scripts-vim-running-in-vs-code-integrated-terminal
# https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
# https://stackoverflow.com/questions/16203088/bash-if-statement-with-multiple-conditions-throws-an-error
# "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${DEFAULT_CONFIG}" "${@}" --no-color
"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${DEFAULT_CONFIG}" "${@}"

exit 0
