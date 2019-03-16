#!/bin/bash
t=0
#Determine if it meets length requirement
if [[ $1 =~ .{8} ]]; then
 ((t++))
fi
#Determine if it contains a number
if [[ $1 =~ [0-9] ]]; then
 ((t++))
fi
#Determine if it contains a symbol
if [[ $1 =~ [@,#,\$,%,\&,\*,+,-,\=] ]]; then
 ((t++))
fi
#Determine if is using a word from dict.txt
for i in `cat ./dict.txt | grep '....'`;
 do
if [[ $1 =~ $i ]]; then
 ((t--))
fi
done
#Determine if it strong enough
if [[ $t > 2 ]]; then
  echo "Y"
else
  echo "N"
fi

