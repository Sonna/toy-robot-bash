#!/usr/bin/env bash

LIB_SCRIPT_PATH="$(pwd)/lib/toy_robot.sh"
. "$LIB_SCRIPT_PATH"

function main() {
  local __args=$1
  [[ "$1" ]] && local input="$1" || local input=/dev/stdin
  local robot=$(Robot_new)
  local line=""

  while read -r line && [[ "$line" != "EXIT" ]] && [[ -n "$line" ]]; do
    robot=$(Robot_exec $robot $line)
    if [[ "$line" == "REPORT" ]]; then
      [[ "$input" == "/dev/stdin" && -t 0 ]] &&
        echo -ne "$robot\n" > $(tty) ||
        echo -n "$robot\n"
    fi
  done < "$input"
}
