<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<head>
<title>${rc.getMessage("page.search.title")}</title>
<@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
</head>
<a id="main-content"></a>
<div id="body">
	
	<div id="content" class="clear_fix">
		<h1>${rc.getMessage("occpage.other.information")} <i>${page.occModel.scientificname?if_exists}</i></h1>
		<div class="nav_container" id="occpage_navigation">
			<ul class="buttons">
				<li><a href="?view=normal">${rc.getMessage("occpage.header.button.normal")}</a></li>
				<li><a href="?view=dwc">${rc.getMessage("occpage.header.button.dwc")}</a></li>
				<li><a href="?view=other" class="selected">${rc.getMessage("occpage.header.button.other")}</a></li>
			</ul>
		</div>

		<h2>${rc.getMessage("occpage.other.references")}
			<a href="http://www.biodiversitylibrary.org/name/${page.occModel.scientificname?if_exists}" target="_blank">
				[${rc.getMessage("occpage.other.search.bhl")}]					
			</a>
		</h2>
		<ul>
			<#if page.occBHL?has_content>			
				<#list page.occBHL?if_exists as item>
					<li><h3>${rc.getMessage("occpage.other.confirmedname")}: ${item.getNameConfirmed()}</h3></li>
					<ul>
						<#list item.getBhlPages() as page>
							<li><a href="http://www.biodiversitylibrary.org/page/${page.getPageId()}" target="_blank">${page.getShortTitle()} - ${page.getPublisherName()} [${page.getPublicationDate()}]</a></li>  
						</#list>
					</ul>	
				</#list>
			<#else>
				<ul>
					<li> ${rc.getMessage("occpage.other.bhl.taxonnotfound")}</li>
				</ul>	
			</#if>
			
		</ul>
 		<h2>${rc.getMessage("occpage.other.enciclopedia.of.life")}</h2>
		<ul>
			<li>
				<a href="http://eol.org/search?q=${page.occModel.scientificname?if_exists}" target="_blank">
					${rc.getMessage("occpage.other.search.eol")}: <i>${page.occModel.scientificname?if_exists}</i>
				</a>
			</li>
			<li>
				<a href="http://www.catalogueoflife.org/col/search/all/key/${page.occModel.scientificname?if_exists}/match/1" target="_blank">
					${rc.getMessage("occpage.other.search.col")}: <i>${page.occModel.scientificname?if_exists}</i>
				</a>
			</li>		 
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
