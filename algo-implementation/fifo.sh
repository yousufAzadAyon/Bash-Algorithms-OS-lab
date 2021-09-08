echo "put the number of inputs "
read n
echo "put the frame size "
read f
echo "put inputs"
for((i=1;i<=$n;i++))
do
read sequence[$i]
done

fault=0
hit=0
index=1
for((j=1;j<=$n;j++))
do
	if (($j<=$f))
	then
	fault=`expr $fault + 1`
	frame[$j]=${sequence[$j]}
	
##ok
	else
		for ((i=1;i<=$f;i++))
		do
		 if(($index >$f  ))
		then
		index=1
		fi 

		if((${frame[$i]} == ${sequence[$j]}))
		then 
		hit=`expr $hit + 1`
		break
		else
		frame[$index]=${sequence[$j]}
		fault=`expr $fault + 1`
		index=`expr $index + 1`
		break
		echo "page fault 36 $fault"
		
		fi
		done
	fi

	
	done


echo "page hit $hit"
echo "page fault $fault"
echo "frame ${frame[*]}"
