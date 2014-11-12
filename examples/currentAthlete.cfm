<html>
    <head>
        <title>cfStravaAPI - Current Athlete</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <a href="/index.cfm">Return to examples...</a>

        <cfset data = application.strava.getCurrentAthelete(session.token) />

        <cfdump var="#data#" label="current athelete">
    </body>
</html>
