#!/usr/bin/env bats

LIB_SCRIPT_PATH="$(pwd)/lib/toy_robot_cli.sh"
. "$LIB_SCRIPT_PATH"

@test "Robot CLI main" {
  local subject="REPORT
EXIT"
  local output=$(echo $(main <<< "$subject"))

  [ "$output" == "0,0,NORTH\n" ]
}

@test "Robot CLI main MOVE command" {
  local subject="REPORT
MOVE
REPORT
EXIT"
  local output=$(echo $(main <<< "$subject"))

  [ "$output" == "0,0,NORTH\n0,1,NORTH\n" ]
}

@test "Robot CLI main example_c via stdin" {
  local subject="PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT"
  local output=$(echo $(main <<< "$subject"))

  [ "$output" == "3,3,NORTH\n" ]
}

@test "Robot CLI main example_a" {
  local subject="$(pwd)/examples/example_a.txt"
  local output=$(echo $(main $subject))

  [ "$output" == "0,1,NORTH\n" ]
}

@test "Robot CLI main example_b" {
  local subject="$(pwd)/examples/example_b.txt"
  local output=$(echo $(main $subject))

  [ "$output" == "0,0,WEST\n" ]
}

@test "Robot CLI main example_c" {
  local subject="$(pwd)/examples/example_c.txt"
  local output=$(echo $(main $subject))

  [ "$output" == "3,3,NORTH\n" ]
}
