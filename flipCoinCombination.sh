#!/bin/bash -x
echo "FLIP COIN COMBINATION PROBLEM"
declare -A dict
for ((i=1;i<=5;i++))
do
	rand=$((RANDOM%2))
	case $rand in
		0)dict["flip $i"]=H;;
		1)dict["flip $i"]=T;;
		*);; 
	esac
done
echo ${dict[@]} 
