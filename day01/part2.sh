#!/bin/bash
# TR3N
#
fuel=0
for mass in $(cat input)
  do
  X=$((mass / 3 - 2))
  fuel=$((fuel + X))
  done
echo $fuel

