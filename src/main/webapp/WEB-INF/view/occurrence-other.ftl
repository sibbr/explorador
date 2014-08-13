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
		<!-- Enciclopedia of Life -->
 		<h2>${rc.getMessage("occpage.other.enciclopedia.of.life")}</h2>		
		
		</br>
		<#if page.occEOL?has_content>
			<!-- Expected list with single item, for exact matches searches: -->
			<#list page.occEOL?if_exists as item>
				<ui>
					<li>
						<b>${rc.getMessage("occpage.other.confirmedname")}:</b> <a href="${item.getLink()}" target="_blank"><i> ${item.getTitle()}</i></a>
					</li>
					<!-- Pages: -->
					<#list item.getPages() as page>
						<!-- Richness score for the name -->
						<li> <b>${rc.getMessage("occpage.other.ritchness.score")}:</b> ${page.getRichnessScore()}</li>

						<!-- Synonyms for the name -->
						<#if page.getSynonyms()?has_content>
							<li> <b>${rc.getMessage("occpage.other.synonyms")}:</b> ${species}
							${rc.getMessage("occpage.other.synonym.description")}:</li>
							<table style="border:1px solid black;border-collapse:collapse;">
								<tr>
									<th></th>
									<th>${rc.getMessage("occpage.other.synonym")}</th>
									<th>${rc.getMessage("occpage.other.relationship")}</th>
								</tr>
								<#list page.getSynonyms() as synonym>
									<tr>
										<td>${synonym_index+1}.</td>
										<td><i>${synonym.getSynonym()}</i></td>
										<td>${synonym.getRelationship()}</td>
									</tr>
								</#list>
							</table>
						</#if>
	
						<!-- Vernacular names for the name -->						
						<#if page.getVernacularNames()?has_content>
							<li> <b>${rc.getMessage("occpage.other.vernacular.names")}:</b> ${rc.getMessage("occpage.other.vernacular.description")}:</li>
							<table style="border:1px solid black;border-collapse:collapse;">
								<tr>
									<th></th>
									<th>${rc.getMessage("occpage.other.vernacular.names")}</th>
									<th>${rc.getMessage("occpage.other.language")}</th>
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
							<li><b>${rc.getMessage("occpage.other.taxon.concept")}:</b> ${rc.getMessage("occpage.other.taxon.concept.description")}:</li>
							<table style="border:1px solid black;">
								<tr>
									<th></th>
									<th>${rc.getMessage("occpage.other.scientific.name")}</th>
									<th>${rc.getMessage("occpage.other.canonical.form")}</th>
									<th>${rc.getMessage("occpage.other.according.to")}</th>
									<th>${rc.getMessage("occpage.other.taxon.rank")}</th>
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
							<h3>${rc.getMessage("occpage.other.image.count", [images?size])} :</h3>
							<#list images as image>
							<li>
								<h2>
									${image_index+1}.
										<#if image.getTitle()?has_content>
											${image.getTitle()}
										<#else>
											${rc.getMessage("occpage.other.object.title.not.provided")}
										</#if>
								</h2>
							</li>
								<ui>
									<a href="${image.getMediaURL()}" target="_blank">
										<img src="${image.getEolThumbnail()}" alt="${image.getTitle()}">
									</a>
									</br><a href="${image.getSource()}" target="_blank">${rc.getMessage("occpage.other.data.image.source")}</a>
									<li><b>${rc.getMessage("occpage.other.data.mime.type")}:</b> <a href="${image.getDataType()}" target = "_blank">${image.getMimeType()}</a></li>
									<li><b>${rc.getMessage("occpage.other.data.rating")}:</b> ${image.getDataRating()}</li>
									<li><b>${rc.getMessage("occpage.other.data.license")}:</b>
										<#if image.getLicense()?has_content>
											${image.getLicense()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>
									</li>
									<li><b>${rc.getMessage("occpage.other.data.rights")}:</b>
										<#if image.getRights()?has_content>
											${image.getRights()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}	
										</#if>
									</li>	
									<li><b>${rc.getMessage("occpage.other.data.rights.holder")}:</b>
										<#if image.getRightsHolder()?has_content>
											${image.getRightsHolder()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>	
									</li>
									<li><b>${rc.getMessage("occpage.other.data.description")}:</b>
										<#if image.getDescription()?has_content>
											${image.getDescription()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>
									</li>
								</ui>
								<#if image.getAgents()?has_content>
									<li><b>${rc.getMessage("occpage.other.agents")}:</b></li>
									<table style="border:1px solid black;border-collapse:collapse;">
										<tr>
											<th>${rc.getMessage("occpage.other.agents.full.name")}</th>
											<th>${rc.getMessage("occpage.other.data.rating")}</th>
											<th>${rc.getMessage("occpage.other.agents.role")}</th>
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
							<h3> ${rc.getMessage("occpage.other.image.count", [audioFiles?size])}:</h3>
							<#list audioFiles as audio>
							<li>
								<h2>
									${audio_index+1}.
										<#if audio.getTitle()?has_content>
											${audio.getTitle()}
										<#else>
											${rc.getMessage("occpage.other.object.title.not.provided")}
										</#if>
								</h2>
							</li>
								<ui>
									<audio controls>
										<source src="${audio.getMediaURL()}" type="${audio.getMimeType()}">
										${rc.getMessage("occpage.other.audio.no.support")}
									</audio>	
									<li>
										</b>${rc.getMessage("occpage.other.data.source")}: </b>
										<a href="${audio.getSource()}" target="_blank">${audio.getSource()}</a>
									</li>	
									<li><b>${rc.getMessage("occpage.other.data.mime.type")}: </b> <a href="${audio.getDataType()}" target = "_blank">${audio.getMimeType()}</a></li>
									<li><b>${rc.getMessage("occpage.other.data.license")}: </b>
										<#if audio.getLicense()?has_content>
											${audio.getLicense()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>
									</li>
									<li><b>${rc.getMessage("occpage.other.data.rights")}: </b> 
										<#if audio.getRights()?has_content>
											${audio.getRights()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>
									</li>	
									<li><b>${rc.getMessage("occpage.other.data.rights.holder")}: </b>
										<#if audio.getRightsHolder()?has_content>
											${audio.getRightsHolder()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>	
									</li>
									<li><b>${rc.getMessage("occpage.other.data.description")}: </b>
										<#if audio.getDescription()?has_content>
											${audio.getDescription()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>
									</li>
								</ui>
								<#if audio.getAgents()?has_content>
									<li><b>${rc.getMessage("occpage.other.agents")}:</b></li>
									<table style="border:1px solid black;border-collapse:collapse;">
										<tr>
											<th>${rc.getMessage("occpage.other.agents.full.name")}</th>
											<th>${rc.getMessage("occpage.other.data.rating")}</th>
											<th>${rc.getMessage("occpage.other.agents.role")}</th>
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
							<h3>${rc.getMessage("occpage.other.image.count", [texts?size])}:</h3>
							<#list texts as text>
							<li>
								<h2>
									${text_index+1}.
										<#if text.getTitle()?has_content>
											${text.getTitle()}
										<#else>
											${rc.getMessage("occpage.other.object.title.not.provided")}
										</#if>
								</h2>
							</li>
							<ui>
								<li><b>${rc.getMessage("occpage.other.data.source")}:</b>
								<#assign source = text.getSource()> 
								<#if source?has_content>
									<a href="${source}" target="_blank">${source}</a>
								<#else>
									${rc.getMessage("occpage.other.data.not.provided")}
								</#if>		
								</li>
								<li><b>${rc.getMessage("occpage.other.data.mime.type")}:</b> 
									<#if text.getMimeType()?has_content>
										<a href="${text.getDataType()}" target = "_blank">${text.getMimeType()}</a>
									<#else>
										${rc.getMessage("occpage.other.data.not.provided")}
									</#if>
								</li>
								<li><b>${rc.getMessage("occpage.other.data.rating")}:</b> ${text.getDataRating()}</li>
								<li><b>${rc.getMessage("occpage.other.text.subject")}:</b>
									<#if text.getSubject()?has_content>
										<a href="${text.getSubject()}">${text.getSubject()}</a>
									<#else>
										${rc.getMessage("occpage.other.data.not.provided")}
									</#if>
								</li>
								<li><b>${rc.getMessage("occpage.other.language")}:</b>
									<#if text.getLanguage()?has_content>
										${text.getLanguage()}
									<#else>
										${rc.getMessage("occpage.other.data.not.provided")}
									</#if>
								</li>
								<li><b>${rc.getMessage("occpage.other.data.license")}: </b>
										<#if text.getLicense()?has_content>
											${text.getLicense()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>
									</li>
									<li><b>${rc.getMessage("occpage.other.data.rights")}: </b> 
										<#if text.getRights()?has_content>
											${text.getRights()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>
									</li>	
									<li><b>${rc.getMessage("occpage.other.data.rights.holder")}: </b>
										<#if text.getRightsHolder()?has_content>
											${text.getRightsHolder()}
										<#else>
											${rc.getMessage("occpage.other.data.not.provided")}
										</#if>	
									</li>
								<li><b>${rc.getMessage("occpage.other.data.description")}: </b>
									<#if text.getDescription()?has_content>
										${text.getDescription()}
									<#else>
										${rc.getMessage("occpage.other.object.title.not.provided")}
									</#if>
								</li>		
							</ui>
							<#if text.getAgents()?has_content>
								<li><b>${rc.getMessage("occpage.other.agents")}:</b></li>
								<table style="border:1px solid black;border-collapse:collapse;">
									<tr>
										<th>${rc.getMessage("occpage.other.agents.full.name")}</th>
										<th>${rc.getMessage("occpage.other.data.rating")}</th>
										<th>${rc.getMessage("occpage.other.agents.role")}</th>
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
