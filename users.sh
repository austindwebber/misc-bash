#!/bin/bash
user=`who | cut -d " " -f1`
for i in "$user";
do
 dshell=`getent passwd "$i" | cut -d: -f7 | head -n 1`
 info=`who | awk '{$2=$5=""; print $0}' | grep "$i"`
 echo $info$dshell
done

