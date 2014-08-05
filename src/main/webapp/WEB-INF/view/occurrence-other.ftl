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
				<li><a href="?view=other" class="selected">${rc.getMessage("occpage.header.button.other")}</a></li>
			</ul>
		</div>

		<h2>${rc.getMessage("occpage.other.biodiversity.heritage.library")}</h2>
			<i>
				<a href="http://www.biodiversitylibrary.org/name/${page.occModel.scientificname?if_exists}" target="_blank">
				${rc.getMessage("occpage.other.search.bhl")}					
				</a>
			</i>
		<ul>
			<#if page.occBHL?has_content>
				<#list page.occBHL?if_exists as item>
					<li><h3>${rc.getMessage("occpage.other.confirmedname")}: ${item.getNameConfirmed()}</h3></li>
					<#list item.getBhlPages() as page>
						${page_index + 1}. ${page.getShortTitle()}</a> 
						<a href="http://www.biodiversitylibrary.org/page/${page.getPageId()}" target="_blank">[${page.getPublisherName()}
						<#if page.getPublicationDate()?? && page.getPublicationDate()?has_content>${page.getPublicationDate()}</#if>]</a>
						</br>
					</#list>
				</#list>
			<#else>
				<ul>
					<li> ${rc.getMessage("occpage.other.bhl.taxon.not.found")}</li>
				</ul>	
			</#if>
		</ul>
		
 		<h2>${rc.getMessage("occpage.other.catalog.of.life")}</h2>
		<ul>
			<li>
				<a href="http://www.catalogueoflife.org/col/search/all/key/${page.occModel.scientificname?if_exists}/match/1" target="_blank">
					<i>${rc.getMessage("occpage.other.search.col")}</i>
				</a>
			</li>
		</ul>
				
 		<h2>${rc.getMessage("occpage.other.enciclopedia.of.life")}</h2>		
		<ul>	
			<li>
				<a href="http://eol.org/search?q=${page.occModel.scientificname?if_exists}" target="_blank">
					<i>${rc.getMessage("occpage.other.search.eol")}</i>
				</a>
			</li>
		</ul>		
		<#if page.occEOL?has_content>
			<!-- Expected list with single item, for exact matches searches: -->
			<#list page.occEOL?if_exists as item>
				<ui>
					<li>
						<b>${rc.getMessage("occpage.other.confirmedname")}:</b> <a href="${item.getLink()}" target="_blank"> ${item.getTitle()}</a>
					</li>
					</br>
					<!-- Pages: -->
					<#list item.getPages() as page>
						<!-- Richness score for the name -->
						<li> <b>Richness Score:</b> ${page.getRichnessScore()}</li>
						</br>
						<!-- Synonyms for the name -->
						<li> <b>Synonyms:</b> ${species} is a synonym to the following names, with the following relationship:</li>
						<#if page.getSynonyms()?has_content>
							<table style="border:1px solid black;border-collapse:collapse;">
								<tr>
									<th></th>
									<th>Synonym</th>
									<th>Relationship</th>
								</tr>
								<#list page.getSynonyms() as synonym>
									<tr>
										<td>${synonym_index+1}.</td>
										<td>${synonym.getSynonym()}</td>
										<td>${synonym.getRelationship()}</td>
									</tr>
								</#list>
							</table>
						<#else>
							<li>No synonyms found for this name in EOL.</li>
						</#if>
						</br>
						<!-- Vernacular names for the name -->						
						<li> <b>Vernacular names:</b> List of common/vernacular names for this taxa:</li>
						<#if page.getVernacularNames()?has_content>
							<table style="border:1px solid black;border-collapse:collapse;">
								<tr>
									<th></th>
									<th>Vernacular name</th>
									<th>Language</th>
								</tr>
								<#list page.getVernacularNames() as name>
									<tr>
										<td>${name_index+1}.</td>
										<td>${name.getVernacularName()}</td>
										<td>${name.getLanguage()}</td>
									</tr>
								</#list>
							</table>
						<#else>
							<li>No vernacular names found for this name in EOL.</li>	
						</#if>
						</br>
						<!-- Taxon concepts for the name -->
						<li> <b>Taxon concept:</b> List of taxon concepts related to this taxa and related information:</li>
						<#if page.getTaxonConcepts()?has_content>
							<table style="border:1px solid black;">
								<tr>
									<th></th>
									<th>Scientific name</th>
									<th>Canonical form</th>
									<th>According to</th>
									<th>Taxon Rank</th>
								</tr>
								<#list page.getTaxonConcepts() as concept>
									<tr>
										<td>${concept_index+1}.</td>
										<td><i>${concept.getScientificName()}</i></td>
										<td><i>${concept.getCanonicalForm()}</i></td>
										<td>${concept.getAccordingTo()}</td>
										<td>${concept.getTaxonRank()}</td>
									</tr>
								</#list>
							</table>
						<#else>
							<li>No taxon concepts found for this name in EOL.</li>	
						</#if>
						
						<!-- Data objects for the name -->
						<#if page.getDataObjects()?has_content>
							</br>
							<h3>List of published data objects related to this taxa:</h3>
							<#list page.getDataObjects() as dataObjects>
							<li><h2>${dataObjects_index+1}. ${dataObjects.getDescription()}</h2></li>
								<ui>
									<#if dataObjects.getMimeType()?matches("image/jpeg")>
										<a href="${dataObjects.getMediaURL()}" target="_blank">
											<img src="${dataObjects.getEolThumbnail()}" alt="${dataObjects.getTitle()}">
										</a>
										</br>
										<a href="${dataObjects.getSource()}" target="_blank">Image source</a>
									</#if>
									<li><b>Mime type:</b> <a href="${dataObjects.getDataType()}" target = "_blank">${dataObjects.getMimeType()}</a></li>
									<li><b>Data rating:</b> ${dataObjects.getDataRating()}</li>
									<li><b>Subject:</b> ${dataObjects.getSubject()}</li>
									<li><b>Language:</b> ${dataObjects.getLanguage()}</li>
									<li><b>License:</b> ${dataObjects.getLicense()}</li>
									<li><b>Rights holder:</b> ${dataObjects.getRightsHolder()}</li>
								</ui>
								<#if dataObjects.getAgents()?has_content>
									<li><b>Agents:</b></li>
									<table style="border:1px solid black;border-collapse:collapse;">
										<tr>
											<th>Full name</th>
											<th>Data rating</th>
											<th>Role</th>
										</tr>
										<#list dataObjects.getAgents() as agent>
											<tr>
												<td>${agent.getFullName()}</td>
												<td>${agent.getHomepage()}</td>
												<td>${agent.getRole()}</td>
											</tr>
										</#list>
									</table>
								</#if>
								</br>
							</#list><!-- End data objects list -->
						</#if>	
					</#list><!-- End pages list -->	
				</ui>
			</#list><!-- End items list -->
		<#else>
			<ul>
				<li> ${rc.getMessage("occpage.other.eol.taxon.not.found")}</li>
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
