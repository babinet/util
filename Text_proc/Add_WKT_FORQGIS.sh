if [ -f POINEWKTFORQGIS.csv ]
then
rm POINEWKTFORQGIS.csv
fi
while read readline
do
Z=$(echo $readline | awk -F'|' '{print $20}' | sed 's/GEOMETRYCOLLECTION(POINT/Point /g'| sed 's/))/)/g' | sed 's/WKT3857/WKT3857_FOR_QGIS/g' )
WKT_updated=$(echo "$readline" | awk -F'|' -v z="$Z" '{print $0,'z' }' OFS='|')
echo "$WKT_updated" >> POINEWKTFORQGIS.csv
done < /Users/zeus/_New/POINEW.csv




# print only the lines who are not empty
# awk -F'|' '$21!=""' file.csv
# print only the lines who are empty
#awk -F'|' '!length($21)' _OLD.csv
#awk -F'|' '!length($15)' _OLD.csv
#awk -F'|' '!length($15)' _OLD.csv > empty_inspecteur.csv
#cat GEOMETRYCOLLECTION(POINT(260537.277586  6247778.6651452))
