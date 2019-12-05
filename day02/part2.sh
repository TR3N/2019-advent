#!/bin/bash
# TR3N
#
#set -x
declare -a a_seq
refresh_array () {
zz=0
for x in $(cat input | tr ',' ' ')
  do
  a_seq[$zz]=$x
  zz=$((zz+1))
  done
}

main () {
i=0
while true
  do
    opcode=${a_seq[$i]}
    if [ "$opcode" == "99" ]; then
       if [ "${a_seq[0]}" == "19690720" ]; then
         THENUMBER=$((100 * $inoun + $iverb))
         echo "noun:$inoun verb:$iverb number:$THENUMBER"
         exit
        fi
      break
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
      *)
      break 
      ;;
    esac
  done
}


#  a_seq[1]=12
#  a_seq[2]=2

inoun=0
iverb=0
while true
  do
  a_seq[1]=$inoun
    while true
      do
      refresh_array
      a_seq[1]=$inoun
      a_seq[2]=$iverb
      main
      iverb=$((iverb + 1))
      if [ $iverb -ge 100 ]; then 
        break
      fi
      a_seq[1]=$inoun
      done
  inoun=$((inoun + 1))
  iverb=0
  if [ $inoun -ge 100 ]; then
    break
  fi
  done
