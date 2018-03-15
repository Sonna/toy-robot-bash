#!/usr/bin/env bash

declare -gA MOVE=(
    [NORTH,X]=0
    [NORTH,Y]=1
    [SOUTH,X]=0
    [SOUTH,Y]=-1
    [EAST,X]=1
    [EAST,Y]=0
    [WEST,X]=-1
    [WEST,Y]=0
)

declare -gA TURN=(
    [NORTH,LEFT]=WEST
    [NORTH,RIGHT]=EAST
    [SOUTH,LEFT]=EAST
    [SOUTH,RIGHT]=WEST
    [EAST,LEFT]=NORTH
    [EAST,RIGHT]=SOUTH
    [WEST,LEFT]=SOUTH
    [WEST,RIGHT]=NORTH
)

# function Robot_new() {
#   local __resultvar=$1
#   local __x_var=$2
#   local __y_var=$3
#   local __facing_var=$4

#   [[ "$__x_var" ]] && local x='$__x_var' || x='0'
#   [[ "$__y_var" ]] && local y='$__y_var' || y='0'
#   [[ "$__facing_var" ]] && local facing='$__facing_var' || facing="NORTH"

#   # declare -gA new_robot=( ["x"]=$x ["y"]=$y ["facing"]=$facing )
#   local new_robot="$x,$y,$facing"

#   # declare -A new_robot
#   # new_robot["x"]=$x
#   # new_robot["y"]=$y
#   # new_robot["facing"]=$facing

#   if [[ "$__resultvar" ]]; then
#       eval $__resultvar="'$new_robot'"
#   else
#       echo "$new_robot"
#   fi
# }

# == Usage Examples:
#     echo Robot_new: $(Robot_new)
function Robot_new() {
  echo "0,0,NORTH"
}


# == Usage Examples:
#     echo "Robot_left:" $(Robot_left 0,0,NORTH)
function Robot_left() {
  local __robot=$1
  local values=(`echo $__robot | tr ',' ' '`)

  local turned=${TURN[${values[2]},LEFT]}

  echo "${values[0]},${values[1]},${turned}"
}


# == Usage Examples:
#     echo "Robot_right:" $(Robot_right 0,0,NORTH)
function Robot_right() {
  local __robot=$1
  local values=(`echo $__robot | tr ',' ' '`)

  local turned=${TURN[${values[2]},RIGHT]}

  echo "${values[0]},${values[1]},${turned}"
}


# == Usage Examples:
#     echo "Robot_place:" $(Robot_place 0,0,NORTH)
function Robot_place() {
  local __robot=$1
  local __new_position=$2
  echo "$__new_position"
}


# == Usage Examples:
#     echo "Robot_report:" $(Robot_place 0,0,NORTH)
function Robot_report() {
  local __robot=$1
  echo "$__robot"
}


# == Usage Examples:
#     echo "Robot_move:" $(Robot_move 0,0,NORTH)
#     echo "Robot_move:" $(Robot_move 0,0,EAST)
function Robot_move() {
  local __robot=$1
  local values=(`echo $__robot | tr ',' ' '`)

  local facing=${values[2]}
  local x=$(( "${values[0]}" + "${MOVE[${facing},X]}" ))
  local y=$(( "${values[1]}" + "${MOVE[${facing},Y]}" ))

  if [[ "$x" -lt "0" || "$x" -gt "4" ]]; then
    x=${values[0]}
  fi

  if [[ "$y" -lt "0" || "$y" -gt "4" ]]; then
    y=${values[1]}
  fi

  echo "${x},${y},${facing}"
}

# == Usage Examples:
#    echo "Robot_exec   move 0,0,NORTH:" $(Robot_exec 0,0,NORTH MOVE)
#    echo "Robot_exec   move 0,1,NORTH:" $(Robot_exec 0,0,NORTH MOVE)
#    echo "Robot_exec   left 0,0,NORTH:" $(Robot_exec 0,0,NORTH LEFT)
#    echo "Robot_exec  right 0,0,NORTH:" $(Robot_exec 0,0,NORTH RIGHT)
#    echo "Robot_exec  place 4,2,NORTH:" $(Robot_exec 0,0,NORTH PLACE 4,2,NORTH)
#    echo "Robot_exec report 0,0,NORTH:" $(Robot_exec 0,0,NORTH REPORT)
function Robot_exec() {
  local __robot=$1
  local __raw_command=$2
  local __raw_command_args=$3

  local __command="Robot_${__raw_command,,}"

  echo "$($__command $__robot $__raw_command_args)"
}
