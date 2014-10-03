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
		<h1>Resources list</h1>
		<table class="sortable">
			<thead>
				<tr>
					<th class="sorttable_alpha" scope="col">Dataset name</th>
					<th class="sorttable_alpha" scope="col">Publisher name</th>
					<th class="sorttable_numerical" scope="col">Amount of records</th>
				</tr>
			</thead>
			<tbody>
				<#if page.resources?has_content>
					<#list page.resources as resource>
						<tr>
							<td><a href="#" target"_self">${resource.getName()}</a></td>
							<td>Not provided</td>
							<td>Not implemented</td>
						</tr>
					</#list>
				</#if>
			</tbody>
		</table>				
	</div>
</div><#-- body -->