#!/usr/bin/env bash
set -e

# Default
DEFAULT_CONFIG="install.win.default.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

# https://stackoverflow.com/questions/57635562/how-to-check-whether-shell-scripts-vim-running-in-vs-code-integrated-terminal
# https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
# https://stackoverflow.com/questions/16203088/bash-if-statement-with-multiple-conditions-throws-an-error
"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${DEFAULT_CONFIG}" "${@}" --no-color

# Machine-specific
DOTBOT_HOST=$(hostname)
if [[ $DOTBOT_HOST == 'HOME2004' ]];
then
    CONFIG="install.win.home.yaml"
    test -f "${BASEDIR}/${CONFIG}" && "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}" --no-color
elif [[ $DOTBOT_HOST == 'WORK2103' ]];
then
    CONFIG="install.win.work.yaml"
    test -f "${BASEDIR}/${CONFIG}" && "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}" --no-color
else
    echo "Extra config not found. Exiting..."
fi

exit 0
