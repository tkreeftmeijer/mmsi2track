# mmsi2track
Capture a ship's AIS track into a gpx file

Scripts to capture a ship's track by periodically capturing the GPS coordinates from myshiptracking, based on the ship's MMSI number.
The script needs to run while the ship is on the move.

Required: bash, node

Procedure:

	./capture_mmsi.sh <mmsi>

This creates a file called \<mmsi\>.txt. It's a comma-separated text file. It will take a gps location every 10 minutes.

Then convert this text file to a gpx using 

	./text2track.sh <mmsi>

This creates \<mmsi\>.gpx, that can be imported into opencpn, google maps, strava, etc.
