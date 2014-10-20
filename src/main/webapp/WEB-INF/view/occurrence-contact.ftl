<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<#include "inc/tip.ftl">
<head>
   <title>${rc.getMessage("occpage.title.contact")}</title>
   <@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <style>
      .boxcontent {margin: 0 0 20px;background: rgb(255,255,255);border-radius: 0px 5px 5px 5px;-webkit-box-shadow: rgb(240,240,240) 3px 0px 3px 2px;box-shadow: rgb(223,223,223) 3px 0px 3px 2px;border-right: 1px solid #ddd;border-left: 1px solid #ddd;}
      .round {background-color: #fff!important;border: none!important;}
   </style>
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
            <li><a href="?view=name">${rc.getMessage("occpage.other.information")}</a></li>
            <li class="current"><a href="?view=contact">${rc.getMessage("occpage.menu.datasetcontact")}</a></li>
         </ul>
         <div id="content_tab" class="boxcontent">
            <!-- NORMAL TAB-->
            <div id="interpreted"></div>
            <!-- DWC TAB-->
            <div id="original"></div>
            <!-- NAME TAB -->
            <div id="name"></div>
	        <!-- CONTACT TAB -->    
            <div id="contact" class="current">
	            <#include "inc/resource-contact.ftl">             
	        </div>
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