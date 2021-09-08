echo "put the number of process"
read n
echo "time quantum "
read tq
for ((i=1;i<=$n;i++))
	do
	echo "put process time,arrival time,burst time:"
	read pt[$i]
	read at[$i]
	read bt[$i]
	tbt[$i]=${bt[$i]}
	
done

#sorting
for((i=1;i<=$n;i++))
do
for ((j=1;j<=`expr $n - $i`;j++))
do
if ((${at[$j]} > ${at[$j+1]}))
then
tat=${at[$j]}
at[$j]=${at[$j+1]}	
at[$j+1]=$tat

tbt=${bt[$j]}
bt[$j]=${bt[$j+1]}	
bt[$j+1]=$tbt

ttbt=${tbt[$j]}
tbt[$j]=${tbt[$j+1]}	
t bt[$j+1]=$ttbt


tpt=${pt[$j]}
pt[$j]=${pt[$j+1]}	
pt[$j+1]=$tpt


fi
done
done

#finish sorting






#round robin logic
t=1
ct=${at[$t]}


for ((i=1;i<=$n;i++))
do 

	if((${bt[$i]} > $tq))
	then
		ct=`expr $ct + $tq`
		TAT=`expr $ct - ${at[$i]}`
		num=$num+1
		bt[$num]=`expr ${bt[$i]} - $tq`

	else 

		ct=`expr $ct + ${bt[$i]}`
		TAT=`expr $ct - ${at[$i]}`
		wt=`expr $TAT - ${tbt[$i]}`
		twt=`expr $twt + $wt`
	fi
echo "total waiting time : $twt"

done

awt=`expr $twt / $n`

echo "average waiting time : $awt"


