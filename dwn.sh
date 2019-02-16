opus="opus"
site0="youtube"
site1="4chan"
if [[ $2 =~ $site0 ]];
then
	site="youtube"
else
	if [[ $1 =~ $site0 ]];
	then
		echo "Not Enough Arguments"
		exit 1
	fi
	site="4chan"
fi

if [[ $site =~ $site0 ]];
then
	if [[ $1 == $opus ]];
	then
		echo "Downloading: " $2 " and converting to opus" 
		youtube-dl -x --audio-format $1 $2
		youtube_filename=$(youtube-dl --get-filename $2)
		youtube_filename="${youtube_filename%.*}.opus"
		#youtube_filename=${youtube_filename// /\\\ }
		mv *.opus /home/martin/youtube-dl/music
		echo $youtube_filename
	fi

fi

if [[ $site =~ $site1 ]];
then
	wget -P /home/martin/4chan/saved -nd -r -l 1 -H -D i.4cdn.org -A png,gif,jpg,jpeg,webm $1
fi
