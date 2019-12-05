#!/bin/bash
# TR3N
#
declare -a a_seq

i=0
for x in $(cat input | tr ',' ' ')
  do
  a_seq[$i]=$x
  i=$((i+1))
  done
  a_seq[1]=12
  a_seq[2]=2

i=0
while true
  do
  opcode=${a_seq[$i]}
  if [ "$opcode" == "99" ]; then
    echo ${a_seq[0]}
    exit
  fi
  numX=${a_seq[$i+1]}
  numY=${a_seq[$i+2]}
  place=${a_seq[$i+3]}
  case $opcode in
    1)
    value=$((a_seq[$numX] + a_seq[$numY]))
    a_seq[$place]=$value
    i=$((i+4))
    ;;
    2)
    value=$((a_seq[$numX] * a_seq[$numY]))
    a_seq[${place}]=${value}
    i=$((i+4))
    ;;
  esac
  done
