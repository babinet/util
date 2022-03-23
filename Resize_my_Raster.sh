#!/bin/bash -e
# wget -O A test/-tid?tid=4819094
# sed 's/\&#8230;/…/g'
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
cd "$dir"
parentdir="$(dirname "$dir")"

mkdir -p tmp
#cp temp.txt tmp/out.txt
TheTiffSource="The_Raster_source.tif"
TheSmallerTiff=$(echo "$TheTiffSource"| sed 's/.tif/_smaller.tif/g' )
Image_Width=$(exiftool "$TheTiffSource"| awk '/Image Width/'| awk -F': '  '{print $2}' )
Image_Height=$(exiftool "$TheTiffSource"| awk '/Image Height/'| awk -F': '  '{print $2}' )
echo Image_Width $Image_Width Image_Height $Image_Height
half_sizeX=$(echo "$Image_Width"/2|bc -l)
half_sizeY=$(echo "$Image_Height"/2|bc -l)

gdalwarp -of GTiff -co COMPRESS=DEFLATE -ts $half_sizeX $half_sizeY -r cubic "$TheTiffSource" "$TheSmallerTiff"
