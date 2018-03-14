#!/usr/bin/env bats

LIB_SCRIPT_PATH="$(pwd)/lib/hello_world.sh"

@test "echo hello world" {
  result=$("$LIB_SCRIPT_PATH")
  [ "$result" == "hello world!" ]
}
