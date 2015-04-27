<cfsavecontent variable="center">
<script type="text/javascript">
center = function(){
	var dt = cfTimeline.getEarliestDate(myTimeline,0);
	cfTimeline.scrollToCenter(myTimeline, 0, dt)
}
</script>
</cfsavecontent>
<cfhtmlhead text="#center#">

<cf_timeline id="myTimeline" 
	timelineHeight="250"
	start="#now()#"
	xmlEvents="/blog/client/cfTimeline/feed.cfm?feed=mxna"
	labelWidth="250"
	creationComplete="center"
	style="font-size: 8pt; font-family: Trebuchet MS, Helvetica, Arial, sans serif; border: 1px solid ##aaa;">
	<cf_timelineband 
		bandHeight="80"
		showEventText="true" 
		dateUnit="hour" 
		intervalWidth="400" />
	<cf_timelineband 
		bandHeight="20"
		showEventText="false" 
		dateUnit="day"
		intervalWidth="200" 
		highlight="true"
		trackHeight="0.5"
		trackGap="0.2" />
</cf_timeline>
<div align="center">
<input type="button" name="first" value="Oldest Post" onclick="cfTimeline.scrollToCenter(myTimeline,0,cfTimeline.getEarliestDate(myTimeline,0));" style="width: 115px;">
<input type="button" name="loadMXNA" value="MXNA" onclick="cfTimeline.loadXML(myTimeline, '/blog/client/cfTimeline/feed.cfm?feed=mxna',center)" style="width: 115px;">
<input type="button" name="loadGoog" value="FullAsAGoog" onclick="cfTimeline.loadXML(myTimeline, '/blog/client/cfTimeline/feed.cfm?feed=goog',center)" style="width: 115px;">
<input type="button" name="last" value="Most Recent Post" onclick="cfTimeline.scrollToCenter(myTimeline,0,cfTimeline.getLatestDate(myTimeline,0));" style="width: 115px;">
</div>

