#!/usr/bin/env bats

LIB_SCRIPT_PATH="$(pwd)/lib/toy_robot.sh"
. "$LIB_SCRIPT_PATH"

@test "new Robot" {
  subject=$(Robot_new)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" == "0" ]
  [ "${values[2]}" == "NORTH" ]
}
