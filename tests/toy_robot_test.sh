#!/usr/bin/env bats

LIB_SCRIPT_PATH="$(pwd)/lib/toy_robot.sh"
. "$LIB_SCRIPT_PATH"

@test "new Robot" {
  local subject=$(Robot_new)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" == "0" ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot LEFT" {
  local subject=$(Robot_left $(Robot_new))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "WEST" ]
}

@test "Robot LEFT from 0,0,NORTH" {
  local subject=$(Robot_left 0,0,NORTH)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "WEST" ]
}

@test "Robot LEFT new Robot from WEST" {
  local subject=$(Robot_left $(Robot_new 0,0,WEST))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "SOUTH" ]
}

@test "Robot LEFT from 0,0,WEST" {
  local subject=$(Robot_left 0,0,WEST)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "SOUTH" ]
}

@test "Robot LEFT new Robot from SOUTH" {
  local subject=$(Robot_left $(Robot_new 0,0,SOUTH))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "EAST" ]
}

@test "Robot LEFT from 0,0,SOUTH" {
  local subject=$(Robot_left 0,0,SOUTH)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "EAST" ]
}

@test "Robot LEFT new Robot from EAST" {
  local subject=$(Robot_left $(Robot_new 0,0,EAST))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot LEFT from 0,0,EAST" {
  local subject=$(Robot_left 0,0,EAST)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot RIGHT" {
  local subject=$(Robot_right 0,0,NORTH)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "EAST" ]
}

@test "Robot RIGHT new Robot" {
  local subject=$(Robot_right $(Robot_new))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "EAST" ]
}

@test "Robot RIGHT from EAST" {
  local subject=$(Robot_right 0,0,EAST)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "SOUTH" ]
}

@test "Robot RIGHT new Robot from EAST" {
  local subject=$(Robot_right $(Robot_new 0,0,EAST))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "SOUTH" ]
}

@test "Robot RIGHT from SOUTH" {
  local subject=$(Robot_right 0,0,SOUTH)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "WEST" ]
}

@test "Robot RIGHT new Robot from SOUTH" {
  local subject=$(Robot_right $(Robot_new 0,0,SOUTH))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "WEST" ]
}

@test "Robot RIGHT from WEST" {
  local subject=$(Robot_right 0,0,WEST)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot RIGHT new Robot from WEST" {
  local subject=$(Robot_right $(Robot_new 0,0,WEST))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot PLACE" {
  local subject=$(Robot_place $(Robot_new) 3,3,WEST)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 3 ]
  [ "${values[1]}" -eq 3 ]
  [ "${values[2]}" == "WEST" ]
}

@test "Robot REPORT" {
  local subject=$(Robot_new)
  local subject=$(Robot_report $subject)

  [ "$subject" == "0,0,NORTH" ]

  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot MOVE" {
  local subject=$(Robot_move $(Robot_new))
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 1 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot exec MOVE" {
  local subject=$(Robot_new)
  local subject=$(Robot_exec $subject MOVE)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 1 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot exec MOVE from 0,1,NORTH" {
  local subject=$(Robot_new)
  local subject=$(Robot_place $subject 0,1,NORTH)
  local subject=$(Robot_exec $subject MOVE)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 2 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot exec LEFT" {
  local subject=$(Robot_new)
  local subject=$(Robot_exec $subject LEFT)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "WEST" ]
}

@test "Robot exec RIGHT" {
  local subject=$(Robot_new)
  local subject=$(Robot_exec $subject RIGHT)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "EAST" ]
}

@test "Robot exec PLACE" {
  local subject=$(Robot_new)
  local subject=$(Robot_exec $subject PLACE 4,2,NORTH)
  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 4 ]
  [ "${values[1]}" -eq 2 ]
  [ "${values[2]}" == "NORTH" ]
}

@test "Robot exec REPORT" {
  local subject=$(Robot_new)
  local subject=$(Robot_exec $subject REPORT)

  [ "$subject" == "0,0,NORTH" ]

  local values=(`echo $subject | tr ',' ' '`)

  [ "${values[0]}" -eq 0 ]
  [ "${values[1]}" -eq 0 ]
  [ "${values[2]}" == "NORTH" ]
}
