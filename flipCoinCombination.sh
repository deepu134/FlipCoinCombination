#!/bin/bash -x
echo "FLIP COIN COMBINATION PROBLEM"
declare -A dict
countT=0
countH=0
for ((i=1;i<=5;i++))
do
	rand=$((RANDOM%2))
	case $rand in
		0)dict["flip $i"]=H
		((countH++));;
		1)dict["flip $i"]=T
		((countT++));;
		*);; 
	esac
done
Hper=`echo $countH |awk '{print (100*$1)/5}'`
Tper=`echo  $countT |awk '{print (100*$1)/5}'`
echo ${!dict[@]}:${dict[@]}
echo "HEAD %:$Hper% TAIL %:$Tper%"
countH=0
countT=0
for ((i=1;i<=10;i++))
do
	rand=$((RANDOM%4))
	case $rand in
		0)dict["flip $i"]=HH
		((countH++));;
		1)dict["flip $i"]=TT
		((countT++));;
		2)dict["flip $i"]=TH;;
		3)dict["flip $i"]=HT;;
		*);; 
	esac
done
Hper=`echo $countH |awk '{print (100*$1)/5}'`
Tper=`echo  $countT |awk '{print (100*$1)/5}'`
echo "$(($i-1)) Flips"
echo ${!dict[@]}:${dict[@]}
echo "HH %:$Hper% TT %:$Tper%"
