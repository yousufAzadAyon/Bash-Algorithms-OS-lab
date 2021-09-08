echo "Enter the number of input n:"
read n
echo "enter the nuumber of request"
for((i=1;i<=n;i++))
do
read rq[$i]
done
for((i=1;i<=n-1;i++))
do
for((j=1;j<=n-i;j++))
do
if ((rq[$j]> ${rq[$j+1]}))
then
temp=${rq[$j]}
rq[j]=${rq[j+1]}
rq[j+1]=$temp
fi
done 
done
echo "please enter the current position "
read curr

tot1=0
tot2=0
echo "the track position "
read track
for((i=1;i<=n;i++))
do
if(($curr<${rq[$i]}))
then
sub=$((${rq[$i]}-$curr))
tot1=$(($tot1+$sub))
curr=${rq[$i]}
fi

done
p1=$(($track-$curr))
tot1=$(($tot1+$p1))
end=0
p2=$(($track-$end))
echo "please enter the current position "
read curr1
for((i=1;i<n;i++))
do
if(($curr1>${rq[$i]}))
then
sub=$((${rq[$i]}-$end))
tot2=$(($tot2+$sub))
end=${rq[$i]}
fi
done 
tot2=$(($tot2+$p2))
total=$(($tot1+$tot2))
echo "the total seek time $total"
