<html>
    <head>
        <title>cfStravaAPI - List Athlete K/QOMs/CRs</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="/index.cfm">Return to examples...</a>
        <cfset athleteID = application.strava.getCurrentAthelete(session.token).id />
        <cfset data = application.strava.getK_QOMs_CRs(session.token, athleteID) />

        <p>From Strava Documentation: <a href="http://strava.github.io/api/v3/athlete/#koms">http://strava.github.io/api/v3/athlete/#koms</a></p>

        <p>Returns an array of segment efforts representing KOMs/QOMs and course records held by the given athlete. Results are sorted by date, newest first. Pagination is supported.</p>

        <cfdump var="#data#" label="current athelete activities">
    </body>
</html>
