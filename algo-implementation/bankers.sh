echo "put the number of the rows and columns"
read r
read c

echo " give initial availability vector"

for((i=1;i<=$c;i++))
do 
read initial[$i]
done


for ((i=1;i<=$r;i++))
do
for((j=1;j<=$c;j++))
do
echo "put calaim matrix value of position [$i $j]"
read claim[$i$j]
echo "put allocation metrix value position [$i $j"]
read allocation[$i$j]

need[$i$j]=`expr ${claim[$i$j]} - ${allocation[$i$j]}`


done

done

echo "need matrix"

for ((i=1;i<=$r;i++))
do
temp=0
n=0

for((j=1;j<=$c;j++))
do
echo  ${need[$i$j]}

tem[$i]=$temp
temp=`expr $temp + ${allocation[$j$i]}`
n=`expr $n + 1`

if (($n >= $r))
then 
echo ""
available[$i]=$temp
fi

done
done

echo "total allocation  ${available[*]}"

echo "current availablety "
for ((i=1;i<=$c;i++))
do 
current=`expr ${initial[$i]} - ${available[$i]}`
currentav[$i]=$current
echo  ${currentav[$i]}
done 
s=1
br=1

for ((x=1;x<=$s;x++))
do
for ((i=1;i<=$r;i++))
do

	for ((j=1;j<=$c;j++))
	do
		
		if ((${need[$i$j]} <= ${currentav[$j]} ))
		then 
			
		k=`expr $k + 1`
		index=$j
		
		else 
		m=`expr $m + 1`
		fi
	done 
if (($k == $c ))
then 
echo "process $i is allocated"
br=`expr $br + 1`
k=0
for ((z=1;z<=$c;z++))
do
currentav[$z]=`expr ${currentav[$z]} + ${allocation[$i$z]}`

done
# echo "last current availability ${currentav[*]}"
else 
echo "process $i is not "
s=`expr $s + 1`
k=0
fi
done
done






