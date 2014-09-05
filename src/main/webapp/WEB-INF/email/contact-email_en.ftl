<!DOCTYPE html>
<html>
<body>
	<head><metacharset="UTF-8"></head>
	<style type="text/css">
	a { text-decoration: none; }
	a:hover { text-decoration: underline; }
	a:visited { color: #00A81B; }
	</style>
	<div style="color: #22241e; font-family: 'Lucida Grande', Arial, Sans-Serif; font-size: 14px; line-height: 1.5em; padding: 18px 36px">
		<p>Hello, dear publisher <#if nameto?has_content> ${nameto}</#if>. User <b><#if namefrom?has_content>${namefrom}</#if></b> <a href="${mailfrom}">(${mailfrom})</a> has sent you the following message from our portal:</p>
		<div style="border: 0px solid;border-radius: 25px;background: #E4F1CA;width: 90%;text-decoration: none; margin: auto; padding: 5px 5px 5px 30px">
			<p>"${message}"</p>
			<a href="${occurrenceUrl}">${occurrenceUrl}</a>
		</div>	
		<p>Please, in order to answer it, contact the user <#if namefrom?has_content>${namefrom}</#if> directly through the address <a href="${mailfrom}">(${mailfrom})</a>.
		<p>Thank you, SiBBr team.</p>
		<p>This message was sent ${time}.</p>
		<p><small style="float: right">SiBBr does not take responsability for the content of the e-mails sent through our services.</small></p>
	</div>
</body>
</html>