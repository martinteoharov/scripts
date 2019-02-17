let cnt=1
let smth=9
let smth0=99
let smth1=999
let zero=0
check=600
image=img
for i in * 
do 
	if [[ $i == *"img"* ]]
	then
		let cnt+=1
	else
		if [[ $i != *".png"* ]]
		then
			echo -n $i
			echo " file is not *.png, skipping.."
		else
			echo -n $cnt
			if [[ "$cnt" -le "$smth" ]]
			then
				mv $i "$image$zero$zero$zero$cnt.png"; let cnt+=1;
				echo $image$zero$zero$zero$cnt.png
				convert $image$zero$zero$zero$cnt.png -resize 600x400 $image$zero$zero$zero$cnt.png
			elif [[ "$cnt" -le "smth0" ]]
			then
				mv $i "$image$zero$zero$cnt.png"; let cnt+=1;
				echo $image$zero$zero$cnt.png
				convert $image$zero$zero$cnt.png -resize 600x400 $image$zero$zero$cnt.png
			elif [[ "$cnt" -le "smth1" ]]
			then
				mv $i "$image$zero$cnt.png"; let cnt+=1;
				echo $image$zero$cnt.png
				convert $image$zero$cnt.png -resize 600x400 $image$zero$cnt.png
			else
				mv $i "$image$cnt.png"; let cnt+=1;
				echo $image$cnt.png
				convert $image$cnt.png -resize 600x400 $image$cnt.png
			fi	

		fi

	fi
done
for m in *
do
	status=$(file $m | awk '{ print $5 }')
	if [[ $status -ne $check ]]
	then
		convert $m -resize 600x400 $m
		echo -n $cnt " "
		echo $status
	fi
done
