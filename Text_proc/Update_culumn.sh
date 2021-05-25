# Sous Ubuntu
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
# 1 je sors de l'ancien CSV ceux qui ont des rues
# awk -F'|' '$21!=""' _OLD.csv | awk -F'|' '{print $21}'
# awk -F'|' '$21!=""' _OLD.csv > _OLD_WITH_RUES.csv
# je sors du nouveau CSV les rows qui sont vides dans la colonne rue
# awk -F'|' '!length($21)' POI.csv > POIS_WITH_NO_RUES.csv
# je me base sur le WKB comme colonne ID identique entre POIS_WITH_NO_RUES.csv et _OLD_WITH_RUES.csv

if [ -f NEW_WITH_RUEtmp.csv ]
then
rm NEW_WITH_RUEtmp.csv
fi

while read -r fuckinline
do
#echo $fuckinline
Z=$(echo $fuckinline | awk -F'|' '{print $18}' )

ReadOldCSV=$(cat _OLD_WITH_RUES.csv)
OLDGOODLINE=$(echo "$ReadOldCSV" | awk -F'|' -v z="$Z"  '$18=='z'' | awk -F'|' '{print $21}')
debutdunouveau=$(echo "$fuckinline" | awk -F'|' '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22}' OFS='|')
findunouveau=$(echo "$fuckinline" | awk -F'|' '{print $24, $25, $26, $27, $28}' OFS='|')
echo "$debutdunouveau|$OLDGOODLINE|$findunouveau" >> NEW_WITH_RUEtmp.csv
done < POIS_WITH_NO_RUES.csv
echo "NodeTitle|NodeID|NodeVID|Vuuid|uid|Date|RevisionTimestamp|CreatedDatetmp|CreatedDate|LastRevisionTimestamptmp|lechampsimage|lechampstitle|lechampsalt|inspecteurHumanR|TypeDePOIHumanR|TypeDInscription|TypeDInscriptionHumanR|coordinatesWKB|coordinates4326|WKT3857|AnneeHumanR|Voielieu|VoielieuHumanR|body|TypeDePOI|BodyHtml|Ville" > NEW_WITH_RUES.csv
cat NEW_WITH_RUEtmp.csv >> NEW_WITH_RUES.csv



# print only the lines who are not empty
# awk -F'|' '$21!=""' file.csv
# print only the lines who are empty
#awk -F'|' '!length($21)' _OLD.csv
#awk -F'|' '!length($15)' _OLD.csv
#awk -F'|' '!length($15)' _OLD.csv > empty_inspecteur.csv



# Sortir les noms colonne 1 avec ★
#Z="★"
#awk -F'|' -v z="$Z"  '$1~'z'' POI.csv
#WKT for qgis



