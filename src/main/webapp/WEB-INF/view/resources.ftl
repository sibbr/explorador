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
		<h1>${rc.getMessage("resourcespage.resourcelist")}</h1>
		<table class="sortable">
			<thead>
				<tr>
					<th class="sorttable_alpha" scope="col">${rc.getMessage("resourcespage.resourcename")}</th>
					<th class="sorttable_alpha" scope="col">${rc.getMessage("resourcespage.archiveurl")}</th>
					<th class="sorttable_numerical" scope="col">${rc.getMessage("resourcespage.amountofrecords")}</th>
				</tr>
			</thead>
			<tbody>
				<#if page.resources?has_content>
					<#list page.resources as resource>
						<tr>
							<td><a href="${rc.getContextPath()}/${rc.getMessage("resourcepage.resource")}/${resource.getId()}" target"_self">${resource.getName()}</a></td>
							<td><a href="${resource.getArchive_url()}" target="_blank">${resource.getResource_uuid()}</a></td>
							<td>${rc.getMessage("resourcespage.notimplemented")}</td>
						</tr>
					</#list>
				</#if>
			</tbody>
		</table>				
	</div>
</div><#-- body -->