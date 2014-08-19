<#-- some /WEB-INF/view/inc/.ftl can come from portal-web-core project -->
<#include "/WEB-INF/view/inc/global-functions.ftl">

<!DOCTYPE html>
<html lang="${rc.getLocale().getLanguage()}">
<head>
<meta charset="UTF-8">
<title><sitemesh:write property='title'>Title goes here</sitemesh:write></title>
<link rel="stylesheet" href="http://institucional.sibbr.gov.br/wp-content/themes/portal/styles/data-common.css" media="screen,print"/>

<link rel="icon" href="http://institucional.sibbr.gov.br/wp-content/themes/portal/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://institucional.sibbr.gov.br/wp-content/themes/portal/favicon.ico" type="image/x-icon" />

<sitemesh:write property='head'/>
<#include "/WEB-INF/view/inc/ga.ftl">
</head>
<body>
	<div id="skip-link">
		<a href="#main-content" class="skipnav">${rc.getMessage("header.skip")}</a>
	</div>
	<#if feedbackURL?? && feedbackURL?has_content>
	<div id="feedback_bar"><a href="${feedbackURL}" target="_blank" title="${rc.getMessage("feedback.hover")}">&nbsp;</a></div>
	</#if>
	<#include "include/header-div.ftl">

	<sitemesh:write property='body'/>
	<#include "include/footer.ftl">
	<sitemesh:write property='page.local_script'/>
</body>
</html>