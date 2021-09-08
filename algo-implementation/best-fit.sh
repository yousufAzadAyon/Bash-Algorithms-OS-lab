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
lowest=10000
for((j=1;j<=$n;j++))
do
if((${m[$j]} !=0))
then    
if((${p[$i]}<=${m[$j]}))
then 
differ=`expr ${m[$j]} - ${p[$i]}`
if(($lowest > $differ ))
then 
lowest=$differ
index=$j
fi
fi
fi
done
m[$index]=0
echo "porcess $i is allocated to memory location $index"
done
