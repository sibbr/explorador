<link rel="stylesheet" href="/explorador/assets/styles/occportal.css" media="screen,print"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<style>
.boxcontent {
	margin: 0 0 20px;
	background: rgb(255,255,255);
	border-radius: 0px 5px 5px 5px;
	-webkit-box-shadow: rgb(240,240,240) 3px 0px 3px 2px;
	box-shadow: rgb(223,223,223) 3px 0px 3px 2px;
	border-right: 1px solid #ddd;
	border-left: 1px solid #ddd;
	border-top: none!important;
}
.round {
	background-color: #fff!important;
	border: none!important;
}
</style>
</head><a id="main-content"></a>
<div id="body">
  <div id="content" class="clear_fix">
    <h1><i>${page.occModel.scientificname?if_exists}</i> (${page.occModel.collectioncode?if_exists} ${page.occModel.catalognumber?if_exists})</h1>
    <p class="details">${rc.getMessage("occpage.header.details")} <a href="${rc.getContextPath()}/${rc.getMessage("resourcepage.resource")}/${page.resource.getId()}" target="_self">${page.information.getTitle()?if_exists}</a></p>
    <!-- CONTENT TAB -->
    <div id="tabwrap">
      <ul id="tabs">
        <li><a href="?view=interpreted">${rc.getMessage("occpage.header.button.normal")} <span class="question">${rc.getMessage("occpage.information.icon")}</span></a></li>
        <li><a href="?view=original">${rc.getMessage("occpage.header.button.dwc")} <span class="question2">${rc.getMessage("occpage.information.icon")}</span></a></li>
        <li class="current"><a href="?view=name">${rc.getMessage("occpage.other.information")}</a></li>
        <li><a href="?view=contact">${rc.getMessage("occpage.menu.datasetcontact")}</a></li>
      </ul>
      <div id="content_tab" class="boxcontent"> 
        <!-- NORMAL TAB-->
        <div id="interpreted"></div>
        <!-- DWC TAB-->
        <div id="original"></div>
        <!-- NAME TAB -->
        <div id="name" class="current">
          <ul>
            <li><a href="?view=nvv" id="nvvlink">${rc.getMessage("occpage.other.namecheck")}</a></li>
            <li><a href="?view=bhl" id="bhllink">${rc.getMessage("occpage.other.biodiversity.heritage.library")}</a></li>
            <li><a href="?view=eol" id="eollink">${rc.getMessage("occpage.other.enciclopedia.of.life")}</a></li>
          </ul>
          <div id="eolcontent">
		  <#assign species = "<i>${page.occModel.scientificname?if_exists}</i>"> 
            <!-- Enciclopedia of Life -->
            <h2>${rc.getMessage("occpage.other.enciclopedia.of.life")}</h2>
            </br>

            <#if page.occEOL?has_content> 
            <!-- Expected list with single item, for exact matches searches: --> 
            <#list page.occEOL?if_exists as item>
            <ui>
              <li> <b>${rc.getMessage("occpage.other.confirmedname")}:</b> <a href="${item.getLink()}" target="_blank"><i> ${item.getTitle()}</i></a> </li>
              <!-- Pages: --> 
              <#list item.getPages() as page> 
              <!-- Richness score for the name -->
              <li> <b>${rc.getMessage("occpage.other.ritchness.score")}:</b> ${page.getRichnessScore()}</li>
              <!-- Synonyms for the name --> 
              <#if page.getSynonyms()?has_content>
              <li> <b>${rc.getMessage("occpage.other.synonyms")}:</b> ${species}
                ${rc.getMessage("occpage.other.synonym.description")}: </li>
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
                </#list>
                  </tbody>
                
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
                <tbody>
                <#list page.getVernacularNames() as name>
                <tr>
                  <td>${name.getVernacularName()}</td>
                  <td>${name.getLanguage()}</td>
                </tr>
                </#list>
                  </tbody>
                
              </table>
              </#if> 
              <!-- Taxon concepts for the name --> 
              <#if page.getTaxonConcepts()?has_content>
              <li><b>${rc.getMessage("occpage.other.taxon.concept")}:</b> ${rc.getMessage("occpage.other.taxon.concept.description")}:</li>
              <table class="sortable">
                <thead>
                  <tr>
                    <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.other.scientific.name")}</th>
                    <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.other.canonical.form")}</th>
                    <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.other.according.to")}</th>
                    <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.other.taxon.rank")}</th>
                  </tr>
                </thead>
                <tbody>
                <#list page.getTaxonConcepts() as concept>
                <tr>
                  <td><i>${concept.getScientificName()}</i></td>
                  <td><i>${concept.getCanonicalForm()}</i></td>
                  <td>${concept.getAccordingTo()}</td>
                  <td>${concept.getTaxonRank()}</td>
                </tr>
                </#list>
                  </tbody>
                
              </table>
              </#if> 
              <!-- Images related to the name --> 
              <#assign images = page.getImages()>
              <#if images?has_content>
              <h3>${rc.getMessage("occpage.other.image.count", [images?size])} :</h3>
              <#list images as image>
              <li>
                <h2> ${image_index+1}.
                  <#if image.getTitle()?has_content>
                  ${image.getTitle()}
                  <#else>
                  ${rc.getMessage("occpage.other.object.title.not.provided")}
                  </#if> </h2>
              </li>
              <ui> <a href="${image.getMediaURL()}" target="_blank"> <img src="${image.getEolThumbnail()}" alt="${image.getTitle()}"> </a> </br>
                <a href="${image.getSource()}" target="_blank">${rc.getMessage("occpage.other.data.image.source")}</a>
                <li><b>${rc.getMessage("occpage.other.data.mime.type")}:</b> <a href="${image.getDataType()}" target = "_blank">${image.getMimeType()}</a></li>
                <li><b>${rc.getMessage("occpage.other.data.rating")}:</b> ${image.getDataRating()}</li>
                <li><b>${rc.getMessage("occpage.other.data.license")}:</b> <#if image.getLicense()?has_content>
                  ${image.getLicense()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.rights")}:</b> <#if image.getRights()?has_content>
                  ${image.getRights()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}	
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.rights.holder")}:</b> <#if image.getRightsHolder()?has_content>
                  ${image.getRightsHolder()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.description")}:</b> <#if image.getDescription()?has_content>
                  ${image.getDescription()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
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
              </#if> </br>
              </#list><!-- End images list --> 
              </#if> 
              <!-- Audio related to the name --> 
              <#assign audioFiles = page.getAudio()>
              <#if audioFiles?has_content>
              <h3> ${rc.getMessage("occpage.other.audio.count", [audioFiles?size])}:</h3>
              <#list audioFiles as audio>
              <li>
                <h2> ${audio_index+1}.
                  <#if audio.getTitle()?has_content>
                  ${audio.getTitle()}
                  <#else>
                  ${rc.getMessage("occpage.other.object.title.not.provided")}
                  </#if> </h2>
              </li>
              <ui>
                <audio controls>
                  <source src="${audio.getMediaURL()}" type="${audio.getMimeType()}">
                  ${rc.getMessage("occpage.other.audio.no.support")} </audio>
                <li> </b>${rc.getMessage("occpage.other.data.source")}: </b> <a href="${audio.getSource()}" target="_blank">${audio.getSource()}</a> </li>
                <li><b>${rc.getMessage("occpage.other.data.mime.type")}: </b> <a href="${audio.getDataType()}" target = "_blank">${audio.getMimeType()}</a></li>
                <li><b>${rc.getMessage("occpage.other.data.license")}: </b> <#if audio.getLicense()?has_content>
                  ${audio.getLicense()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.rights")}: </b> <#if audio.getRights()?has_content>
                  ${audio.getRights()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.rights.holder")}: </b> <#if audio.getRightsHolder()?has_content>
                  ${audio.getRightsHolder()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.description")}: </b> <#if audio.getDescription()?has_content>
                  ${audio.getDescription()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
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
              </#if> </br>
              </#list><!-- End images list --> 
              </#if> 
              <!-- Texts related to the name --> 
              <#assign texts = page.getTexts()>
              <#if texts?has_content>
              <h3>${rc.getMessage("occpage.other.text.count", [texts?size])}:</h3>
              <#list texts as text>
              <li>
                <h2> ${text_index+1}.
                  <#if text.getTitle()?has_content>
                  ${text.getTitle()}
                  <#else>
                  ${rc.getMessage("occpage.other.object.title.not.provided")}
                  </#if> </h2>
              </li>
              <ui>
                <li><b>${rc.getMessage("occpage.other.data.source")}:</b> <#assign source = text.getSource()> 
                  <#if source?has_content> <a href="${source}" target="_blank">${source}</a> <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.mime.type")}:</b> <#if text.getMimeType()?has_content> <a href="${text.getDataType()}" target = "_blank">${text.getMimeType()}</a> <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.rating")}:</b> ${text.getDataRating()}</li>
                <li><b>${rc.getMessage("occpage.other.text.subject")}:</b> <#if text.getSubject()?has_content> <a href="${text.getSubject()}">${text.getSubject()}</a> <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.language")}:</b> <#if text.getLanguage()?has_content>
                  ${text.getLanguage()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.license")}: </b> <#if text.getLicense()?has_content>
                  ${text.getLicense()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.rights")}: </b> <#if text.getRights()?has_content>
                  ${text.getRights()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.rights.holder")}: </b> <#if text.getRightsHolder()?has_content>
                  ${text.getRightsHolder()}
                  <#else>
                  ${rc.getMessage("occpage.other.data.not.provided")}
                  </#if> </li>
                <li><b>${rc.getMessage("occpage.other.data.description")}: </b> <#if text.getDescription()?has_content>
                  ${text.getDescription()}
                  <#else>
                  ${rc.getMessage("occpage.other.object.title.not.provided")}
                  </#if> </li>
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
              </#if> </br>
              </#list><!-- End images list --> 
              </#if>	
              </#list><!-- End pages list --> 
            </ui>
            </#list><!-- End items list --> 
            <#else>
            <ul>
              <li> ${rc.getMessage("occpage.other.eol.taxon.not.found")}</li>
            </ul>
            </#if> </div>
        </div>
        <!-- CONTACT TAB -->
        <div id="contact"></div>
      </div>
    </div>
    <!-- END TAB content_tab --> 
  </div>
  <#-- content --> </div>
<script type='text/javascript' src='/explorador/assets/js/lib/sorttable.js'>