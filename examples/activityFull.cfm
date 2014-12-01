<cfset data = application.strava.getActivityMap(session.token, 209459131) />
 <!--- <cfdump var="#data#"> --->
<cfoutput>
<html>
    <head>
        <title>cfStravaAPI - Current Athlete Activities</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry"></script>
    </head>
    <body>
        <div class="container">
			<div class="row">
				<a href="/index.cfm">Return to examples...</a>
			</div>
       		<div class="row">
				<div id="map-canvas" style="width: 100%; height: 500px;"></div>
			</div>
			<div class="row">
				<div class="col-md-3">
                    <dl>
                        <dt>Title</dt>
		                <dd>#data.name#</dd>
                        <dt>Date</dt>
                        <dd>#LSDateFormat(data.start_date, "long")# #LSTimeFormat( data.start_date, "short")#</dd>
                        <dt>Location</dt>
                        <dd>#data.location_city#, #data.location_state# #data.location_country#</dd>
                        <dt>Average Temp</dt>
                        <dd>#application.strava.convertCelsiusToFahrenheit(data.average_temp)# F</dd>
                        <dt>Gear</dt>
                        <dd>#data.gear.name#</dd>
                    </dl>
				</div>
				<div class="col-md-3">
                    <dl>
    					<dt>Moving Time</dt>
                        <dd>#application.strava.convertSecondsToTimeString(data.moving_time)#</dd>
                        <dt>Total Time</dt>
                        <dd>#application.strava.convertSecondsToTimeString(data.elapsed_time)#</dd>
                        <dt>Distance</dt>
                        <dd>#decimalFormat(application.strava.convertMetersToMiles(data.distance))#</dd>
                        <dt>Calories</dt>
                        <dd>#data.calories#</dd>
                        <dt>Average Watts</dt>
                        <dd>#round(data.average_watts)# w</dd>
                    </dl>
				</div>
				<div class="col-md-3">
                    <dl>
                        <dt>Elevation Gain</dt>
                        <dd>#numberFormat(application.strava.convertMetersToFeet(data.total_elevation_gain), ",")#</dd>
                        <dt>Average Speed<dt>
                        <dd>#application.strava.convertMetersPerSecondToMilesPerHour(data.average_speed)# mi/h</dd>
                        <dt>Max Speed</dt>
                        <dd>#application.strava.convertMetersPerSecondToMilesPerHour(data.max_speed)# mi/h</dd>
                        <dt>Kilojoules</dt>
                        <dd>#data.kilojoules#</dd>
				</div>
                <div class="col-md-3">
                    <dl>
                        <dt>Average Heart Rate</dt>
                        <dd>#data.average_heartrate# bpm</dd>
                        <dt>Maximum Heart Rate<dt>
                        <dd>#data.max_heartrate# bpm</dd>
                        <dt>Achievement Count</dt>
                        <dd>#data.achievement_count#</dd>
                        <dt>Athlete Count</dt>
                        <dd>#data.athlete_count#</dd>
                </div>
			</div>
		</div>
        <script>
            function initialize() {
                var mapOptions = {
                    zoom: 3,
                    center: new google.maps.LatLng(0, -180),
                    mapTypeId: google.maps.MapTypeId.TERRAIN
                  };

                var map = new google.maps.Map(document.getElementById('map-canvas'),
                  mapOptions);

                var decodedPolyline = google.maps.geometry.encoding.decodePath('#replace(data.map.polyline, "\", "\\","all")#');
                // alert(decodedPolyline);
                var track = new google.maps.Polyline({
                    path: decodedPolyline,
                    geodesic: true,
                    strokeColor: '##FF0000',
                    strokeOpacity: 1.0,
                    strokeWeight: 2
                });

                track.setMap(map);

                //Set bounds based on polyline
                var bounds = new google.maps.LatLngBounds();
                for (var i = 0; i < decodedPolyline.length; i++) {
                    bounds.extend(decodedPolyline[i]);
                }
                // zoom and center map around bounds
                map.fitBounds(bounds);
            }

            google.maps.event.addDomListener(window, 'load', initialize);


        </script>
    </body>
</html>
</cfoutput>
