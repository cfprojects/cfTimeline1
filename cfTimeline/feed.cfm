<cfsetting showdebugoutput="false">
<cfparam name="url.feed" default="">

<cfscript>
/**
 * Converts text string of ISO Date to datetime object; useful for parsing RSS and RDF.
 * 
 * @param str 	 ISO datetime string to parse. (Required)
 * @return Returns a date. 
 * @author James Edmunds (jamesedmunds@jamesedmunds.com) 
 * @version 1, September 21, 2004 
 */
function ISODateToTS(str) {
	return ParseDateTime(ReplaceNoCase(left(str,16),"T"," ","ALL"));
}
</cfscript>

<cfswitch expression="#url.feed#">
	<cfcase value="goog">
		<cfset feedURL = "http://www.fullasagoog.com/xml/ColdFusionMX.xml">
		<cfset icon = "goog.png">
	</cfcase>
	<cfdefaultcase>
		<cfset feedURL = "http://weblogs.macromedia.com/mxna/xml/rss.cfm?query=bySmartCategory&languages=1&smartCategoryId=1&smartCategoryKey=D0382F3A-9D2B-69E8-C7BC317066FA1CC2">
		<cfset icon = "mxna.jpg">
	</cfdefaultcase>
</cfswitch>

<cfhttp url="#feedURL#" result="feed" />
<cfset feeds ="#xmlParse(feed.fileContent)#">

<cfcontent type="text/xml"><?xml version="1.0" encoding="UTF-8"?><data><cfoutput><cfloop from="1" to="#arrayLen(feeds["rdf:RDF"].item)#" index="item"><cfset thisPost = feeds["rdf:RDF"].item[item]><cfset posted = dateformat(ISODateToTS(thisPost["dc:date"].XMLText), "mm/dd/yyyy") & " " & timeformat(ISODateToTS(thisPost["dc:date"].XMLText), "HH:mm:ss")><event start="#posted#" title="#XMLFormat(thisPost.title.XMLText)#" link="#XMLFormat(thisPost.link.XMLText)#" icon="#XMLFormat(icon)#">#XMLFormat(thisPost.description.XMLText)#</event></cfloop></cfoutput></data>