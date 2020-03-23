#!/bin/bash -x

function Singlet() {
#Veriables
H=0
T=0

#Defined Dictionary
declare -A singletCombinationDictionary
singletCombinationDictionary=([H]=$H [T]=$T)

read -p "Enter the number of flips you want to perform:" numberOfFlips
for((flipCount=1;flipCount<=$numberOfFlips;flipCount++))
do
	#Assumed head=1
	case $((RANDOM%2+1)) in  
   		1)
     			singletCombinationDictionary[H]=$((${singletCombinationDictionary[H]}+1))
     			echo -ne "H" \ ;;
   		2)
     			singletCombinationDictionary[T]=$((${singletCombinationDictionary[T]}+1)) 
	  		echo -ne "T" \ ;;
		*)
			echo "Exit from loop" ;;
  	esac 
done

#Forloop is used to display the count of singlet
echo ""
for key in "${!singletCombinationDictionary[@]}"                                              #
do
	echo "${key}:${singletCombinationDictionary[$key]}"
done

#Calculated the percentage of singlet
percentageHead=`echo " scale=2 ; ${singletCombinationDictionary[H]}*100/$numberOfFlips" | bc `
echo "Head percentage:" $percentageHead
echo "Tail percentage: `echo " scale=2; 100-$percentageHead" | bc` "
}
Singlet
