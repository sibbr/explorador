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
		<h1>Datasets</h1>
		<h2>${page.resources.size()}</h2>
		<table class="sortable">
			<thead>
				<tr>
					<th class="sorttable_alpha" scope="col">Dataset Name</th>
					<th class="sorttable_alpha" scope="col">Publisher</th>
					<th class="sorttable_numeric" scope="col">Amount of records</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<#list page.resources as resource>
						<th>${resource.getResourceName()}</th>        		
						<th>Not provided</th>
						<th>Not implemented</th>
					</#list>
				</tr>
			</tbody>
		</table>
	</div>
</div>