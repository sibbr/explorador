<#ftl strip_whitespace=true>
<#include "../inc/functions.ftl">
<#include "../inc/global-functions.ftl">
<head>
<title>${rc.getMessage("cwt.error.title")}</title>
<@cssAsset fileName="occportal" version=(page.currentVersion)! useMinified=false/>
</head>
<div id="body">
	<div id="content" class="no_side_bar">
		<h1>${rc.getMessage("cwt.error.title")}</h1>
		<p>${rc.getMessage("cwt.error.message")}
		<a href="${rc.getContextPath()}${rc.getMessage("feedback.url")}" target="_blank" title="${rc.getMessage("feedback.hover")}">&nbsp;</a>
		</p>
	</div>
</div>