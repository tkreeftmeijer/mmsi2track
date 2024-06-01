NAME=$1
OUTPUTFILE=${NAME}.gpx

cat header.txt > ${OUTPUTFILE}
cat ${NAME}.txt | while read time ship lat lon
do
   echo "      <trkpt lat=\"${lat}\" lon=\"${lon}\">"
   echo "         <time>${time}</time>"
   echo "      </trkpt>"
done >> ${OUTPUTFILE}
cat footer.txt >> ${OUTPUTFILE}
echo File ${OUTPUTFILE} created.

