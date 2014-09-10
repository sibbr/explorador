<div class="eol">
   <#assign species = "<i>${page.occModel.scientificname?if_exists}</i>"> 
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
         ${rc.getMessage("occpage.other.synonym.description")}:
      </li>
      <table class="sortable">
      	<thead>
			<tr>
	        	<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.other.synonym")}</th>
	        	<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.other.relationship")}</th>
	        </tr>
	     </thead>
	     <tbody>
	         <#list page.getSynonyms() as synonym>
	         <tr>
	            <td><i>${synonym.getSynonym()}</i></td>
	            <td>${synonym.getRelationship()}</td>
	         </tr>
	     </tbody>
         </#list>
      </table>
      </#if>
      <!-- Vernacular names for the name -->						
      <#if page.getVernacularNames()?has_content>
      <li> <b>${rc.getMessage("occpage.other.vernacular.names")}:</b> ${rc.getMessage("occpage.other.vernacular.description")}:</li>
      <table class="sortable">
		<thead>
	        <tr>
	        	<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.other.vernacular.names")}</th>
	            <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.other.language")}</th>
	        </tr>
	    </thead>
        <#list page.getVernacularNames() as name>
        <tbody>
	        <tr>
	        	<td>${name.getVernacularName()}</td>
	        	<td>${name.getLanguage()}</td>
	        </tr>
		</tbody>
        </#list>
      </table>
      </#if>
      <!-- Taxon concepts for the name -->
      <#if page.getTaxonConcepts()?has_content>
      <li><b>${rc.getMessage("occpage.other.taxon.concept")}:</b> ${rc.getMessage("occpage.other.taxon.concept.description")}:</li>
      <table class="sortable">
      	<thead>
			<tr>
				<th class="sorttable_alpha" scope="col" style="width:35%;">${rc.getMessage("occpage.other.scientific.name")}</th>
				<th class="sorttable_alpha" scope="col" style="width:20%;">${rc.getMessage("occpage.other.canonical.form")}</th>
				<th class="sorttable_alpha" scope="col" style="width:27%;">${rc.getMessage("occpage.other.according.to")}</th>
				<th class="sorttable_alpha" scope="col" style="width:18%;">${rc.getMessage("occpage.other.taxon.rank")}</th>
	         </tr>
		</thead>
        <#list page.getTaxonConcepts() as concept>
        <tbody>
	        <tr>
	        	<td><i>${concept.getScientificName()}</i></td>
	            <td><i>${concept.getCanonicalForm()}</i></td>
	            <td>${concept.getAccordingTo()}</td>
	            <td>${concept.getTaxonRank()}</td>
	        </tr>
	    </tbody>    
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
      <table>
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