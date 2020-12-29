#!/bin/bash
orange=`tput setaf 11`
bg_orange=`tput setab 178`
purple=`tput setaf 13`
Line=`tput smul`
bold=`tput bold`
black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 15`
reset=`tput sgr0`
bg_red=`tput setab 1`
bg_green=`tput setab 2`
bg_white=`tput setab 7`
bg_blue=`tput setab 4`
lightblue=`tput setaf 45`
lightgreen=`tput setaf 46`
bleuetern=`tput setaf 45`
ilghtpurple=`tput setaf 33`
lightred=`tput setaf 161`
darkblue=`tput setaf 19`
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd "$dir" 2>&1 &>/dev/null

##extraction du filename from drush
#tr -d '\n' < filename | sed -e 's/  (object) array(/\
#/g' | awk '{gsub("'\'',\ \ \ \ \ \ '\''", "|"); print}' | awk '{gsub("\",\ \ \ \ \ \ '\''", "|"); print}' | awk -F'|' 'NR==1, NR==1000{print $0}' OFS='|' > filename.csv
##
#printf 'vid|uid|title|logs|status|coment|promote|sticky|vuuid|nid|type|language|created|changed|tnid|translate|uuid|revision_timestamp|revision_uid|field_type|last_comment_timestamp|last_comment_name
#' > filename_OUT.csv
#cat "filename.csv" >> filename_OUT.csv


while read -r linecsv
do

NodeTitle=$(echo "$linecsv" | awk -F'|' '{print $3}' | sed "s/title' => //g" | sed 's/^"//g' | sed "s/^'//g")
echo "$linecsv" | awk -F'|' -v NodeTitle='$NodeTitle' '{print $1, $2, $4, $5, $6, $7, $8, $9, $10, $11, $12}' OFS='|' | sed "s/'vid' \=> '//g" | sed "s/uid' \=> '//g" | sed "s/title' => //g" | sed 's/^"//g' | sed "s/^'//g" | sed "s/status' => '//g" | sed "s/log' => '//g" | sed "s/comment' => '//g" | sed "s/promote' => '//g" | sed "s/promote' => '//g" | sed "s/sticky' => '//g" | sed "s/nid' => '//g" | sed "s/type' => '//g" | sed "s/language' => '//g"
#echo "$linecsv" | awk -F'|' '{print $20}' | awk -F''\''geometry'\'' => '\''' '{print $2}' | awk -F''\''' '{print $1}' | awk 'NF' | geomet
echo "$blue$NodeTitle| $white "
#cat tmpwkb
#echo hello
done < filename_OUT.csv


#echo "',    '"  | sed "s/',    '/| /g"

#ffmpeg -r 25 -i COout%08d.tif -i "_Montage_CO2_1.aif" -c:v libx264 -c:a aac -pix_fmt yuv420p -r 25 -shortest -y video-from-frames.mp4

#cat "filename.csv" | awk '{gsub("'\'',\t\ \ \ \ \ \ '\''", "|"); print}'

