<#ftl strip_whitespace=true>
<#include "inc/functions.ftl">
<#include "inc/paging.ftl">
<#include "inc/global-functions.ftl">
<head>
<title>${rc.getMessage("publisherspage.title")}</title>
<@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
<@jsLibAsset libName="sorttable.js"/>

</head>
<div id="body">
	<a id="main-content"></a>
	<div id="content" class="clear_fix no_side_bar">
		<h1>${rc.getMessage("publisherspage.publisherlist")}</h1>
		<table class="sortable">
			<thead>
				<tr>
					<th class="sorttable_alpha" scope="col">${rc.getMessage("publisherspage.publishername")}</th>
					<th class="sorttable_alpha" scope="col">${rc.getMessage("publisherspage.recordcount")}</th>
					<th class="sorttable_numerical" scope="col">${rc.getMessage("publisherspage.logo")}</th>
				</tr>
			</thead>
			<tbody>
				<#if page.publishers?has_content>
					<#list page.publishers as publisher>
						<#if (publisher.getRecord_count()>0)>
							<tr>
								<td><a href="${rc.getContextPath()}/${rc.getMessage("publisherpage.publisher")}/${publisher.getId()}" target"_self">${publisher.getName()}</a></td>
								<td>${publisher.getRecord_count()}</td>
								<td><img url='${publisher.getLogo_url()}'/></td>
							</tr>
						</#if>	
					</#list>
				</#if>
			</tbody>
		</table>
	   	<#if ((page.totalpublishers!0) >= page.pageSize)>
	   		<#assign p = (page.currentPage!1)?number>
			<@pages 1..page.totalPages p />
		</#if>
   	</div>
</div>