NAME=$1
OUTPUTFILE=${NAME}.gpx
RE='^[0-9]+([.][0-9]+)?$'

cat header.txt > ${OUTPUTFILE}
grep -v 'lat=""' ${NAME}.txt | while read time ship lat lon sog cog
do
   if [[ ${lat} =~ ${RE} ]]
   then
      echo "      <trkpt lat=\"${lat}\" lon=\"${lon}\">"
      echo "         <time>${time}</time>"
      echo "      </trkpt>"
   fi
done >> ${OUTPUTFILE}
cat footer.txt >> ${OUTPUTFILE}
echo File ${OUTPUTFILE} created.

