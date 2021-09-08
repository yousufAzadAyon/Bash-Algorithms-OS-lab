echo "put the number of inputs "
read n
echo "put the frame size "
read f
echo "put inputs"
for((i=1;i<=$n;i++))
do
read sequence[$i]
queue[$i]=${sequence[$i]}

done

fault=0
hit=0
index=1
for((j=1;j<=$n;j++))
do
for((i=1;i<=$f;i++))
	do
	if((${frame[$i]} == queue[$index]))
	then
	target=$i
	index=`expr $index + 1`
	fi
	done
	if((j<=$f))
	then
	frame[$j]=${sequence[$j]}	
	fault=`expr $fault + 1`
	else
	
	for((i=1;i<=$f;i++))
	do
	if((${frame[$i]} == ${sequence[$j]}))
	hit=`expr $hit + 1`
	frame[$target]=${sequence[$j]}
	
	else
 	fault=`expr $fault + 1`
	frame[$target]=${sequence[$j]}
fi
	done	
			
fi
	done


echo "page hit $hit"
echo "page fault $fault"
echo "frame ${frame[*]}"
