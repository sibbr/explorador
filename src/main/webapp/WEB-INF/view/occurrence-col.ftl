<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<head>
<title>${rc.getMessage("page.search.title")}</title>
<@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
</head>
<a id="main-content"></a>
<div id="body">
	
	<div id="content" class="fullscreen">
		<#assign species = "<i>${page.occModel.scientificname?if_exists}</i>"> 
		<h1>${rc.getMessage("occpage.other.information")} <i>${page.occModel.scientificname?if_exists}</i></h1>
		<div class="nav_container" id="occpage_navigation">
			<ul class="buttons">
				<li><a href="?view=normal">${rc.getMessage("occpage.header.button.normal")}</a></li>
				<li><a href="?view=dwc">${rc.getMessage("occpage.header.button.dwc")}</a></li>
			</ul>	
		</div>
		<h2>${rc.getMessage("occpage.other.information")}:</h2>
		<table>
			<tr>
				<td><li><a href="?view=bhl">${rc.getMessage("occpage.other.biodiversity.heritage.library")}</a></li></td>
				<td><li><a href="?view=eol">${rc.getMessage("occpage.other.enciclopedia.of.life")}</a></li></td>
				<td><li><a href="?view=col">${rc.getMessage("occpage.other.catalog.of.life")}</a></li></td>
			</tr>
		</table>
		<!-- Catalog of Life -->		
 		<h2>${rc.getMessage("occpage.other.catalog.of.life")}</h2>
 		<#if page.occCOL?has_content>
			<a href="http://www.catalogueoflife.org/col/search/all/key/${page.occModel.scientificname?if_exists}/match/1" target="_blank">
				<i>${rc.getMessage("occpage.other.search.col")}</i>
			</a>
		<#else>
			<ul>
				<li> ${rc.getMessage("occpage.other.col.taxon.not.found")}</li>
			</ul>	
		</#if>
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
