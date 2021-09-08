echo "put number of segments"
read n 


for((i=1;i<=$n;i++))
do
echo "put the swgment nuber,limit,base"
read s[$i]
read l[$i]
read b[$i]
done

echo "put segment to set and offset"
read seg
read off

for((i=1;i<=$n;i++))
do 
if (($seg == ${s[$i]}))
then
	if (( $off <= ${l[$i]}))
		then
		phyad=`expr $off + ${b[$i]} `
		echo "$phyad"
	else
		echo "teap"
		break
	fi
else 
echo "segment not found"

fi
break
done


