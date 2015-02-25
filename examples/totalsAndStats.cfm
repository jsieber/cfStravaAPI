<cfoutput>
    <html>
        <head>
            <title>cfStravaAPI - List Athlete Totals and Stats</title>

            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

            <!-- Optional theme -->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

            <!-- Latest compiled and minified JavaScript -->
            <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
            <!-- table sorting plugin: https://github.com/Mottie/tablesorter -->
            <script src="/js/jquery.tablesorter.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

        </head>
        <body>
            <a href="/index.cfm">Return to examples...</a>
            <cfset athleteID = application.strava.getCurrentAthelete(session.token).id />
            <cfset data = application.strava.getTotalsAndStats(session.token, athleteID) />

            <p>From Strava Documentation: <a href="http://strava.github.io/api/v3/athlete/##stats">http://strava.github.io/api/v3/athlete/##stats</a></p>

            <p>Returns recent (last 4 weeks), year to date and all time stats for a given athlete. Only available for the authenticated athlete. This is the recommended endpoint when polling for athlete upload events.</p>
            <!--- 
            <cfdump var="#data#" label="current athelete totals and stats">
            --->

                <div id="runningStats">
                    <h2>Running</h2>
                    <h3>Recent Runs (Last 4 weeks)</h3>
                        <dl class="dl-horizontal">
                            <dt>Count:</dt>
                            <dd>#data.recent_run_totals.count#</dd>
                            <dt>Distance:</dt>
                            <dd>#decimalFormat(application.strava.convertMetersToMiles(data.recent_run_totals.distance))# miles</dd>
                            <dt>Moving time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.recent_run_totals.moving_time)#</dd>
                            <dt>Elapsed time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.recent_run_totals.elapsed_time)#</dd>
                            <dt>Elevation gain:</dt>
                            <dd>#numberFormat(application.strava.convertMetersToFeet(data.recent_run_totals.elevation_gain), ",")# feet</dd>
                            <dt>Achievement count:</dt>
                            <dd>#data.recent_run_totals.achievement_count#</dd>
                        </dl>
                     <h3>Year To Date Runs</h3>
                        <dl class="dl-horizontal">
                            <dt>Count:</dt>
                            <dd>#data.ytd_run_totals.count#</dd>
                            <dt>Distance:</dt>
                            <dd>#decimalFormat(application.strava.convertMetersToMiles(data.ytd_run_totals.distance))# miles</dd>
                            <dt>Moving time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.ytd_run_totals.moving_time)#</dd>
                            <dt>Elapsed time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.ytd_run_totals.elapsed_time)#</dd>
                            <dt>Elevation gain:</dt>
                            <dd>#numberFormat(application.strava.convertMetersToFeet(data.ytd_run_totals.elevation_gain), ",")# feet</dd>
                        </dl>
                    <h3>All Time Runs</h3>
                        <dl class="dl-horizontal">
                            <dt>Count:</dt>
                            <dd>#data.all_run_totals.count#</dd>
                            <dt>Distance:</dt>
                            <dd>#decimalFormat(application.strava.convertMetersToMiles(data.all_run_totals.distance))# miles</dd>
                            <dt>Moving time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.all_run_totals.moving_time)#</dd>
                            <dt>Elapsed time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.all_run_totals.elapsed_time)#</dd>
                            <dt>Elevation gain:</dt>
                            <dd>#numberFormat(application.strava.convertMetersToFeet(data.all_run_totals.elevation_gain), ",")# feet</dd>
                        </dl>
                </div>
                
                <div id="ridingStats">
                    <h2>Riding</h2>
                    <h3>Recent Riding (Last 4 weeks)</h3>
                        <dl class="dl-horizontal">
                            <dt>Count:</dt>
                            <dd>#data.recent_ride_totals.count#</dd>
                            <dt>Distance:</dt>
                            <dd>#decimalFormat(application.strava.convertMetersToMiles(data.recent_ride_totals.distance))# miles</dd>
                            <dt>Moving time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.recent_ride_totals.moving_time)#</dd>
                            <dt>Elapsed time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.recent_ride_totals.elapsed_time)#</dd>
                            <dt>Elevation gain:</dt>
                            <dd>#numberFormat(application.strava.convertMetersToFeet(data.recent_ride_totals.elevation_gain), ",")# feet</dd>
                            <dt>Achievement count:</dt>
                            <dd>#data.recent_ride_totals.achievement_count#</dd>
                        </dl>
                    <h3>Year To Date Rides</h3>
                        <dl class="dl-horizontal">
                            <dt>Count:</dt>
                            <dd>#data.ytd_ride_totals.count#</dd>
                            <dt>Distance:</dt>
                            <dd>#decimalFormat(application.strava.convertMetersToMiles(data.ytd_ride_totals.distance))# miles</dd>
                            <dt>Moving time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.ytd_ride_totals.moving_time)#</dd>
                            <dt>Elapsed time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.ytd_ride_totals.elapsed_time)#</dd>
                            <dt>Elevation gain:</dt>
                            <dd>#numberFormat(application.strava.convertMetersToFeet(data.ytd_ride_totals.elevation_gain), ",")# feet</dd>
                        </dl>
                    <h3>All Time Rides</h3>
                        <dl class="dl-horizontal">
                            <dt>Count:</dt>
                            <dd>#data.all_ride_totals.count#</dd>
                            <dt>Distance:</dt>
                            <dd>#decimalFormat(application.strava.convertMetersToMiles(data.all_ride_totals.distance))# miles</dd>
                            <dt>Moving time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.all_ride_totals.moving_time)#</dd>
                            <dt>Elapsed time:</dt>
                            <dd>#application.strava.convertSecondsToTimeString(data.all_ride_totals.elapsed_time)#</dd>
                            <dt>Elevation gain:</dt>
                            <dd>#numberFormat(application.strava.convertMetersToFeet(data.all_ride_totals.elevation_gain), ",")# feet</dd>
                            <dt>Biggest ride distance:</dt>
                            <dd>#decimalFormat(application.strava.convertMetersToMiles(data.biggest_ride_distance))# miles</dd>
                            <dt>Biggest climb:</dt>
                            <dd>#numberFormat(application.strava.convertMetersToFeet(data.biggest_climb_elevation_gain), ",")# feet</dd>
                        </dl>
                </div>
        </body>
    </html>
</cfoutput>