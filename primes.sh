#!/bin/bash
#calculate prime numbers from a specified range
function prime () {
#temp variable for organization
t=0
#calculation loop
for i in `seq $1 $2`
  do
#generate prime numbers and cut excess characters
prm=$(factor $i | grep $i | cut -d ":" -f 2 | cut -d " " -f 2)
if [ "$prm" == "$i" ]; then
   #print new line every third output
   if [ $t == 3 ]; then
     printf "\n"
     let t=0
   fi
#print and format prime number
printf "%5s" "$i"
((t++))
fi
done
printf "\n"
}
prime $1 $2
