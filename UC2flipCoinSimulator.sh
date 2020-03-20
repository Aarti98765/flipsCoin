#!/bin/bash -x

function Singlet() {
H=0
T=0

declare -A singletCombinationDictionary
singletCombinationDictionary=([H]=$H [T]=$T)

read -p "Enter the number of flips you want to perform:" numberOfFlips
for((flipCount=1;flipCount<=$numberOfFlips;flipCount++))
do
  case $((RANDOM%2+1)) in                                           #Assumed head=1
   1)
     singletCombinationDictionary[H]=$((${singletCombinationDictionary[H]}+1))
     echo -ne "H" \ ;;
   2)
     singletCombinationDictionary[T]=$((${singletCombinationDictionary[T]}+1)) 
	  echo -ne "T" \ ;;
	3)
		echo "Invalid choice" ;;
  esac 
done

echo ""
for key in "${!singletCombinationDictionary[@]}"
do
   echo "${key}:${singletCombinationDictionary[$key]}"
done

percentageHead=`echo " scale=2 ; ${singletCombinationDictionary[H]}*100/$numberOfFlips" | bc `
echo "Head percentage:" $percentageHead
echo "Tail percentage: `echo " scale=2; 100-$percentageHead" | bc` "
}
Singlet
