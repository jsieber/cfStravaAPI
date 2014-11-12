<cfset authurl = application.strava.generateAuthUrl(application.callback)>
<html>
    <head>
        <title>cfStravaAPI - Current Athelete</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Login Required</h1>

        <p>
          In order to use this app, you must login with your Strava account. Click to login below.
        </p>

        <cfoutput>
        	<p>
               <a href="#authurl#" class="btn">Login</a>
        	</p>
        </cfoutput>
    </body>
</html>
