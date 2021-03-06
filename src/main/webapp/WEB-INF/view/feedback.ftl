<#ftl strip_whitespace=true>
<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<head>
<title>SiBBr - ${rc.getMessage("contact.header")}</title>
<@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
</head>
<div id="body">
	<a id="main-content"></a>
	<div id="content" class="clear_fix no_side_bar">
		<h1>${rc.getMessage("contact.header")}</h1>
		<h2>${rc.getMessage("contact.description")}</h2>
		<div style="width: 100%;">
			<form method="POST" id="sendmailform" name="sendmailform">
				${rc.getMessage("resourcecontact.name")}: </br>
				<input type="text" name="name" style="width: 50%; margin:3px;"/></br>
				${rc.getMessage("resourcecontact.email")}: </br>
				<input type="text" name="email" style="width: 50%;margin:3px;"/></br>
				${rc.getMessage("resourcecontact.message")}: <textarea form="sendmailform" id="message" name="message" cols="100" placeholder=${rc.getMessage("resourcecontact.tip")} style="height: 250px; width: 100%; border: 2px solid; border-color: #b4b4b4; resize: vertical;"></textarea></br>
				<input type="hidden" name ="mailto" value=${feedbackMailTo}>
				<input type="hidden" name ="subject" value=${rc.getMessage("feedback.subject")}>
				<input type="submit" value=${rc.getMessage("resourcecontact.submit")} style="width:10%;float:right;padding:1px;">
			</form>
		</div>
	</div>
</div><#-- body -->