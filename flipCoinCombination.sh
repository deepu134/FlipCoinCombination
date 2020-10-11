#!/bin/bash -x
echo "FLIP COIN COMBINATION PROBLEM"
declare -A dict
countH=0
countT=0
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
