MMSI=$1
if [ "$MMSI" == "" ]
then
  echo "usage capture_mmsi.sh <mmsi>"
  exit
fi

FILE=${MMSI}.txt
echo "Creating ${FILE}"

while [ 1==1 ]
do  
  node mmsi2text.js ${MMSI} >> ${FILE}
  sleep 600
done

