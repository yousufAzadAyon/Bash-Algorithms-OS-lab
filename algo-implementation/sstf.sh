echo "put the number of inputs"
read n

echo "put head"
read current
echo "put previous request"
read previous

for((i=1;i<=$n;i++))
do 
read segment[$i]
done
segment[$n + 1]=$current
n=`expr $n + 1`

for((i=1;i<=$n;i++))
do
for ((j=1;j<=`expr $n - $i`;j++))
do
if ((${segment[$j]} > ${segment[$j+1]}))
then
tat=${segment[$j]}
segment[$j]=${segment[$j+1]}	
segment[$j+1]=$tat

fi
done
done
total1=0
total2=0
total=0
##sorting
echo "sorted ${segment[*]}"

for((i=1;i<=$n;i++))
do
if((${segment[$i]} == $current))
then
index=$i
echo "index $index"
fi
done

inintial=1
temp1=`expr ${segment[$index + 1]} - ${segment[$index ]}`
temp2=`expr ${segment[$index]} - ${segment[$index - 1]}`

if(($temp2 < $temp1))
then
total1=`expr ${segment[$index]} - ${segment[$inintial]}`

total2=`expr ${segment[$n]} - ${segment[$inintial]}`

total=`expr $total1 + $total2`
echo "total time = $total"

else 

total1=`expr ${segment[$n]} - ${segment[$index + 1]}`
total2=`expr ${segment[$n]} - ${segment[$1]}`
total3=`expr ${segment[$index]} - ${segment[$1]}`
total2=`expr $total2 + $total3`
total=`expr $total1 + $total2`
echo "total time = $total"

fi

