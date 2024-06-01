

function processJson (json) {
  t = json["F"].T;
  var time = new Date(t * 1000).toISOString();
  lat = json["F"].LAT;
  lon = json["F"].LNG;
  sog = json["F"].S;
  cog = json["cval-cog"].V;
  
  console.log(time, mmsi, lat, lon, sog, cog);
}


function getMmsiInfo (fileName, mmsi) {
  // console.log("getting " + fileName)
  return fetch(fileName)
  .then(response => response.text())
  .then(t => processJson(JSON.parse(t)), mmsi)
  .catch(error => {
    console.log(error.stack.toString());
  });
};

var args = process.argv.slice(2);
if ( args.length == 0 ) {
  console.log("Usage: node mmsi2track <mmsi>");
  process.exit(-1);
}
var mmsi = args[0];
getMmsiInfo ("https://www.myshiptracking.com/requests/vesseldetailsTEST.php?type=json&mmsi=" + mmsi + "&return=json&lang=");



