<html>
    <head>
        <title>cfStravaAPI - Current Athlete Activities</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="/index.cfm">Return to examples...</a>

        <cfset data = application.strava.getActivities(session.token) />

        <p>From Strava Documentation: <a href="http://strava.github.io/api/#access">http://strava.github.io/api/#access</a></p>

        <p>Requests that return multiple items will be paginated to 30 items by default. The page parameter can be used to specify further pages or offsets. The per_page may also be used for custom page sizes up to 200.</p>

        <cfdump var="#data#" label="current athelete activities">
    </body>
</html>
