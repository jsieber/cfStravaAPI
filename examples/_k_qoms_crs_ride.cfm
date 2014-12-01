<cfscript>
    param name="thisRecord.name" default="";
    param name="thisRecord.segment.activity_type" default="";
    param name="thisRecord.kom_rank" default="-";
    param nanme="thisRecord.elapsed_time" default="0";
    param name="thisRecord.distance" default="0";
    param name="thisRecord.pr_rank" default="-";
    param name="thisRecord.segment.average_grade" default="-";
    param name="thisRecord.segment.maximum_grade" default="-";
    param name="thisRecord.average_heartrate" default="-";
    param name="thisRecord.max_heartrate" default="-";
    param name="thisRecord.average_cadence" default="-";
    param name="thisRecord.average_watts" default="";
</cfscript>
<cfoutput>
<tr>
    <td>#thisRecord.name#</td>
    <td>#LSDateFormat(thisRecord.start_date, "long")# #LSTimeFormat( thisRecord.start_date, "short")#
    <td>#thisRecord.segment.activity_type#</td>
    <td data-sort-value="#thisRecord.elapsed_time#">#application.strava.convertSecondsToMinutes(thisRecord.elapsed_time)#</td>
    <td>#decimalFormat(application.strava.convertMetersToMiles(thisRecord.distance))#</td>
    <td>#thisRecord.kom_rank#</td>
    <td>#thisRecord.pr_rank#</td>
    <td>#thisRecord.segment.average_grade# %</td>
    <td>#thisRecord.segment.maximum_grade# %</td>
    <td>#thisRecord.average_heartrate#</td>
    <td>#thisRecord.max_heartrate#</td>
    <td>#thisRecord.average_cadence#</td>
    <td>#thisRecord.average_watts#</td>
</tr>
</cfoutput>
