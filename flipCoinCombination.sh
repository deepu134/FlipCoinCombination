#!/bin/bash -x
echo "FLIP COIN COMBINATION PROBLEM"
declare -A dict
countT=0
countH=0
j=0
for ((i=1;i<=5;i++))
do
	rand=$((RANDOM%2))
	case $rand in
		0)dict["flip $i"]=H
		((countH++))
		sort[j]=H
		((j++));;
		1)dict["flip $i"]=T
		((countT++))
		sort[j]=T
		((j++));;
		*);; 
	esac
done
echo "5 flips"
Hper=`echo $countH |awk '{print (100*$1)/5}'`
Tper=`echo  $countT |awk '{print (100*$1)/5}'`
echo ${!dict[@]}:${dict[@]}
echo "HEAD %:$Hper% TAIL %:$Tper%"
DcountH=0
DcountT=0
for ((i=1;i<=10;i++))
do
	rand=$((RANDOM%4))
	case $rand in
		0)dict["flip $i"]=HH
		((DcountH++))
		 sort[j]=HH
                ((j++));;
		1)dict["flip $i"]=TT
		((DcountT++))
		 sort[j]=TT
                ((j++));;
		2)dict["flip $i"]=TH;;
		3)dict["flip $i"]=HT;;
		*);; 
	esac
done
Hper=`echo $countH |awk '{print (100*$1)/10}'`
Tper=`echo  $countT |awk '{print (100*$1)/10}'`
echo "$(($i-1)) Flips"
echo ${!dict[@]}:${dict[@]}
echo "HH %:$Hper% TT %:$Tper%"
TcountT=0
TcountH=0
for ((i=1;i<=10;i++))
do
        rand=$((RANDOM%4))
        case $rand in
                0)dict["flip $i"]=HHH
                ((TcountH++))
		 sort[j]=HHH
                ((j++));;
                1)dict["flip $i"]=TTT
                ((TcountT++))
		sort[j]=TTT
                ((j++));;
                2)dict["flip $i"]=TTH;;
                3)dict["flip $i"]=THT;;
                4)dict["flip $i"]=HTT;;
		5)dict["flip $i"]=HHT;;
		6)dict["flip $i"]=HTH;;
		7)dict["flip $i"]=THH;;
		*);;
        esac
done
Hper=`echo $countH |awk '{print (100*$1)/10}'`
Tper=`echo  $countT |awk '{print (100*$1)/10}'`
echo "$(($i-1)) Flips"
echo ${!dict[@]}:${dict[@]}
echo "HHH %:$Hper% TTT %:$Tper%"
echo "COMBINATIONS:${sort[@]}"
max=$countH
for k in {$countT,$DcountH,$DcountT,$TcountH,$TcountT}
do
	if [ $k -gt $max ]
	then 
		max=$k
	else
		continue
	fi
done
case $max in
 	$countH) echo "H WIN";;
	$countT) echo "T WIN";;
	$DcountH) echo "HH WIN";;
	$DcountT) echo "TT WIN";;
	$TcountH) echo "HHH WIN";;
	$TcountT) echo "TTT WIN";;
	*);;
esac


