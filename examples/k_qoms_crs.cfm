<html>
    <head>
        <title>cfStravaAPI - List Athlete K/QOMs/CRs</title>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>"
        <script src="/js/jquery.tablesorter.min.js"></script>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>"
        <script src="/js/jquery.tablesorter.min.js"></script>

    </head>
    <body>
        <a href="/index.cfm">Return to examples...</a>
        <cfset athleteID = application.strava.getCurrentAthelete(session.token).id />
        <cfset data = application.strava.getK_QOMs_CRs(session.token, athleteID) />

        <p>From Strava Documentation: <a href="http://strava.github.io/api/v3/athlete/#koms">http://strava.github.io/api/v3/athlete/#koms</a></p>

        <p>Returns an array of segment efforts representing KOMs/QOMs and course records held by the given athlete. Results are sorted by date, newest first. Pagination is supported.</p>
    <!---
        <cfdump var="#data#" label="current athelete activities">
    --->
        <cfoutput>
            <div class="table-responsive">
                <h2>Running</h2>
                <table id="running" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Time</th>
                            <th>Distance</th>
                            <th>KOM Rank</th>
                            <th>PR Rank</th>
                            <th class="{sorter: 'percent'}">Average Grade</th>
                            <th class="{sorter: 'percent'}">Maximum Grade</th>
                            <th>Average Heart Rate</th>
                            <th>Maximum Heart Rate</th>
                            <th>Average Cadence</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop array="#data#" index="thisRecord">
                            <cfif thisRecord.segment.activity_type eq "Run">
                                <cfinclude template="_k_qoms_crs_run.cfm">
                            </cfif>
                        </cfloop>
                    </tbody>
                </table>
            </div>
            <div class="table-responsive">
                <h2>Riding</h2>
                <table id="riding" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Date</th>
                            <th>Type</th>
                            <th>Time</th>
                            <th>Distance</th>
                            <th>KOM Rank</th>
                            <th>PR Rank</th>
                            <th>Average Grade</th>
                            <th>Maximum Grade</th>
                            <th>Average Heart Rate</th>
                            <th>Maximum Heart Rate</th>
                            <th>Average Cadence</th>
                            <th>Average Watts</th>
                        </tr>
                    </thead>
                    <tbody>
                        <cfloop array="#data#" index="thisRecord">
                            <cfif thisRecord.segment.activity_type eq "Ride">
                                <cfinclude template="_k_qoms_crs_ride.cfm">
                            </cfif>
                        </cfloop>
                    </tbody>
                </table>
            </div>
        </cfoutput>
    </body>
</html>
<script>
    $(document).ready(function()
    {
        $("#running").tablesorter();
        $("#riding").tablesorter();
    }
);


</script>
