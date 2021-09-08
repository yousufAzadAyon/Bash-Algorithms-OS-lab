echo "put the number of processes and memory-slot"
read n


for((i=1;i<=$n;i++))
do
echo "put the size of process and memory slot"
read p[$i]
read m[$i]
done

for((i=1;i<=$n;i++))
do
for ((j=1;j<=$n;j++))
do 
if ((${m[$j]}>=${p[$i]}))
then 
zero=0
m[$j]=$zero
index=$j

break

fi
done
if ((${m[$index]} == 0 ))
then 
if (( $j <= $n))
then
echo "porcess $i is allocated to memory location $j "
else
echo "process $i can't be allocated in memory"
fi
fi
done


