#!/bin/bash
# TR3N 
#

fuel=0
initialfuelmass=""

for mass in $(cat input)
  do
  X=$((mass / 3 - 2))
  fuel=$((fuel + X))
  initialfuelmass="$initialfuelmass $X"
  done

for i in $initialfuelmass
  do
  Z=0
  while [ $i -gt 0 ]; 
    do
    Z=$((i / 3 - 2))
    if [ $Z -ge 0 ]; then
      Y=$((Y+Z))
    fi
    i=$((i / 3 - 2))
    done
  done
  echo -ne "$fuel + $Y = "; echo $((fuel + Y))