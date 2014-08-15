<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<head>
<title>${rc.getMessage("page.search.title")}</title>
<@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
</head>
<a id="main-content"></a>
<div id="body">
	<div id="side_bar">
		<p><a class="round big_button no_margin" href="../contact">${rc.getMessage("occpage.menu.datasetcontact")}</a></p>
		<#if page.occRawModel._references?has_content >
		<p><a class="round big_button" href="${page.occRawModel._references}">${rc.getMessage("occpage.menu.sourcerecord")}</a></p>
		</#if>
		
		<div id="occpage_map" class="round">
		<#-- Map injected, will remove span element -->
		<span>${rc.getMessage("occpage.nogeo")}</span>
		</div>
		
		<#if page.occViewModel.imageList?has_content>
			<div id="occpage_image">
				<#list page.occViewModel.imageList as currImg>
				<a class="round" href="${currImg}"><span><img src="${currImg}" alt="<i>${page.occModel.scientificname?if_exists}</i> (${page.occModel.collectioncode?if_exists} ${page.occModel.catalognumber?if_exists})"/></span></a>
				</#list>
			</div>
		</#if>
		<#if page.occViewModel.otherMediaList?has_content>
			<div id="occpage_media">
				<#assign mediaNumber = 1>
				<#list page.occViewModel.otherMediaList as currOm>
				<p><a class="round big_button" href="${currOm}" target="_blank">${rc.getMessage("occpage.menu.associatedmedia")} ${mediaNumber}</a></p>
				<#assign mediaNumber = mediaNumber + 1>
				</#list>
			</div>
		</#if>
	</div>
	
	<div id="content" class="clear_fix">
		<h1><i>${page.occModel.scientificname?if_exists}</i> (${page.occModel.collectioncode?if_exists} ${page.occModel.catalognumber?if_exists})</h1>
		<p class="details">${rc.getMessage("occpage.header.details")}: ${page.occModel.sourcefileid?if_exists}/${page.occModel.dwcaid?if_exists}</p>
		<div class="nav_container" id="occpage_navigation">
			<ul class="buttons">
				<li><a href="?view=normal" class="selected">${rc.getMessage("occpage.header.button.normal")}</a></li>
				<li><a href="?view=dwc">${rc.getMessage("occpage.header.button.dwc")}</a></li>
			</ul>
		</div>
		<h3><i>${rc.getMessage("occpage.heather.desc.normal")}</i></h3>
		<h2>${rc.getMessage("occpage.other.information")}:</h2>
		<table>
			<tr>
				<td><li><a href="?view=bhl">${rc.getMessage("occpage.other.biodiversity.heritage.library")}</a></li></td>
				<td><li><a href="?view=eol">${rc.getMessage("occpage.other.enciclopedia.of.life")}</a></li></td>
				<td><li><a href="?view=col">${rc.getMessage("occpage.other.catalog.of.life")}</a></li></td>
			</tr>
		</table>
		<#if page.occModel.hastypestatus?? && page.occModel.hastypestatus>
			<h2>${rc.getMessage("occpage.group.typestatus")}</h2>
			<p>${page.occModel.typestatus!}</p>
		</#if>
		<!-- Taxa information -->
		<h2>${rc.getMessage("occpage.group.classification")}</h2>
		<table class="occpage_group">
			<tbody>
				<tr><th scope="row">${rc.getMessage("occ.kingdom")}</th><td><#if page.occModel.kingdom?has_content>${page.occModel.kingdom?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ.phylum")}</th><td><#if page.occModel.phylum?has_content>${page.occModel.phylum?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ._class")}</th><td><#if page.occModel._class?has_content>${page.occModel._class?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ._order")}</th><td><#if page.occModel._order?has_content>${page.occModel._order?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ.family")}</th><td><#if page.occModel.family?has_content>${page.occModel.family?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ.genus")}</th><td><#if page.occModel.genus?has_content>${page.occModel.genus?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ.scientificname")}</th><td><#if page.occModel.scientificname?has_content><i>${page.occModel.scientificname?if_exists}</i> <span class="remark">(${rc.getMessage("occpage.remark.interpretedfrom")}: ${page.occRawModel.scientificname?if_exists})</span><#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ.scientificnameauthorship")}</th><td><#if page.occModel.scientificnameauthorship?has_content>${page.occModel.scientificnameauthorship?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
			</tbody>
		</table>
		<!-- Geographic information -->
		<h2>${rc.getMessage("occpage.group.location")}</h2>
		<table class="occpage_group">
			<tbody>
				<tr><th scope="row">${rc.getMessage("occ.country")}</th><td><#if page.occModel.country?has_content>${page.occModel.country?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ.stateprovince")}</th><td><#if page.occModel.stateprovince?has_content>${page.occModel.stateprovince?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<#if page.occModel.county?has_content><tr><th scope="row">${rc.getMessage("occ.county")}</th><td>${page.occModel.county?if_exists}</td></tr></#if>	
				<tr><th scope="row">${rc.getMessage("occ.municipality")}</th><td><#if page.occModel.municipality?has_content>${page.occModel.municipality?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
				<tr><th scope="row">${rc.getMessage("occ.locality")}</th><td><#if page.occModel.locality?has_content>${page.occModel.locality?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td></tr>
			</tbody>
			<!-- Only needs to check one coordinate to know other values will not be relevant: -->
			<#if page.occModel.decimallatitude?has_content>
				<tbody>
					<tr>
					  <th scope="row">${rc.getMessage("occ.decimallatitude")}</th>
					  <td>${safeNumber(page.occModel.decimallatitude!"","")}</td>
					</tr>
					<tr>
					  <th scope="row">${rc.getMessage("occ.decimallongitude")}</th>
					  <td>${safeNumber(page.occModel.decimallongitude!"","")}</td>
					</tr>
					<#if page.occRawModel.coordinateuncertaintyinmeters?has_content>
						<tr>
						  <th scope="row">${rc.getMessage("occ.coordinateuncertaintyinmeters")}</th>
						  <td>${page.occRawModel.coordinateuncertaintyinmeters?if_exists}</td>
						</tr>
					</#if>
				</tbody>
			</#if>
			<tbody>
				<#if page.occModel.minimumelevationinmeters?has_content>
					<tr>
					  <th scope="row">${rc.getMessage("occ.minimumelevationinmeters")}</th>
					  <td>${page.occModel.minimumelevationinmeters?if_exists}</td>
					</tr>
				</#if>
				<#if page.occModel.maximumelevationinmeters?has_content>
					<tr>
					  <th scope="row">${rc.getMessage("occ.maximumelevationinmeters")}</th>
					  <td>${page.occModel.maximumelevationinmeters?if_exists}</td>
					</tr>
				</#if>	
			</tbody>
			<#if page.occModel.habitat?has_content>
				<tboby>
					<tr>
					  <th scope="row">${rc.getMessage("occ.habitat")}</th>
					  <td>${page.occModel.habitat?if_exists}</td>
					</tr>
				</tbody>
			</#if>	
		</table>
		<!-- Date information -->
		<#if page.occModel.syear?has_content && page.occModel.smonth?has_content && page.occModel.sday?has_content>
			<h2>${rc.getMessage("occpage.group.date")}</h2>
			<table class="occpage_group">
			<tbody>
				<tr>
				  <th scope="row">${rc.getMessage("view.preview.daterange")}</th>
				  <td>${formatdate(page.occModel.syear!-1,page.occModel.smonth!-1,page.occModel.sday!-1)}</td>
				</tr>
			</tbody>
			</table>
		</#if>	
		<!-- Specimen information -->
		<h2>${rc.getMessage("occpage.group.specimen")}</h2>
		<table class="occpage_group">
		<tbody>
			<tr>
			  <th scope="row">${rc.getMessage("occ.collectioncode")}</th>
			  <td><#if page.occModel.collectioncode?has_content>${page.occModel.collectioncode!}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
			<tr>
			  <th scope="row">${rc.getMessage("occ.catalognumber")}</th>
			  <td><#if page.occModel.catalognumber?has_content>${page.occModel.catalognumber!}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
			<tr>
			  <th scope="row">${rc.getMessage("occ.recordedby")}</th>
			  <td><#if page.occModel.recordedby?has_content>${page.occModel.recordedby!}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
			<tr>
			  <th scope="row">${rc.getMessage("occ.recordnumber")}</th>
			  <td><#if page.occModel.recordnumber?has_content>${page.occModel.recordnumber!}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
		</tbody>
		</table>
		
		<#-- associatedSequences, optional section -->
		<#if page.occViewModel.associatedSequencesPerProviderMap?has_content>
		<h2>${rc.getMessage("occpage.group.associatedsequences")}</h2>
		<table class="occpage_group">
		<tbody>
			<#list page.occViewModel.associatedSequencesPerProviderMap?keys as sequenceProvider>
			  <#list page.occViewModel.associatedSequencesPerProviderMap[sequenceProvider] as associatedSequence>
			  	<tr>
			  		<#-- dont't repeat header text -->
			  		<th scope="row"><#if associatedSequence_index == 0>${sequenceProvider}</#if></th>
					<td><@hrefIfNotEmpty text=associatedSequence.getLeft() link=associatedSequence.getRight()/></td>
				</tr>
			  </#list>
			</#list>
		</tbody>
		</table>
		</#if>
		<!-- Record information --> 
		<h2>${rc.getMessage("occpage.group.record")}</h2>
		<table class="occpage_group">
		<tbody>
			<tr>
			  <th scope="row">${rc.getMessage("occ.dwcaid")}</th>
			  <td><#if page.occModel.dwcaid?has_content>${page.occModel.dwcaid?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
			<tr>
			  <th scope="row">${rc.getMessage("occ.basisofrecord")}</th>
			  <td><#if page.occModel.basisofrecord?has_content>${page.occRawModel.basisofrecord?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
			<tr>
			  <th scope="row">${rc.getMessage("occ.modified")}</th>
			  <td><#if page.occModel.modified?has_content>${page.occRawModel.modified?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
		</tbody>
		</table>
		<!-- Dataset information -->
		<h2>${rc.getMessage("occpage.group.dataset")}</h2>
		<table class="occpage_group">
		<tbody>
			<tr>
			  <th scope="row">${rc.getMessage("occ.institutioncode")}</th>
			  <td><#if page.occModel.institutioncode?has_content>${page.occModel.institutioncode?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
			<tr>
			  <th scope="row">${rc.getMessage("occ.datasetname")}</th>
			  <td><#if page.occModel.datasetname?has_content>${page.occModel.datasetname!}<#elseif page.occViewModel.dataSourceName?has_content>${page.occViewModel.dataSourceName}<span class="remark">(${rc.getMessage("occpage.remark.interpretedfrom.dataset.metadata")})</span><#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
			<tr>
			  <th scope="row">${rc.getMessage("occ.rights")}</th>
			  <td><#if page.occModel.rights?has_content>${page.occRawModel.rights?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
			</tr>
			<tr>
			  <th scope="row">${rc.getMessage("occpage.sourcefile")}</th>
			  <td>
			  	<#if page.occViewModel.dataSourcePageURL?has_content>
			  		<@hrefIfNotEmpty text=page.occModel.sourcefileid! link=page.occViewModel.dataSourcePageURL!/>
			  	<#else>${rc.getMessage("occ.not.provided")}
			  	</#if>
			  </td>
			</tr>
		</tbody>
		</table>
	</div>
</div><#-- body -->
<#assign coordinateuncertaintyinmeters=0>
<#if page.occRawModel.coordinateuncertaintyinmeters?? && (page.occRawModel.coordinateuncertaintyinmeters?length>0)>
<#assign coordinateuncertaintyinmeters=page.occRawModel.coordinateuncertaintyinmeters?number>
</#if>

<#-- JavaScript handling -->
<content tag="local_script">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
<@jsAsset fileName="explorer" version=page.currentVersion! useMinified=page.useMinified/>
<@jsAsset fileName="explorer.portal" version=page.currentVersion! useMinified=page.useMinified/>
<script>
$(function() {
  EXPLORER.details.setupSingleOccurrenceMap('occpage_map',${safeNumber(page.occModel.decimallatitude!"","undefined")},${safeNumber(page.occModel.decimallongitude!"","undefined")},${coordinateuncertaintyinmeters?c});
});
</script>
</content>