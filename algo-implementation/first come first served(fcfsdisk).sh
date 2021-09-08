echo "Enter the number of n :"
read n
echo "please Enter your request queue"
for((i=1;i<=n;i++))
do
read rq[$i]
done
echo "Enter the current process "
read curr
tot1=0
tot2=0
for((i=1;i<=$n;i++))
do
if((${curr}>=${rq[$i]}))
then
res1=$((${curr}-${rq[$i]}))
tot1=$(($tot1+$res1))
curr=${rq[$i]}

else

res2=$((${rq[$i]}-$curr))
tot2=$(($tot2+$res2))
curr=${rq[$i]}

fi

done 
total=$(($tot1+$tot2))
echo " The total seek time $total"

