<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<#include "inc/tip.ftl">
<head>
   <title>${rc.getMessage("occpage.title")}</title>
   <@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <link rel="stylesheet" href="http://gbif.sibbr.gov.br/style/leaflet.css" />
   <style>
      .boxcontent {margin: 0 0 20px;background: rgb(255,255,255);border-radius: 0px 5px 5px 5px;-webkit-box-shadow: rgb(240,240,240) 3px 0px 3px 2px;box-shadow: rgb(223,223,223) 3px 0px 3px 2px;border-right: 1px solid #ddd;border-left: 1px solid #ddd;border-top: none!important;}
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
            <li class="current"><a href="?view=interpreted">${rc.getMessage("occpage.header.button.normal")} <span class="question">${rc.getMessage("occpage.information.icon")}</span></a></li>
            <li><a href="?view=original">${rc.getMessage("occpage.header.button.dwc")} <span class="question2">${rc.getMessage("occpage.information.icon")}</span></a></li>
            <li><a href="?view=name">${rc.getMessage("occpage.other.information")}</a></li>
            <li><a href="?view=contact">${rc.getMessage("occpage.menu.datasetcontact")}</a></li>
         </ul>
         <div id="content_tab" class="boxcontent">
            <!-- NORMAL TAB-->
            <div id="interpreted" class="current">
               <!-- Taxa information -->
               <#if page.occModel.hastypestatus?? && page.occModel.hastypestatus>
               <h2>${rc.getMessage("occpage.group.typestatus")}</h2>
               <p>${page.occModel.typestatus!}</p>
               </#if>
               <h2>${rc.getMessage("occpage.group.classification")}</h2>
               <table class="occpage_group">
                  <tbody>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.kingdom")}</th>
                        <td><#if page.occModel.kingdom?has_content>${page.occModel.kingdom?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.phylum")}</th>
                        <td><#if page.occModel.phylum?has_content>${page.occModel.phylum?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ._class")}</th>
                        <td><#if page.occModel._class?has_content>${page.occModel._class?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ._order")}</th>
                        <td><#if page.occModel._order?has_content>${page.occModel._order?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.family")}</th>
                        <td><#if page.occModel.family?has_content>${page.occModel.family?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.genus")}</th>
                        <td><#if page.occModel.genus?has_content>${page.occModel.genus?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.scientificname")}</th>
                        <td><#if page.occModel.scientificname?has_content><i>${page.occModel.scientificname?if_exists}</i> <span class="remark">(${rc.getMessage("occpage.remark.interpretedfrom")}: ${page.occRawModel.scientificname?if_exists})</span><#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.scientificnameauthorship")}</th>
                        <td><#if page.occModel.scientificnameauthorship?has_content>${page.occModel.scientificnameauthorship?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                  </tbody>
               </table>
               
               <!-- Geographic information -->
               <h2>${rc.getMessage("occpage.group.location")}</h2>
               <table class="occpage_group">
                  <tbody>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.country")}</th>
                        <td><#if page.occModel.country?has_content>${page.occModel.country?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.stateprovince")}</th>
                        <td><#if page.occModel.stateprovince?has_content>${page.occModel.stateprovince?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <#if page.occModel.county?has_content>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.county")}</th>
                        <td>${page.occModel.county?if_exists}</td>
                     </tr>
                     </#if>	
                     <tr>
                        <th scope="row">${rc.getMessage("occ.municipality")}</th>
                        <td><#if page.occModel.municipality?has_content>${page.occModel.municipality?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.locality")}</th>
                        <td><#if page.occModel.locality?has_content>${page.occModel.locality?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                  </tbody>
                  
                  <!-- Only needs to check one coordinate to know other values will not be relevant: -->
                  <#if page.occModel.decimallatitude?has_content>
	                 <#assign latitude = page.occModel.decimallatitude?string?replace(",",".")>
					 <#assign longitude = page.occModel.decimallongitude?string?replace(",",".")>
	                 <tbody>
	                     <tr>
	                        <th scope="row">${rc.getMessage("occ.decimallatitude")}</th>
	                        <td>${safeNumber(page.occModel.decimallatitude!"","")}</td>
	                     </tr>
	                     <tr>
	                        <th scope="row">${rc.getMessage("occ.decimallongitude")}</th>
	                        <td>${safeNumber(page.occModel.decimallongitude!"","")}</td>
	                     </tr>
	                     <!-- If there is coordinateUncertaintyInMeters, draw map with the radius -->
	                     <#if page.occRawModel.coordinateuncertaintyinmeters?has_content>
		                     <tr>
		                        <th scope="row">${rc.getMessage("occ.coordinateuncertaintyinmeters")}</th>
		                        <td>${page.occRawModel.coordinateuncertaintyinmeters?if_exists}</td>
		                     </tr>
		                 </#if>
		             </tbody>
				     <#if page.occRawModel.coordinateuncertaintyinmeters?has_content>
			 	       <#assign uncertainty = page.occRawModel.coordinateuncertaintyinmeters?string?replace(",",".")>
				     <#else>
				 	   <#assign uncertainty = 0>
	                 </#if>

					  <!-- Leaflet map: -->
	                  <div id="map" style="width: 100%; height: 400px"></div>
	                   <script src="http://gbif.sibbr.gov.br/style/leaflet.js"></script>
					   <script>
							var map = L.map('map').setView([${latitude}, ${longitude}], 10);
							L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1Ijoic2liYnIiLCJhIjoiOTE2MTBjNDNmY2M0YWJhYTU0YjMzOTM0YzFjNzdkNGIifQ.cBomlrmbSqAkjlsg83mufw', {
								maxZoom: 18,
								id: 'sibbr.cieg1r2r302ikrvm8goa4nlgv'
							}).addTo(map);
							<!-- Add the point marker -->
						   	L.marker([${latitude}, ${longitude}]).addTo(map);
						   	<!-- Add point radius -->
						   	L.circle([${latitude}, ${longitude}], ${uncertainty}, {
								color: 'red',
								fillColor: '#f03',
								fillOpacity: 0.5
							}).addTo(map);
						</script>
                    </#if>
			     <tbody>
                     <#if page.occModel.minimumelevationinmeters?has_content>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.minimumelevationinmeters")}</th>
                        <td>${page.occModel.minimumelevationinmeters?if_exists}</td>
                     </tr>
                     </#if>
                     <#if page.occModel.maximumelevationinmeters?has_content>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.maximumelevationinmeters")}</th>
                        <td>${page.occModel.maximumelevationinmeters?if_exists}</td>
                     </tr>
                     </#if>	
                  </tbody>
                  <#if page.occModel.habitat?has_content>
                  <tboby>
                  <tr>
                     <th scope="row">${rc.getMessage("occ.habitat")}</th>
                     <td>${page.occModel.habitat?if_exists}</td>
                  </tr>
                  </tbody>
                  </#if>	
               </table>
               <!-- Date information -->
               <#if page.occModel.syear?has_content && page.occModel.smonth?has_content && page.occModel.sday?has_content>
               <h2>${rc.getMessage("occpage.group.date")}</h2>
               <table class="occpage_group">
                  <tbody>
                     <tr>
                        <th scope="row">${rc.getMessage("view.preview.daterange")}</th>
                        <td>${formatdate(page.occModel.syear!-1,page.occModel.smonth!-1,page.occModel.sday!-1)}</td>
                     </tr>
                  </tbody>
               </table>
               </#if>	
               <!-- Specimen information -->
               <h2>${rc.getMessage("occpage.group.specimen")}</h2>
               <table class="occpage_group">
                  <tbody>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.collectioncode")}</th>
                        <td><#if page.occModel.collectioncode?has_content>${page.occModel.collectioncode!}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.catalognumber")}</th>
                        <td><#if page.occModel.catalognumber?has_content>${page.occModel.catalognumber!}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.recordedby")}</th>
                        <td><#if page.occModel.recordedby?has_content>${page.occModel.recordedby!}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.recordnumber")}</th>
                        <td><#if page.occModel.recordnumber?has_content>${page.occModel.recordnumber!}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                  </tbody>
               </table>
               <#-- associatedSequences, optional section -->
               <#if page.occViewModel.associatedSequencesPerProviderMap?has_content>
               <h2>${rc.getMessage("occpage.group.associatedsequences")}</h2>
               <ul class="clear_fix">
					<#list page.occViewModel.associatedSequences as associatedSequence>
						<li><@hrefIfUrl text=associatedSequence /></li>
					</#list>
				</ul>
               </#if>
               <!-- Record information --> 
               <h2>${rc.getMessage("occpage.group.record")}</h2>
               <table class="occpage_group">
                  <tbody>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.dwcaid")}</th>
                        <td><#if page.occModel.dwcaid?has_content>${page.occModel.dwcaid?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.basisofrecord")}</th>
                        <td><#if page.occModel.basisofrecord?has_content>${page.occRawModel.basisofrecord?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.modified")}</th>
                        <td><#if page.occModel.modified?has_content>${page.occRawModel.modified?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                  </tbody>
               </table>
               <!-- Rights and citation -->
               <h2>${rc.getMessage("occpage.group.rights")}</h2>
               <table class="occpage_group">
                  <tbody>
                     <tr>
	                     <th scope="row">${rc.getMessage("occpage.other.data.citation")}</th>
	                     <td>
	                     	<#if page.occModel.getBibliographiccitation()?has_content>
	                     		${page.occModel.getBibliographiccitation()}
	                     	<#else>
	                     		${rc.getMessage("occ.not.provided.citation")}</br>
	                     		<#if page.information.getCitation()?has_content>
						    		${page.information.getCitation()!}
							    <#else>
									<#assign link = rc.getMessage("resourcepage.resource")>
							    	<div style=" border: 1px solid #a8a7a5; border-radius: 5px; background-color: #D9ECE0; padding: 10px; margin: auto; text-align: center">
								    	${page.information.getTitle()!}, ${page.information.getPublication_date()!}.</br>
								    	${rc.getMessage("resourcepage.accessedon")} <a href="${rc.getContextPath()}/${link}/${page.resource.getId()}" target="_blank"> ${domainName}${rc.getContextPath()}/${link}/${page.resource.getId()} </a>, ${rc.getMessage("resourcepage.on")} ${page.currentTime}.
								    </div>
							    </#if>
	                     	</#if>
	                     </td>
	                 </tr>
	                 <tr>
	                     <th scope="row">${rc.getMessage("occpage.other.data.rights")}</th>
	                     <td>
	                     	<#if page.occRawModel.getRights()?has_content>
	                     		${page.occRawModel.getRights()}
	                     	<#else>
	                     		${rc.getMessage("occ.not.provided.rights")}</br>
	                     		<#if page.information.getIntellectual_rights()?has_content>
						    		${page.information.getIntellectual_rights()!}
								<#else>
									${rc.getMessage("occ.not.provided")}
						    	</#if>
	                     	</#if>
	                     </td>
	                 </tr>
	                 <tr>
	                     <th scope="row">${rc.getMessage("occpage.other.data.accessrights")}</th>
	                     <td><#if page.occRawModel.getAccessrights()?has_content>${occRawModel.getAccessrights()}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
	                 </tr>
	              </tbody>
	           </table>
				
				<!--  Multimedia content -->
				<#if page.occViewModel.imageViewModelList?has_content>
					<h2>${rc.getMessage("occpage.group.images")}</h2>
					<div id="occpage_image">
						<ul class="clear_fix">
							<#list page.occViewModel.imageViewModelList as currMultimediaViewModel>
								<li>
									<div vocab="http://schema.org/" typeof="ImageObject">
										<img src="${currMultimediaViewModel.identifier!}" title="${currMultimediaViewModel.title!}" alt="${currMultimediaViewModel.title!}" property="contentUrl" class="images-gal"/>
										<@licenseDiv license=currMultimediaViewModel.license! licenseShortname=currMultimediaViewModel.licenseShortname! creator=currMultimediaViewModel.creator!/>
									</div>
								</li>
							</#list>
						</ul>
					</div>
				</#if>
				<#if page.occViewModel.otherMediaViewModelList?has_content>
					<h2>${rc.getMessage("occpage.group.multimedia")}</h2>
					<ul>
						<#list page.occViewModel.otherMediaViewModelList as currOm>
							<li>
								<a href="${currOm.references!}">${currOm.title!}</a>
								<@licenseDiv license=currOm.license! licenseShortname=currOm.licenseShortname! creator=currOm.creator!/>
							</li>
						</#list>
					</ul>
				</#if>
            </div>
            <!-- ORIGINAL TAB-->
            <div id="original"></div>
            <!-- NAME TAB -->
            <div id="name"></div>
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
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
   <@jsLibAsset libName="sorttable.js"/>
   <@jsAsset fileName="explorer" version=page.currentVersion! useMinified=page.useMinified/>
   <@jsAsset fileName="explorer.portal" version=page.currentVersion! useMinified=page.useMinified/>
   <!--  Script to remove the right button mouse options for images -->
   <script>
		document.oncontextmenu = function(e){
			var target = (typeof e !="undefined")? e.target: event.srcElement
			if (target.tagName == "IMG" || (target.tagName == 'A' && target.firstChild.tagName == 'IMG'))
				return false
		}
	</script>
</content>