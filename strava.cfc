component {

    public function init(client_id, client_secret){
        variables.client_id = arguments.client_id;
        variables.client_secret = arguments.client_secret;
        return this;
    }

		public function convertMetersToMiles( required numeric distanceInMeters){
            var distanceInMiles = arguments.distanceInMeters * 0.00062137;
            return distanceInMiles;
        }



        /**
		 * Takes a time in seconds argument and converts to a time string in &quot;4d 12h 30m&quot; format.
		 * v0.9 by Simon Bingham
		 * v1.0 by Adam Cameron. Tweaking small bug if a float is passed-in rather than an integer.
		 *
		 * @param timeInSeconds      Time in seconds (Required)
		 * @param workingHoursPerDay      Number of hours to consider "a day" (Optional)
		 * @return Returns a string formatting the passed-in seconds value in days, hours and minutes
		 * @author Simon Bingham (me@simonbingham.me.uk)
		 * @version 1.0, September 29, 2012
		 */
		public string function convertSecondsToTimeString( required numeric timeInSeconds, string workingHoursPerDay=24 ){
		    // create a struct containing placeholder values for days, hours and minutes
		    var timeStruct = { days=0, hours=0, minutes=0 };

		    // create a variable to store the return value
		    var timeAsString = "";

		    // convert the number of working hours per day to seconds
		    var workingSecondsPerDay = arguments.workingHoursPerDay * 3600;

		    timeInSeconds = int(timeInSeconds); // will give unpredictable results if this is a float

		    // calculate the number of whole working days and add to the 'days' element of our structure
		    timeStruct.days = ( arguments.timeInSeconds - ( arguments.timeInSeconds mod workingSecondsPerDay ) ) / workingSecondsPerDay;
		    arguments.timeInSeconds = timeInSeconds mod workingSecondsPerDay;

		    // calculate the number of hours and add to the 'hours' element of our structure
		    timeStruct.hours = ( arguments.timeInSeconds - ( arguments.timeInSeconds mod 3600 ) ) / 3600;
		    arguments.timeInSeconds = arguments.timeInSeconds mod 3600;

		    // calculate the number of minutes and add to the 'minutes' element of our structure
		    timeStruct.minutes = arguments.timeInSeconds / 60;

		    // build the return string
		    if( val( timeStruct.days ) ) timeAsString = timeStruct.days & "d ";
		    if( val( timeStruct.hours ) ) timeAsString &= timeStruct.hours & "h ";
		    if( val( timeStruct.minutes ) ) timeAsString &= numberFormat(timeStruct.minutes, "__") & "m";

		    // return the string
		    return trim( timeAsString );
		}

        public string function generateAuthURL(redirecturl) {
            return "https://www.strava.com/oauth/authorize?" &
                    "client_id=#urlEncodedFormat(variables.client_id)#" &
                    "&response_type=code"&
                    "&redirect_uri=#urlEncodedFormat(redirecturl)#";

        }

        public function getActivityMap(accessToken, activityID){
           var apiRequestUrl = "https://www.strava.com/api/v3/activities/#arguments.activityID#";
           var data = getData(apiRequestUrl, arguments.accessToken);
           return data;
        }

        public array function getActivities(accessToken){
            var apiRequestUrl = "https://www.strava.com/api/v3/athlete/activities";
            var data = getData(apiRequestUrl, arguments.accessToken);
            return data;
        }

        public struct function getCurrentAthelete(accessToken){
            var apiRequestUrl = "https://www.strava.com/api/v3/athlete";
            var data = getData(apiRequestUrl, arguments.accessToken);
            return data;
        }

        private any function getData(url, accessToken){
            var httpCall = new http();
            httpCall.setURL("#arguments.url#");
            httpCall.setMethod("get");
            httpCall.addParam(type="URL", name="access_token", value="#arguments.accessToken#");
            httpCall.setResolveURL(true);
            var result = httpCall.send().getPreFix();
            return deserializeJSON(result.filecontent);
        }

        public array function getK_QOMs_CRs(accessToken, athleteID){
            var apiRequestUrl = "https://www.strava.com/api/v3/athletes/#arguments.athleteID#/koms";
            var data = getData(apiRequestUrl, arguments.accessToken);
            return data;
        }

        public struct function validateResult(code, error) {
            var result = {};

            if(error != ""){
                result.status = false;
                result.message = error;
                return result;
            }

            var token = getStravaToken(code);

            if(structKeyExists(token, "error")) {
                result.status = false;
                result.message = token.error;
                return result;
            }

            result.status = true;
            result.token = token.access_token;

            return result;

        }

        private function getStravaToken(code) {

            var httpCall = new http();
            httpCall.setURL("https://www.strava.com/oauth/token");
            httpCall.setMethod("post");
            httpCall.addParam(type="URL", name="client_id", value="#application.client_id#");
            httpCall.addParam(type="URL", name="client_secret", value="#application.client_secret#");
            httpCall.addParam(type="URL", name="code", value="#arguments.code#");
            httpCall.setResolveURL(true);
            var result = httpCall.send().getPrefix();
            var stravaAuthResponse = deserializeJSON(result.filecontent);
            //writeDump(var="#stravaAuthResponse#", abort=true);
            return stravaAuthResponse;

        }

}
