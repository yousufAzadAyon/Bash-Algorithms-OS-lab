echo "put the number of process"
read n
for ((i=1;i<=$n;i++))
	do
	echo "put process time,arrival time,burst time:"
	read pt[$i]
	read at[$i]
	read bt[$i]
done

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

tpt=${pt[$j]}
pt[$j]=${pt[$j+1]}	
pt[$j+1]=$tpt


fi
done
done

t=1
ct=`expr ${at[$t]} + ${bt[$t]}`

TAT=`expr $ct - ${bt[$t]}`
wt=`expr $TAT - ${bt[$t]}`
twt=$wt
at[$t]=0
 bt[$t]=0

for((i=1;i<=$n;i++))
do
for ((j=1;j<=`expr $n - $i`;j++))
do
if ((${bt[$j]} > ${bt[$j + 1]}))
then
tbt=${bt[$j]}
bt[$j]=${bt[$j+1]}	
bt[$j+1]=$tbt

tat=${at[$j]}
at[$j]=${at[$j+1]}	
at[$j+1]=$tat


fi
done
done
ctt=$ct
for ((i=1;i<=$n;i++))
do 

ctt=`expr $ctt + ${bt[$i]}`
TAT=`expr $ctt - ${at[$i]}`
wt=`expr $TAT - ${bt[$i]}`
twt=`expr $twt + $wt`
done

awt=`expr $twt / $n`
echo "total waiting time : $twt"
echo "average waiting time : $awt"


