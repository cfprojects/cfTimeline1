<cfsavecontent variable="desc">
<a href="http://www.wwe.com">te</a><img src="mxna.jpg">
</cfsavecontent>
<script src="dump.js"></script>

<script type="text/javascript">
center = function(){
var dt = cfTimeline.getEarliestDate(test,0);
cfTimeline.setCenterVisibleDate(test, 0, dt)
}
</script>
<input type="button" name="test" value="Load XML Feed And Re-center" onclick="cfTimeline.loadXML('test', 'feed.cfm?feed=goog', center)">
<input type="button" name="test" value="Load XML Feed Without Re-center" onclick="cfTimeline.loadXML('test', 'feed.cfm')">
<input type="button" name="test2" value="Earliest Date" onclick="alert(cfTimeline.getEarliestDate(test,0));">
<input type="button" name="test4" value="Latest Date" onclick="alert(cfTimeline.getLatestDate(test,0));">
<input type="button" name="test5" value="Clear" onclick="cfTimeline.clearTimeline(test,0)">

<cfoutput>
<input type="button" name="test6" value="Jump To Now()" onclick="cfTimeline.setCenterVisibleDate(test,0, '#JSStringFormat(now())#')">
</cfoutput>
<input type="button" name="test7" value="Jump To Christmas" onclick="cfTimeline.setCenterVisibleDate(test, 0, '12/25/2007')">
<input type="button" name="test8" value="Scroll To Christmas" onclick="cfTimeline.scrollToCenter(test, 0, '12/25/2007');">


<cf_timeline id="test" timelineHeight="250" creationComplete="center" xmlEvents="feed.cfm">
	<cf_timelineband dateUnit="hour" intervalWidth="100" bandheight="70" />
	<cf_timelineband dateUnit="day" intervalWidth="100" bandheight="20" showEventText="false" trackHeight="0.2" trackGap="0.5" />
	<cf_timelineband dateUnit="month" intervalWidth="100" bandheight="10" showEventText="false" trackHeight="0.2" trackGap="0.5" />
</cf_timeline>