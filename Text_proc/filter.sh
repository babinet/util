while read fuckinline
do
#echo $fuckinline
Z=$(echo $fuckinline | awk -F'|' '{print $18}' )

zoro=$(cat _OLD.csv)
OLDGOODLINE=$(echo "$zoro" | awk -F'|' -v z="$Z"  '$18=='z'' | awk -F'|' '{print $21}')
debutdunouveau=$(echo "$fuckinline" | awk -F'|' '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20}' OFS='|')
findunouveau=$(echo "$fuckinline" | awk -F'|' '{print $22, $23, $24, $25, $26, $27, $28}' OFS='|')
echo "$debutdunouveau|$OLDGOODLINE|$findunouveau" >> out.txt
done < /Users/zeus/_New/POI.CSV




# print only the lines who are not empty
# awk -F'|' '$21!=""' file.csv
# print only the lines who are empty
#awk -F'|' '!length($21)' _OLD.csv
#awk -F'|' '!length($15)' _OLD.csv
#awk -F'|' '!length($15)' _OLD.csv > empty_inspecteur.csv
