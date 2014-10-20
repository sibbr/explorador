<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<head>
   <title>${rc.getMessage("occpage.title")}</title>
   <@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <style>
      .boxcontent {margin: 0 0 20px;background: rgb(255,255,255);border-radius: 0px 5px 5px 5px;-webkit-box-shadow: rgb(240,240,240) 3px 0px 3px 2px;box-shadow: rgb(223,223,223) 3px 0px 3px 2px;border-right: 1px solid #ddd;border-left: 1px solid #ddd;}
      .round {background-color: #fff!important;border: none!important;}
   </style>
   <!-- INFO TAB AND JS SHOW HIDE CONTENT-->  
   <@jsAsset fileName="occurrence" version=page.currentVersion! useMinified=page.useMinified/>
</head>
<a id="main-content"></a>
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
                  <li><a href="?view=bhl">${rc.getMessage("occpage.other.biodiversity.heritage.library")}</a></li>
                  <li><a href="?view=eol">${rc.getMessage("occpage.other.enciclopedia.of.life")}</a></li>
               </ul>
               <div>
				   <#assign species = "<i>${page.occModel.scientificname?if_exists}</i>"> 
				   <!-- Biodiversity Heritage Library -->
				   <h2>${rc.getMessage("occpage.other.biodiversity.heritage.library")}</h2>
				   <ul>
				      <#if page.occBHL?has_content>
				      <a href="http://www.biodiversitylibrary.org/name/${page.occModel.scientificname?if_exists}" target="_blank">
				      <i>${rc.getMessage("occpage.other.search.bhl")}</i>					
				      </a>
				      <h3>${rc.getMessage("occpage.bhl.format")}: </h3>
				      n.
				      <a href="#" style="color: #36b"><i>${rc.getMessage("occpage.bhl.format.publication.title")}</i></a> 
				      ${rc.getMessage("occpage.bhl.format.publication.location")} 
				      ${rc.getMessage("occpage.bhl.format.publication.publisher")},
				      ${rc.getMessage("occpage.bhl.format.publication.date")}
				      <#list page.occBHL?if_exists as item>
				      <#if (item.getBhlPages()?size > 0)>
				      <li>
				         <h3>${rc.getMessage("occpage.other.confirmedname")}: <i>${item.getNameConfirmed()}</i></h3>
				      </li>
				      <#list item.getBhlPages() as page>
				      ${page_index + 1}.
				      <a href="http://www.biodiversitylibrary.org/page/${page.getPageId()}" target="_blank" style="color: #36b">
				      <i>${page.getShortTitle()}</i>
				      </a>
				      <#if page.getPublisherPlace()?? && page.getPublisherPlace()?has_content>
				      ${page.getPublisherPlace()}
				      </#if>
				      <#if page.getPublisherName()?has_content>
				      ${page.getPublisherName()}
				      <#else>
				      <span class="remark">(${rc.getMessage("occpage.bhl.publisher.name.not.provided")})</span>
				      </#if>	
				      <#if page.getPublicationDate()?? && page.getPublicationDate()?has_content>
				      ${page.getPublicationDate()}
				      <#else>
				      <span class="remark">(${rc.getMessage("occpage.bhl.publication.date.not.provided")})</span>	
				      </#if>
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
				   <#assign coordinateuncertaintyinmeters=0>
				   <#if page.occRawModel.coordinateuncertaintyinmeters?? && (page.occRawModel.coordinateuncertaintyinmeters?length>0)>
				   		<#assign coordinateuncertaintyinmeters=page.occRawModel.coordinateuncertaintyinmeters?number>
				   </#if>
				</div>
            </div>
	        <!-- CONTACT TAB -->    
            <div id="contact"></div>
         </div>
      </div>
      <!-- END TAB content_tab -->	
   </div>
   <#-- content -->
</div>
<#-- body -->
<#assign coordinateuncertaintyinmeters=0>
<#if page.occRawModel.coordinateuncertaintyinmeters?? && (page.occRawModel.coordinateuncertaintyinmeters?length>0)>
<#assign coordinateuncertaintyinmeters=page.occRawModel.coordinateuncertaintyinmeters?number>
</#if>
<#-- JavaScript handling -->
<content tag="local_script">
   <script src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
   <@jsLibAsset libName="sorttable.js"/>
   <@jsAsset fileName="explorer" version=page.currentVersion! useMinified=page.useMinified/>
   <@jsAsset fileName="explorer.portal" version=page.currentVersion! useMinified=page.useMinified/>
   <script>
      $(function() {
        EXPLORER.details.setupSingleOccurrenceMap('occpage_map',${safeNumber(page.occModel.decimallatitude!"","undefined")},${safeNumber(page.occModel.decimallongitude!"","undefined")},${coordinateuncertaintyinmeters?c});
      });
   </script>
</content>