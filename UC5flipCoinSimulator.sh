#!/bin/bash -x
H=0									       #Veriables declaration
T=0
HH=0
TT=0
HT=0
TH=0
HHH=0
TTT=0
HHT=0
TTH=0
THT=0
HTH=0
HTT=0
THH=0
choice=0

declare -A flipCoinDictionary						        
flipCoinDictionary=([H]=$H [T]=$T [HH]=$HH [TT]=$TT [HT]=$HT [TH]=$TH [HHH]=$HHH [TTT]=$TTT 
                    [HHT]=$HHT [TTH]=$TTH [HTH]=$HTH [THT]=$THT [THH]=$THH [HTT]=$HTT)

function getSingletCombination() 						#function for singlet combination  
{
	read -p "Enter the number of flips you want to perform for singlet:" numberOfFlipsSinglet
	for((flipCount=1;flipCount<=$numberOfFlipsSinglet;flipCount++))
	do
		case $((RANDOM%2+1)) in					        
   			1)
     				flipCoinDictionary[H]=$((${flipCoinDictionary[H]}+1))
     				echo -ne "H" \ ;;
   			2)
     				flipCoinDictionary[T]=$((${flipCoinDictionary[T]}+1))
     				echo -ne "T" \ ;;
		esac
	done
	echo ""									#Calculate the percentage of singlet
	percentageHead=`echo " scale=2 ; ${flipCoinDictionary[H]}*100/$numberOfFlipsSinglet" | bc `
	echo "Head percentage:" $percentageHead
	echo "Tail percentage: `echo " scale=2; 100-$percentageHead" | bc` "
}

function getDoubletCombination()					        #function for doublet combination
{
	read -p "Enter the number of flips you want to perform for doublet:" numberOfFlipsDoublet
	for((flipCount=1;flipCount<=$numberOfFlipsDoublet;flipCount++))
	do
		case $((RANDOM%4+1)) in
   			1) 
     				flipCoinDictionary[HH]=$((${flipCoinDictionary[HH]}+1)) 
     				echo -ne "HH" \ ;;
   			2)
     				flipCoinDictionary[TT]=$((${flipCoinDictionary[TT]}+1)) 
     				echo -ne "TT" \ ;;
   			3) 
     				flipCoinDictionary[HT]=$((${flipCoinDictionary[HT]}+1)) 
     				echo -ne "HT" \ ;;
   			4)
     				flipCoinDictionary[TH]=$((${flipCoinDictionary[TH]}+1))
     				echo -ne "TH" \ ;;   
  		esac 
	done
	echo ""								        #Calculate the percentage of doublet
	echo "HH percentage: `echo " scale=2 ; ${flipCoinDictionary[HH]}*100/$numberOfFlipsDoublet" | bc ` "
	echo "TT percentage: `echo " scale=2 ; ${flipCoinDictionary[TT]}*100/$numberOfFlipsDoublet" | bc ` "
	echo "HT percentage: `echo " scale=2 ; ${flipCoinDictionary[HT]}*100/$numberOfFlipsDoublet" | bc ` "
	echo "TH percentage: `echo " scale=2 ; ${flipCoinDictionary[TH]}*100/$numberOfFlipsDoublet" | bc ` "
} 

function getTripletCombination() 						#function for triplet combination
{
	read -p "Enter the number of flips you want to perform for triplet:" numberOfFlipsTriplet
	for((flipCount=1;flipCount<=$numberOfFlipsTriplet;flipCount++))
	do
		case $((RANDOM%8+1)) in
 			1) 
     				flipCoinDictionary[HHH]=$((${flipCoinDictionary[HHH]}+1)) 
     				echo -ne "HHH" \ ;;
   			2)
     				flipCoinDictionary[TTT]=$((${flipCoinDictionary[TTT]}+1)) 
     				echo -ne "TTT" \ ;;
   			3) 
     				flipCoinDictionary[HHT]=$((${flipCoinDictionary[HHT]}+1))
     				echo -ne "HHT" \ ;; 
   			4) 
     				flipCoinDictionary[TTH]=$((${flipCoinDictionary[TTH]}+1)) 
     				echo -ne "TTH" \ ;;
   			5)
     				flipCoinDictionary[THT]=$((${flipCoinDictionary[THT]}+1)) 
     				echo -ne "THT" \ ;;
   			6) 
     				flipCoinDictionary[HTH]=$((${flipCoinDictionary[HTH]}+1)) 
     				echo -ne "HTH" \ ;; 
   			7) 
     				flipCoinDictionary[THH]=$((${flipCoinDictionary[THH]}+1)) 
     				echo -ne "THH" \ ;;
   			8)
     				flipCoinDictionary[HTT]=$((${flipCoinDictionary[HTT]}+1)) 
     				echo -ne "HTT" \ ;;
		esac
	done
	echo ""								     #Calculate the percentage of Triplet
	echo "HHH percentage: `echo " scale=2 ; ${flipCoinDictionary[HHH]}*100/$numberOfFlipsTriplet" | bc ` "
	echo "TTT percentage: `echo " scale=2 ; ${flipCoinDictionary[TTT]}*100/$numberOfFlipsTriplet" | bc ` "
	echo "HTH percentage: `echo " scale=2 ; ${flipCoinDictionary[HTH]}*100/$numberOfFlipsTriplet" | bc ` "
	echo "THT percentage: `echo " scale=2 ; ${flipCoinDictionary[THT]}*100/$numberOfFlipsTriplet" | bc ` "
	echo "HHT percentage: `echo " scale=2 ; ${flipCoinDictionary[HHT]}*100/$numberOfFlipsTriplet" | bc ` "
	echo "TTH percentage: `echo " scale=2 ; ${flipCoinDictionary[TTH]}*100/$numberOfFlipsTriplet" | bc ` "
	echo "THH percentage: `echo " scale=2 ; ${flipCoinDictionary[THH]}*100/$numberOfFlipsTriplet" | bc ` "
	echo "HTT percentage: `echo " scale=2 ; ${flipCoinDictionary[HTT]}*100/$numberOfFlipsTriplet" | bc ` "
}

function sortingTheValues() 						      #function to sort and find winning combination 
{								
	echo "Count of each combination is:"
	for value in "${!flipCoinDictionary[@]}"
	do
		echo -ne "$value:${flipCoinDictionary["$value"]}" \  
	done   
	echo ""
	echo "Winning combination is:"
	for value in "${!flipCoinDictionary[@]}"
	do
		echo "$value : ${flipCoinDictionary["$value"]}"
	done | sort -rn -k3 | head -1
}
 
while(($choice<4)) 							      #Main driver progarm
do 
	echo "Welcome to flip coin simulation"
	echo "1.Flip coin for singlet combination"
	echo "2.Flip coin for doublet combination"
	echo "3.Flip coin for triplet combination"
	read -p "Enter your choice and if you want to exit then enter number greater than 3 :" choice
	case $choice in 
		1) 
			getSingletCombination ;;  
	 	2) 
			getDoubletCombination ;;
	 	3)
			getTripletCombination ;;
	 	*) 	echo "Exit from loop" ;;
	esac
done
sortingTheValues
