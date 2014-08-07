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
					<#if (item.getBhlPages()?size > 0)>
						<li><h3>${rc.getMessage("occpage.other.confirmedname")}: ${item.getNameConfirmed()}</h3></li>
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
		
 		<h2>${rc.getMessage("occpage.other.catalog.of.life")}</h2>
		<a href="http://www.catalogueoflife.org/col/search/all/key/${page.occModel.scientificname?if_exists}/match/1" target="_blank">
			<i>${rc.getMessage("occpage.other.search.col")}</i>
		</a>
				
 		<h2>${rc.getMessage("occpage.other.enciclopedia.of.life")}</h2>		
		
		<a href="http://eol.org/search?q=${page.occModel.scientificname?if_exists}" target="_blank">
			<i>${rc.getMessage("occpage.other.search.eol")}</i>
		</a>
		</br>
		<#if page.occEOL?has_content>
			<!-- Expected list with single item, for exact matches searches: -->
			<#list page.occEOL?if_exists as item>
				<ui>
					<li>
						<b>${rc.getMessage("occpage.other.confirmedname")}:</b> <a href="${item.getLink()}" target="_blank"> ${item.getTitle()}</a>
					</li>
					<!-- Pages: -->
					<#list item.getPages() as page>
						<!-- Richness score for the name -->
						<li> <b>Richness Score:</b> ${page.getRichnessScore()}</li>

						<!-- Synonyms for the name -->
						<#if page.getSynonyms()?has_content>
							<li> <b>Synonyms:</b> ${species} is a synonym to the following names, with the following relationship:</li>
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
						</#if>
	
						<!-- Vernacular names for the name -->						
						<#if page.getVernacularNames()?has_content>
							<li> <b>Vernacular names:</b> List of common/vernacular names for this taxa:</li>
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
						</#if>
						
						<!-- Taxon concepts for the name -->
						<#if page.getTaxonConcepts()?has_content>
							<li><b>Taxon concept:</b> List of taxon concepts related to this taxa and related information:</li>
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
						</#if>
						
						<!-- Images related to the name -->
						<#assign images = page.getImages()>
						<#if images?has_content>
							<h3>There are ${images?size} images related to this name on EoL:</h3>
							<#list images as image>
							<li>
								<h2>
									${image_index+1}.
										<#if image.getTitle()?has_content>
											${image.getTitle()}
										<#else>
											Title not provided	
										</#if>
								</h2>
							</li>
								<ui>
									<a href="${image.getMediaURL()}" target="_blank">
										<img src="${image.getEolThumbnail()}" alt="${image.getTitle()}">
									</a>
									</br><a href="${image.getSource()}" target="_blank">Image source</a>
									<li><b>Mime type:</b> <a href="${image.getDataType()}" target = "_blank">${image.getMimeType()}</a></li>
									<li><b>Data rating:</b> ${image.getDataRating()}</li>
									<li><b>License:</b>
										<#if image.getLicense()?has_content>
											${image.getLicense()}
										<#else>
											Not provided
										</#if>
									</li>
									<li><b>Rights:</b> 
										<#if image.getRights()?has_content>
											${image.getRights()}
										<#else>
											Not provided	
										</#if>
									</li>	
									<li><b>Rights holder:</b>
										<#if image.getRightsHolder()?has_content>
											${image.getRightsHolder()}
										<#else>
											Not provided
										</#if>	
									</li>
									<li><b>Description: </b>
										<#if image.getDescription()?has_content>
											${image.getDescription()}
										<#else>
											Not provided
										</#if>
									</li>
								</ui>
								<#if image.getAgents()?has_content>
									<li><b>Agents:</b></li>
									<table style="border:1px solid black;border-collapse:collapse;">
										<tr>
											<th>Full name</th>
											<th>Data rating</th>
											<th>Role</th>
										</tr>
										<#list image.getAgents() as agent>
											<tr>
												<td>${agent.getFullName()}</td>
												<td>${agent.getHomepage()}</td>
												<td>${agent.getRole()}</td>
											</tr>
										</#list>
									</table>
								</#if>
								</br>
							</#list><!-- End images list -->
						</#if>
						
						<!-- Audio related to the name -->
						<#assign audioFiles = page.getAudio()>
						<#if audioFiles?has_content>
							<h3>There are ${audioFiles?size} audio files related to this name on EoL:</h3>
							<#list audioFiles as audio>
							<li>
								<h2>
									${audio_index+1}.
										<#if audio.getTitle()?has_content>
											${audio.getTitle()}
										<#else>
											Title not provided	
										</#if>
								</h2>
							</li>
								<ui>
									<audio controls>
										<source src="${audio.getMediaURL()}" type="${audio.getMimeType()}">
										Sorry, your browser does not support this audio format.
									</audio>	
									<li>
										</b>Source: </b>
										<a href="${audio.getSource()}" target="_blank">${audio.getSource()}</a>
									</li>	
									<li><b>Mime type:</b> <a href="${audio.getDataType()}" target = "_blank">${audio.getMimeType()}</a></li>
									<li><b>License:</b>
										<#if audio.getLicense()?has_content>
											${audio.getLicense()}
										<#else>
											Not provided
										</#if>
									</li>
									<li><b>Rights:</b> 
										<#if audio.getRights()?has_content>
											${audio.getRights()}
										<#else>
											Not provided	
										</#if>
									</li>	
									<li><b>Rights holder:</b>
										<#if audio.getRightsHolder()?has_content>
											${audio.getRightsHolder()}
										<#else>
											Not provided
										</#if>	
									</li>
									<li><b>Description: </b>
										<#if audio.getDescription()?has_content>
											${audio.getDescription()}
										<#else>
											Not provided
										</#if>
									</li>
								</ui>
								<#if audio.getAgents()?has_content>
									<li><b>Agents:</b></li>
									<table style="border:1px solid black;border-collapse:collapse;">
										<tr>
											<th>Full name</th>
											<th>Data rating</th>
											<th>Role</th>
										</tr>
										<#list audio.getAgents() as agent>
											<tr>
												<td>${agent.getFullName()}</td>
												<td>${agent.getHomepage()}</td>
												<td>${agent.getRole()}</td>
											</tr>
										</#list>
									</table>
								</#if>
								</br>
							</#list><!-- End images list -->
						</#if>
						
						<!-- Texts related to the name -->
						<#assign texts = page.getTexts()>
						<#if texts?has_content>
							<h3>There are ${texts?size} published texts related to this name on EoL:</h3>
							<#list texts as text>
							<li>
								<h2>
									${text_index+1}.
										<#if text.getTitle()?has_content>
											${text.getTitle()}
										<#else>
											Not provided	
										</#if>
								</h2>
							</li>
							<ui>
								<li><b>Source:</b>
								<#assign source = text.getSource()> 
								<#if source?has_content>
									<a href="${source}" target="_blank">${source}</a>
								<#else>
									Not provided
								</#if>		
								</li>
								<li><b>Mime type:</b> 
									<#if text.getMimeType()?has_content>
										<a href="${text.getDataType()}" target = "_blank">${text.getMimeType()}</a>
									<#else>
										Not provided	
									</#if>
								</li>
								<li><b>Data rating:</b> ${text.getDataRating()}</li>
								<li><b>Subject:</b> 
									<#if text.getSubject()?has_content>
										<a href="${text.getSubject()}">${text.getSubject()}</a>
									<#else>
										Not provided
									</#if>		
								</li>
								<li><b>Language:</b>
									<#if text.getLanguage()?has_content>
										${text.getLanguage()}
									<#else>
										Not provided
									</#if>
								</li>
								<li><b>License:</b> ${text.getLicense()}</li>
								<li><b>Rights:</b> ${text.getRights()}</li>
								<li><b>Rights holder:</b> ${text.getRightsHolder()}</li>
								<li><b>Description: </b>
									<#if text.getDescription()?has_content>
										${text.getDescription()}
									<#else>
										Title not provided
									</#if>
								</li>		
							</ui>
							<#if text.getAgents()?has_content>
								<li><b>Agents:</b></li>
								<table style="border:1px solid black;border-collapse:collapse;">
									<tr>
										<th>Full name</th>
										<th>Data rating</th>
										<th>Role</th>
									</tr>
									<#list text.getAgents() as agent>
										<tr>
											<td>${agent.getFullName()}</td>
											<td>${agent.getHomepage()}</td>
											<td>${agent.getRole()}</td>
										</tr>
									</#list>
								</table>
							</#if>
							</br>
						</#list><!-- End images list -->
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
