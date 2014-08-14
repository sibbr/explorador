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
		<!-- Biodiversity Heritage Library -->
		<h2>${rc.getMessage("occpage.other.biodiversity.heritage.library")}</h2>
		<ul>
			<#if page.occBHL?has_content>
				<a href="http://www.biodiversitylibrary.org/name/${page.occModel.scientificname?if_exists}" target="_blank">
					<i>${rc.getMessage("occpage.other.search.bhl")}</i>					
				</a>
				<#list page.occBHL?if_exists as item>
					<#if (item.getBhlPages()?size > 0)>
						<li><h3>${rc.getMessage("occpage.other.confirmedname")}: <i>${item.getNameConfirmed()}</i></h3></li>
						<#list item.getBhlPages() as page>
							${page_index + 1}. ${page.getShortTitle()}</a> 
							<a href="http://www.biodiversitylibrary.org/page/${page.getPageId()}" target="_blank">[${page.getPublisherName()}
							<#if page.getPublicationDate()?? && page.getPublicationDate()?has_content>${page.getPublicationDate()}</#if>]</a>
							</br>
						</#list>
					</#if>
				</#list>
			<#else>
				<ul>
					<li> ${rc.getMessage("occpage.other.bhl.taxon.not.found")}</li>
				</ul>	
			</#if>
		</ul>
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
