#!/bin/bash
calculate () {
ck='^[0-9]+$'
#detect if all arguments were entered
if [[ $# < 3 ]]; then >&2 echo "Usage: ./calc.sh value1 value2 operator"
#detect if arguments entered were integers
elif ! [[ $1 =~ $ck ]] || ! [[ $2 =~ $ck ]]; then
   >&2 echo "calc.sh error: operands must be integers!"
   exit 2
else
  if [ $3 == "x" ]; then
    expr $1 \* $2 2>/dev/null
  else
    expr $1 $3 $2 2>/dev/null
    if [ $? -gt 1 ]; then
      >&2 echo "calc.sh error: invalid operator!"
      exit 1
    else
      exit 0
    fi
  fi
fi
}
output=$(calculate $1 $2 $3)
echo $output
