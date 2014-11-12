<!--- Validate the result --->
<cfparam name="url.code" default="">
<cfparam name="url.state" default="">
<cfparam name="url.error" default="">
<cfset result = application.strava.validateResult(url.code, url.error) />

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
        <cfif not result.status>

        	<cfoutput>
        		<h1>Error!</h1>
        		#result.message#
        	</cfoutput>
        	<cfabort>
        </cfif>

        <cfset session.token = result.token>
        <cfset session.loggedin = true>
        <cflocation url="index.cfm" addtoken="false">
    </body>
</html>
