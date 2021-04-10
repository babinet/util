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
mkdir -p ../_TRASH_TEMP
mv 202* ../_TRASH_TEMP/
FileDate=$(echo $(date +%Y_%m_%d) | tr "/" "_")

if [ -f ../AllNodespoiTMP.csv ]
then
rm ../AllNodespoiTMP.csv
fi
#if [ -f ../Acces.zip ]
#then
#mv ../Acces.zip ../_TRASH_TEMP/"$FileDate"_Acces.zip
#fi
#if [ -f ../P.O.I.zip ]
#then
#mv ../P.O.I.zip ../_TRASH_TEMP/"$FileDate"_P.O.I.zip
#fi
#if [ -f ../Parcours.zip ]
#then
#mv ../Parcours.zip ../_TRASH_TEMP/"$FileDate"_Parcours.zip
#fi
#sudo apt install python-pip
#sudo pip install geomet
#Extraction from drush (drush 8)
echo "---> $orange remove first and last line $reset"
sed '1,1d' ../Allpoi.txt | sed '$d' > ../Allpoi2.txt
echo "---> $orange strip to one line per node $reset"
tr -d '\n' < ../Allpoi2.txt | sed -e 's/(object) array(/\
(object) array(/g'  | awk 'NF' > ../AllNodespoiTMP.csv

#| sed "s/(Petite Ceinture)//g"

echo "${bg_red}${white}---> Enter the String to Search in name.                  <---${reset}"
read -p "${white}String2SearchinName             : ${orange}" String2SearchinName
echo "$String2SearchinName"

echo "${bg_red}${white}---> Enter the tid of the year.                  <---${reset}"
read -p "${white}tidanne             : ${orange}" tidanne
echo "$tidanne"


#String2Search=$(echo "(Petite Ceinture)")
echo "---> $orange  Looking for the String2SearchinName $reset"
rm ../updatedVIDs.txt
rm ../EmptyAnnee.txt
rm ../FullAnnée.txt
while read row2process
do
#echo "$row2process" | awk  -F"title' =>"  "$2 ~ /$String2SearchinName/"

lookfor=$(echo "$row2process" | awk -v var="$String2SearchinName" -F"title' =>" '$2 ~ var')
foundedVid=$(echo $lookfor | awk 'NF' | awk -F"'vid' => '" '{print $2}'| awk -F"'" '{print $1}' )
echo $foundedVid | awk 'NF' >> ../updatedVIDs.txt
echo "$lookfor" | awk "/field_annee' => array()/" | awk 'NF' | sed "s/field_annee' => array()/field_annee' => array(        'und' => array(          array(            'tid' => '"$tidanne"',          ),        ),      )/g" | sed "s/String2SearchinName//g" >> ../EmptyAnnee.txt
#Si le array lieu contient un élément
echo "$lookfor" | awk "/field_annee' => array\(\ \ /" | awk 'NF' >> ../FullAnnee.txt
#field_voie_lieux' => array(        'und' => array(          array(            'tid' => '108',          ),        ),      ),
#lookfor
#echo "$lookfor hello"
#echo $PocessedListID >> test.txt
done < ../AllNodespoiTMP.csv


echo "array(" > ../EmptyAnnee2import.csv
cat ../EmptyAnnee.txt | awk 'NF' >> ../EmptyAnnee2import.csv
echo ")" >> ../EmptyAnnee2import.csv



# awk -F, '(NR==FNR){a[$1];next}!($1 in a)' blacklist.csv candidates.csv



cd -
