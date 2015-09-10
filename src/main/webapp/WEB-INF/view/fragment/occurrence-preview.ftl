<#include "../inc/functions.ftl">

<div id="occ_preview_control"><span id="preview_close">${rc.getMessage("view.preview.close")} &times;</span></div>
<div id="occ_preview_content">

<h2>${page.occModel.scientificname!}</h2>
<#if page.occModel.typestatus?has_content>
	<p><strong>${rc.getMessage("occ.typestatus")}</strong>: ${page.occModel.typestatus!}</p>
</#if>

<dl class="occ_preview_classification clear_fix">
	<#if page.occModel.kingdom?has_content>
		<dt>${rc.getMessage("occ.kingdom")}: </dt><dd>${page.occModel.kingdom!}</dd></br>
	</#if>
	<#if page.occModel.phylum?has_content>
		<dt>${rc.getMessage("occ.phylum")}: </dt><dd>${page.occModel.phylum!}</dd></br>
	</#if>
	<#if page.occModel._class?has_content>
		<dt>${rc.getMessage("occ._class")}: </dt><dd>${page.occModel._class!}</dd></br>
	</#if>
	<#if page.occModel._order?has_content>
		<dt>${rc.getMessage("occ._order")}: </dt><dd>${page.occModel._order!}</dd></br>
	</#if>
	<#if page.occModel.family?has_content>
		<dt>${rc.getMessage("occ.family")}: </dt><dd>${page.occModel.family!}</dd></br>
	</#if>
	<#if page.occModel.genus?has_content>
		<dt>${rc.getMessage("occ.genus")}: </dt><dd>${page.occModel.genus!}</dd></br>
	</#if>
	<#if page.occModel.rawscientificname?has_content>
		<dt>${rc.getMessage("occ.rawscientificname")}: </dt><dd>${page.occModel.rawscientificname!}</dd>
	</#if>	
</dl>

<#if page.occModel._references?has_content>
 | <a id="viewsourcerecord" href="${page.occModel._references}" target="_blank">${rc.getMessage("view.preview.viewsourcerecord")}</a></p>
</#if>
<dl class="occ_preview_data clear_fix">
	<#assign publisher = page.resource.getPublisher()>
	<dt>${rc.getMessage("occ.institutioncode")}</dt><dd>${page.occModel.institutioncode!}</dd>
	<dt>${rc.getMessage("occ.publishername")}</dt><dd><a href="${rc.getContextPath()}/${rc.getMessage("publisherspage.publisherlink")}/${publisher.getAuto_id()}" target"_self">${publisher.getName()}</a></dd>
	<dt>${rc.getMessage("occ.datasetname")}</dt>
	<#assign datasetName = page.occModel.datasetname!>
	<#if datasetName?has_content>
		<dd>${datasetName}</dd>
	<#else>
		<#assign resource = page.resource>
		<dd><a href="${rc.getContextPath()}/${rc.getMessage("resourcepage.resource")}/${resource.getId()}" target"_self">${resource.getName()}</a></dd>
	</#if>	
</dl>
<dl class="occ_preview_data clear_fix">
	<dt>${rc.getMessage("occ.catalognumber")}</dt><dd>${page.occModel.catalognumber!}</dd>
	<dt>${rc.getMessage("occ.recordedby")}</dt><dd>${page.occModel.recordedby!}</dd>
	<dt>${rc.getMessage("occ.recordnumber")}</dt><dd>${page.occModel.recordnumber!}</dd>
</dl>
<dl class="occ_preview_data clear_fix">
<#assign formattedStartDate = formatdate(page.occModel.syear!0,page.occModel.smonth!0,page.occModel.sday!0)>
<#assign formattedEndDate = formatdate(page.occModel.eyear!0,page.occModel.emonth!0,page.occModel.eday!0)>
	<dt>${rc.getMessage("view.preview.daterange")}</dt><dd>${formattedStartDate}<#if formattedEndDate?has_content>/${formattedEndDate}</#if></dd>
</dl>
<dl class="occ_preview_data clear_fix">
	<dt>${rc.getMessage("occ.country")}</dt><dd>${page.occModel.country!}</dd>
	<dt>${rc.getMessage("occ.stateprovince")}</dt><dd>${page.occModel.stateprovince!}</dd>
	<dt>${rc.getMessage("occ.locality")}</dt><dd>${page.occModel.locality!}</dd>
	<!--
	<dt>${rc.getMessage("view.preview.latlong")}</dt><dd>${page.occModel.decimallatitude!} ${page.occModel.decimallongitude!}</dd>
	<#assign altituteStr = "">
	<#if page.occModel.minimumelevationinmeters??>
		<#assign altituteStr = page.occModel.minimumelevationinmeters>
		<#if page.occModel.maximumelevationinmeters?? && (page.occModel.minimumelevationinmeters != page.occModel.maximumelevationinmeters)>
			<#assign altituteStr =  altituteStr + "-" + page.occModel.maximumelevationinmeters>
		</#if>
		<#assign altituteStr =  altituteStr + " m">
	</#if>	
	<dt>${rc.getMessage("view.preview.altituderange")}</dt><dd>${altituteStr}</dd>
	-->
</dl>
<p class="occ_preview_links"><a id="viewfullrecord" href="<@i18nResource resourceName="occurrence" param=page.occModel.auto_id?c/>" target="_blank">${rc.getMessage("view.preview.viewfullrecord")}</a>
<!-- dl class="occ_preview_data clear_fix">
	<dt>${rc.getMessage("occ.habitat")}</dt><dd>${page.occModel.habitat!}</dd>
</dl-->

<!--dl class="occ_preview_data clear_fix">
	<dt>${rc.getMessage("occ.associatedmedia")}</dt>
	<dd>
		<#if page.occViewModel.imageList?has_content>
			<a href="${page.occViewModel.imageList[0]}"><img src="${page.occViewModel.imageList[0]}" alt="${page.occModel.scientificname!} (${page.occModel.collectioncode!} ${page.occModel.catalognumber!})" target="_blank"/></a>
		<#elseif page.occViewModel.otherMediaList?has_content>
			<a href="${page.occViewModel.otherMediaList[0]}">${rc.getMessage("occpage.menu.associatedmedia")}</a>
		</#if>
	</dd>
</dl-->
</div>