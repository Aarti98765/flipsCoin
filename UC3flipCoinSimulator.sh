#!/bin/bash -x

function Singlet() {
H=0
T=0

declare -A flipCoinDictionary
flipCoinDictionary=([H]=$H [T]=$T)

read -p "Enter the number of flips you want to perform for singlet:" numberOfFlipsSinglet
for((flipCount=1;flipCount<=$numberOfFlipsSinglet;flipCount++))
do
  case $((RANDOM%2+1)) in                                           #Assumed head=1
   1)
     flipCoinDictionary[H]=$((${flipCoinDictionary[H]}+1))
     echo -ne "H" \ ;;
   2)
     flipcoinDictionary[T]=$((${flipCoinDictionary[T]}+1)) 
     echo -ne "T" \ ;;
   3)
     echo "Invalid choice" ;;
  esac 
done

echo ""
for key in "${!flipCoinDictionary[@]}"
do
   echo "${key}:${flipCoinDictionary[$key]}"
done

percentageHead=`echo " scale=2 ; ${flipCoinDictionary[H]}*100/$numberOfFlipsSinglet" | bc `
echo "Head percentage:" $percentageHead
echo "Tail percentage: `echo " scale=2; 100-$percentageHead" | bc` "
}
Singlet

function Doublet() {
HH=0
TT=0
HT=0
TH=0

declare -A flipCoinDictionary
flipCoinDictionary=([HH]=$HH [TT]=$TT [HT]=$HT [TH]=$TH)

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
   *) echo "Invalid Choice" ;;
  esac 
done

echo ""
for key in "${!flipCoinDictionary[@]}"
do
   echo "${key}:${flipCoinDictionary[$key]}"
done

echo "HH percentage: `echo " scale=2 ; ${flipCoinDictionary[HH]}*100/$numberOfFlipsDoublet" | bc ` "
echo "TT percentage: `echo " scale=2 ; ${flipCoinDictionary[TT]}*100/$numberOfFlipsDoublet" | bc ` "
echo "HT percentage: `echo " scale=2 ; ${flipCoinDictionary[HT]}*100/$numberOfFlipsDoublet" | bc ` "
echo "TH percentage: `echo " scale=2 ; ${flipCoinDictionary[TH]}*100/$numberOfFlipsDoublet" | bc ` "
}
Doublet 

