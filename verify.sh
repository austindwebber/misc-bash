#!/bin/bash

#W-Number Check
echo $1 | grep -qP '^(w|W)[0-9]{7}$'
if [ $? -eq 0 ]; then
echo "W-Number OK"
else
echo "W-Number Not Accepted"
fi

#Phone Number Check
echo $2 | grep -qP '\(\s*\d\s*\s*\d\s*\d\s*\)\s*\d\s*\d\s*\d\s*-\s*\d\s*\d\s*\d\s*\d'
if [ $? -eq 0 ]; then
echo "Phone Number OK"
else
echo "Phone Number Not Accepted"
fi

#Email Check 
echo $3 | grep -qP '^(?!.*\.\.)[A-Za-z0-9_.]+@(?!.*\.\.)[A-Za-z0-9_.]+edu$'
if [ $? -eq 0 ]; then
echo "Email OK"
else
echo "Email Not Accepted"
fi

#GPA Check
echo $4 | grep -qP '^[0-4][.][0-9]{1}[1-9]?$'
temp=$?
t=`echo "$4 <= 4.0" | bc 2>/dev/null`
if [[ $temp -eq 0 && $t -eq 1 ]]; then
	echo "GPA OK"
else
echo "GPA Not Accepted"
fi

#Website Check 
echo $5 | grep -qP "^(https|http):\/\/[a-zA-Z0-9_]+(?:\.[a-zA-Z0-9_]+)*$" 
if [ $? -eq 0 ]; then
echo "Website OK"
else
echo "Website Not Accepted"
fi

