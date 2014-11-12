component {
    this.name = "cfStravaAPI";
    this.sessionManagement = true;

    public function onApplicationStart() {
        application.client_id=" your client id ";
        application.client_secret = " your client secert ";
        //application.stravaredirecturl = "http://cfstravaapi.com/redirect.cfm";
        application.callback="http://cfstravaapimaster.com/callback.cfm";

        application.strava = new strava(application.client_id, application.client_secret);
    }

    public function onRequestStart(required string req) {
        if(structKeyExists(url, "reinit")) {
            onapplicationStart();
        }

        if(!findNoCase("/login.cfm", arguments.req) && !findNoCase("/callback.cfm", arguments.req) && !session.loggedin) {
    		location(url="./login.cfm", addToken="false");
    	}
    	return true;
    }

    public boolean function onSessionStart() {
        session.loggedin = false;

        return true;
    }
}
