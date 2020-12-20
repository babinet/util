for imagedng in *.dng
do
noext=$(echo "$imagedng" | sed 's/.dng//g')
convert  "$imagedng" -colorspace rgb -depth 16  "$noext".dpx
done
