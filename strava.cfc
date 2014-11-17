component {

    public function init(client_id, client_secret){
        variables.client_id = arguments.client_id;
        variables.client_secret = arguments.client_secret;
        return this;
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
