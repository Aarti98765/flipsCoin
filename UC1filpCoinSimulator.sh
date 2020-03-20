#!/bin/bash -x
Heads=1
flipNumber=$(( RANDOM%2 ))
if [[ $flipNumber -eq 1 ]]
then
 echo "Heads"
else
 echo "Tails"
fi
