<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<head>
   <title>${rc.getMessage("page.search.title")}</title>
   <@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
   <style type="text/css">
      #content {
      margin-right: 0!important;
      }
      .boxcontent {
      margin: 0 0 20px;
      background: rgb(255,255,255);
      border-radius: 0px 5px 5px 5px;
      -webkit-box-shadow: rgb(240,240,240) 3px 0px 3px 2px;
      box-shadow: rgb(223,223,223) 3px 0px 3px 2px;
      border-right: 1px solid #ddd;
      border-left: 1px solid #ddd;
      }
	  .round {
	  background-color: #fff!important;
	  border: none!important;
	  }
      #wrap { width: 75%; margin: 0 auto; min-width: 300px; max-width: 800px; }
      #tabwrap {
      overflow: hidden;
      width: 100%;
      min-height: 300px;
      /* border: 1px solid #ddd; */
      }
      #tabs { overflow: hidden;padding-left: 0px; }
      #tabs li { list-style: none; }
      #tabs li a {
      float: left;
      display: block;
      padding: 7px;
      color: #6d6d6d;
      width: auto;
      text-decoration: none;
      text-align: center;
      font-size: 15px;
      border-radius: 6px 6px 0 0;
      background: #ccc;
      border-right: 1px solid #ddd;
      border-left: 1px solid #ddd;
      border-top: 1px solid #ddd;
      margin-right: 11px;
      }
      #tabs li a:hover {
      background: #FFF;
      color: #666;
      }
      #tabs li.current a {
      background: #fff;
      color: #666;
      border-radius: 6px 6px 0 0;
      }
      #content_tab > div {
      clear: both;
      padding: 20px;
      line-height: 19px;
      color: #666;
      display: none;
      }
      #content_tab .current { display: block; }
      #content_tab #informacao.first { display: block; }
      #content_tab p { margin: 0 0 20px 0;}
      /* TOOLTIP*/
      span.question, span.question2{
      cursor: pointer;
      display: inline-block;
      width: 16px;
      height: 16px;
      background-color: #A3A3A3;
      line-height: 16px;
      color: White;
      font-size: 13px;
      border-radius: 8px;
      text-align: center;
      position: relative;
      }
      span.question:hover, span.question2:hover{ background-color: #3D6199; }
      div.tooltip, div.tooltip2 {
      background-color: #3D6199;
      color: White;
      position: absolute;
      left: 25px;
      top: -10px;
      width: 310px;
      border-radius: 5px;
      padding:2px;
      overflow: visible;
      z-index:9999;
      }
      div.tooltip:before, div.tooltip2:before{
      border-color: transparent #3D6199 transparent transparent;
      border-right: 6px solid #3D6199;
      border-style: solid;
      border-width: 6px 6px 6px 0px;
      content: "";
      display: block;
      height: 0;
      width: 0;
      line-height: 0;
      position: absolute;
      top: 40%;
      left: -6px;
      }
      div.tooltip p, div.tooltip2 p {
      margin: 10px;
      color: White;
      }
   </style>
   <script>
      $(function(){
      	$('#tabs li a').click(function(e){
      
      		$('#tabs li, #content_tab .current').removeClass('current').removeClass('fadeInLeft');
      		$(this).parent().addClass('current');
      		var currentTab = $(this).attr('href');
      		$(currentTab).addClass('current fadeInLeft');
      		e.preventDefault();
      	});
      });
      
      $(document).ready(function () {
        $("span.question").hover(function () {
          $(this).append('<div class="tooltip">${rc.getMessage("occpage.heather.desc.normal")}</div>');
        }, function () {
          $("div.tooltip").remove();
        });
      });
      
      $(document).ready(function () {
        $("span.question2").hover(function () {
          $(this).append('<div class="tooltip2">${rc.getMessage("occpage.heather.desc.dwc")}</div>');
        }, function () {
          $("div.tooltip2").remove();
        });
      });
   </script>
   <script>
      $(document).ready(function(){
       
          $(".bhl").hide();
      	$(".bhl_hide").show();
       
          $('.bhl_hide').click(function(){
          $(".bhl").slideToggle();
      $(".eol").hide();
      $(".colif").hide();
          });
      	
      	$(".eol").hide();
      	$(".eol_hide").show();
       
          $('.eol_hide').click(function(){
          $(".eol").slideToggle();
      $(".bhl").hide();
      $(".colif").hide();
          });
      	
      	$(".colif").hide();
      	$(".colif_hide").show();
       
          $('.colif_hide').click(function(){
          $(".colif").slideToggle();
          $(".bhl").hide();
      $(".eol").hide();
          });
       
      });
   </script>
</head>
<a id="main-content"></a>
<div id="body">
   <div id="content" class="clear_fix">
      <h1><i>${page.occModel.scientificname?if_exists}</i> (${page.occModel.collectioncode?if_exists} ${page.occModel.catalognumber?if_exists})</h1>
      <p class="details">${rc.getMessage("occpage.header.details")}: ${page.occModel.sourcefileid?if_exists}/${page.occModel.dwcaid?if_exists}</p>
      <!-- TAB content_tab -->
      <div id="tabwrap">
         <ul id="tabs">
            <li class="current"><a href="#normal">${rc.getMessage("occpage.header.button.normal")} <span class="question">!</span></a></li>
            <li><a href="#dwc">${rc.getMessage("occpage.header.button.dwc")} <span class="question2">!</span></a></li>
            <li><a href="#name">${rc.getMessage("occpage.other.information")}</a></li>
            <li><a href="#contact">${rc.getMessage("occpage.menu.datasetcontact")}</a></li>
         </ul>
         <div id="content_tab" class="boxcontent">
            <!-- NORMAL TAB-->            
            <div id="normal" class="current">
               <!-- Taxa information -->
               <h3><i>${rc.getMessage("occpage.heather.desc.normal")}</i></h3>
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
                  <tbody>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.decimallatitude")}</th>
                        <td>${safeNumber(page.occModel.decimallatitude!"","")}</td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.decimallongitude")}</th>
                        <td>${safeNumber(page.occModel.decimallongitude!"","")}</td>
                     </tr>
                     <#if page.occRawModel.coordinateuncertaintyinmeters?has_content>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.coordinateuncertaintyinmeters")}</th>
                        <td>${page.occRawModel.coordinateuncertaintyinmeters?if_exists}</td>
                     </tr>
                     </#if>
                  </tbody>
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
               <!--   content-->
			   
               <div id="occpage_map" class="round">
                  <#-- Map injected, will remove span element -->
                  <span>
                     <table class="occpage_group">
                        <tbody>
                           <tr>
                              <th scope="row">${rc.getMessage("filter.hascoordinates")}</th>
                              <td>${rc.getMessage("occpage.nogeo")}</td>
                           </tr>
                        </tbody>
                     </table>
                  </span>
               </div>
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
               <table class="occpage_group">
                  <tbody>
                     <#list page.occViewModel.associatedSequencesPerProviderMap?keys as sequenceProvider>
                     <#list page.occViewModel.associatedSequencesPerProviderMap[sequenceProvider] as associatedSequence>
                     <tr>
                        <#-- dont repeat header text -->
                        <th scope="row"><#if associatedSequence_index == 0>${sequenceProvider}</#if></th>
                        <td><@hrefIfNotEmpty text=associatedSequence.getLeft() link=associatedSequence.getRight()/></td>
                     </tr>
                     </#list>
                     </#list>
                  </tbody>
               </table>
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
               <!-- Dataset information -->
               <h2>${rc.getMessage("occpage.group.dataset")}</h2>
               <table class="occpage_group">
                  <tbody>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.institutioncode")}</th>
                        <td><#if page.occModel.institutioncode?has_content>${page.occModel.institutioncode?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.datasetname")}</th>
                        <td><#if page.occModel.datasetname?has_content>${page.occModel.datasetname!}<#elseif page.occViewModel.dataSourceName?has_content>${page.occViewModel.dataSourceName}<span class="remark">(${rc.getMessage("occpage.remark.interpretedfrom.dataset.metadata")})</span><#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occ.rights")}</th>
                        <td><#if page.occModel.rights?has_content>${page.occRawModel.rights?if_exists}<#else>${rc.getMessage("occ.not.provided")}</#if></td>
                     </tr>
                     <tr>
                        <th scope="row">${rc.getMessage("occpage.sourcefile")}</th>
                        <td>
                           <#if page.occViewModel.dataSourcePageURL?has_content>
                           <@hrefIfNotEmpty text=page.occModel.sourcefileid! link=page.occViewModel.dataSourcePageURL!/>
                           <#else>${rc.getMessage("occ.not.provided")}
                           </#if>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <!-- Image content-->
               <#if page.occViewModel.imageList?has_content>
               <div id="occpage_image">
                  <#list page.occViewModel.imageList as currImg>
                  <a class="round" href="${currImg}"><span><img src="${currImg}" alt="<i>${page.occModel.scientificname?if_exists}</i> (${page.occModel.collectioncode?if_exists} ${page.occModel.catalognumber?if_exists})"/></span></a>
                  </#list>
               </div>
               </#if>
               <!-- Media content-->
               <#if page.occViewModel.otherMediaList?has_content>
               <div id="occpage_media">
                  <#assign mediaNumber = 1>
                  <#list page.occViewModel.otherMediaList as currOm>
                  <p><a class="round big_button" href="${currOm}" target="_blank">${rc.getMessage("occpage.menu.associatedmedia")} ${mediaNumber}</a></p>
                  <#assign mediaNumber = mediaNumber + 1>
                  </#list>
               </div>
               </#if>
            </div>
            <!-- END NORMAL TAB-->
            <!-- DWC TAB-->            
            <div id="dwc">
               <h3><i>${rc.getMessage("occpage.heather.desc.dwc")}</i></h3>
               <p>  	<a id="dwc_table_toggle" href="#">${rc.getMessage("occpage.header.toggle.unused")}</a></p>
               <table id="dwc_table" class="sortable">
                  <thead>
                     <tr>
                        <th class="sorttable_numeric" scope="col">${rc.getMessage("occpage.dwctable.order")}</th>
                        <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.dwctable.category")}</th>
                        <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.dwctable.term")}</th>
                        <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.dwctable.raw")}</th>
                        <th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.dwctable.interpreted")}</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>1</td>
                        <td>root</td>
                        <td><a href="http://purl.org/dc/terms/type">type</a></td>
                        <td>${page.occRawModel.type?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>2</td>
                        <td>root</td>
                        <td><a href="http://purl.org/dc/terms/modified">modified</a></td>
                        <td> ${page.occRawModel.modified?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>3</td>
                        <td>root</td>
                        <td><a href="http://purl.org/dc/terms/language">language</a></td>
                        <td>${page.occRawModel.language?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>4</td>
                        <td>root</td>
                        <td><a href="http://purl.org/dc/terms/rights">rights</a></td>
                        <td>${page.occRawModel.rights?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>5</td>
                        <td>root</td>
                        <td><a href="http://purl.org/dc/terms/rightsHolder">rightsHolder</a></td>
                        <td>${page.occRawModel.rightsholder?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>6</td>
                        <td>root</td>
                        <td><a href="http://purl.org/dc/terms/accessRights">accessRights</a></td>
                        <td>${page.occRawModel.accessrights?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>7</td>
                        <td>root</td>
                        <td><a href="http://purl.org/dc/terms/bibliographicCitation">bibliographicCitation</a></td>
                        <td>${page.occRawModel.bibliographiccitation?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>8</td>
                        <td>root</td>
                        <td><a href="http://purl.org/dc/terms/references">references</a></td>
                        <td>${page.occRawModel._references?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>9</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/institutionID">institutionID</a></td>
                        <td>${page.occRawModel.institutionid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>10</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/collectionID">collectionID</a></td>
                        <td>${page.occRawModel.collectionid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>11</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/datasetID">datasetID</a></td>
                        <td>${page.occRawModel.datasetid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>12</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/institutionCode">institutionCode</a></td>
                        <td>${page.occRawModel.institutioncode?if_exists}</td>
                        <td>${page.occModel.institutioncode?if_exists}</td>
                     </tr>
                     <tr>
                        <td>13</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/collectionCode">collectionCode</a></td>
                        <td>${page.occRawModel.collectioncode?if_exists}</td>
                        <td>${page.occModel.collectioncode?if_exists}</td>
                     </tr>
                     <tr>
                        <td>14</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/datasetName">datasetName</a></td>
                        <td>${page.occRawModel.datasetname?if_exists}</td>
                        <td>${page.occModel.datasetname?if_exists}</td>
                     </tr>
                     <tr>
                        <td>15</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/ownerInstitutionCode">ownerInstitutionCode</a></td>
                        <td>${page.occRawModel.ownerinstitutioncode?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>16</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/basisOfRecord">basisOfRecord</a></td>
                        <td>${page.occRawModel.basisofrecord?if_exists}</td>
                        <td>${page.occModel.basisofrecord!}</td>
                     </tr>
                     <tr class="unused">
                        <td>17</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/informationWithheld">informationWithheld</a></td>
                        <td>${page.occRawModel.informationwithheld?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>18</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/dataGeneralizations">dataGeneralizations</a></td>
                        <td>${page.occRawModel.datageneralizations?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>19</td>
                        <td>root</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/dynamicProperties">dynamicProperties</a></td>
                        <td>${page.occRawModel.dynamicproperties?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>20</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/occurrenceID">occurrenceID</a></td>
                        <td>${page.occRawModel.occurrenceid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>21</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/catalogNumber">catalogNumber</a></td>
                        <td>${page.occRawModel.catalognumber?if_exists}</td>
                        <td>${page.occModel.catalognumber?if_exists}</td>
                     </tr>
                     <tr>
                        <td>22</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/occurrenceRemarks">occurrenceRemarks</a></td>
                        <td>${page.occRawModel.occurrenceremarks?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>23</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/recordNumber">recordNumber</a></td>
                        <td>${page.occRawModel.recordnumber?if_exists}</td>
                        <td>${page.occModel.recordnumber?if_exists}</td>
                     </tr>
                     <tr>
                        <td>24</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/recordedBy">recordedBy</a></td>
                        <td>${page.occRawModel.recordedby?if_exists}</td>
                        <td>${page.occModel.recordedby?if_exists}</td>
                     </tr>
                     <tr class="unused">
                        <td>25</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/individualID">individualID</a></td>
                        <td>${page.occRawModel.individualid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>26</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/individualCount">individualCount</a></td>
                        <td>${page.occRawModel.individualcount?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>27</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/sex">sex</a></td>
                        <td>${page.occRawModel.sex?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>28</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/lifeStage">lifeStage</a></td>
                        <td>${page.occRawModel.lifestage?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>29</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/reproductiveCondition">reproductiveCondition</a></td>
                        <td>${page.occRawModel.reproductivecondition?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>30</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/behavior">behavior</a></td>
                        <td>${page.occRawModel.behavior?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>31</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/establishmentMeans">establishmentMeans</a></td>
                        <td>${page.occRawModel.establishmentmeans?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>32</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/occurrenceStatus">occurrenceStatus</a></td>
                        <td>${page.occRawModel.occurrencestatus?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>33</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/preparations">preparations</a></td>
                        <td>${page.occRawModel.preparations?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>34</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/disposition">disposition</a></td>
                        <td>${page.occRawModel.disposition?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>35</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/otherCatalogNumbers">otherCatalogNumbers</a></td>
                        <td>${page.occRawModel.othercatalognumbers?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>36</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/previousIdentifications">previousIdentifications</a></td>
                        <td>${page.occRawModel.previousidentifications?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>37</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/associatedMedia">associatedMedia</a></td>
                        <td>${page.occRawModel.associatedmedia?if_exists}</td>
                        <td>${page.occModel.associatedmedia?if_exists}</td>
                     </tr>
                     <tr>
                        <td>38</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/associatedReferences">associatedReferences</a></td>
                        <td>${page.occRawModel.associatedreferences?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>39</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/associatedOccurrences">associatedOccurrences</a></td>
                        <td>${page.occRawModel.associatedoccurrences?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>40</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/associatedSequences">associatedSequences</a></td>
                        <td>${page.occRawModel.associatedsequences!}</td>
                        <td>${page.occModel.associatedsequences!}</td>
                     </tr>
                     <tr>
                        <td>41</td>
                        <td>occurrence</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/associatedTaxa">associatedTaxa</a></td>
                        <td>${page.occRawModel.associatedtaxa?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>42</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/eventID">eventID</a></td>
                        <td>${page.occRawModel.eventid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>43</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/samplingProtocol">samplingProtocol</a></td>
                        <td>${page.occRawModel.samplingprotocol?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>44</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/samplingEffort">samplingEffort</a></td>
                        <td>${page.occRawModel.samplingeffort?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>45</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/eventDate">eventDate</a></td>
                        <td>${page.occRawModel.eventdate?if_exists}</td>
                        <td>${formatdate(page.occModel.syear!-1,page.occModel.smonth!-1,page.occModel.sday!-1)}</td>
                     </tr>
                     <tr>
                        <td>46</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/eventTime">eventTime</a></td>
                        <td>${page.occRawModel.eventtime?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>47</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/startDayOfYear">startDayOfYear</a></td>
                        <td>${page.occRawModel.startdayofyear?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>48</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/endDayOfYear">endDayOfYear</a></td>
                        <td>${page.occRawModel.enddayofyear?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>49</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/year">year</a></td>
                        <td>${page.occRawModel.year?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>50</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/month">month</a></td>
                        <td>${page.occRawModel.month?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>51</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/day">day</a></td>
                        <td>${page.occRawModel.day?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>52</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimEventDate">verbatimEventDate</a></td>
                        <td>${page.occRawModel.verbatimeventdate?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>53</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/habitat">habitat</a></td>
                        <td>${page.occRawModel.habitat?if_exists}</td>
                        <td>${page.occModel.habitat?if_exists}</td>
                     </tr>
                     <tr class="unused">
                        <td>54</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/fieldNumber">fieldNumber</a></td>
                        <td>${page.occRawModel.fieldnumber?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>55</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/fieldNotes">fieldNotes</a></td>
                        <td>${page.occRawModel.fieldnotes?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>56</td>
                        <td>event</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/eventRemarks">eventRemarks</a></td>
                        <td>${page.occRawModel.eventremarks?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>57</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/locationID">locationID</a></td>
                        <td>${page.occRawModel.locationid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>58</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/higherGeographyID">higherGeographyID</a></td>
                        <td>${page.occRawModel.highergeographyid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>59</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/higherGeography">higherGeography</a></td>
                        <td>${page.occRawModel.highergeography?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>60</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/continent">continent</a></td>
                        <td>${page.occRawModel.continent?if_exists}</td>
                        <td>${page.occModel.continent?if_exists}</td>
                     </tr>
                     <tr>
                        <td>61</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/waterBody">waterBody</a></td>
                        <td>${page.occRawModel.waterbody?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>62</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/islandGroup">islandGroup</a></td>
                        <td>${page.occRawModel.islandgroup?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>63</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/island">island</a></td>
                        <td>${page.occRawModel.island?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>64</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/country">country</a></td>
                        <td>${page.occRawModel.country?if_exists}</td>
                        <td>${page.occModel.country?if_exists}</td>
                     </tr>
                     <tr>
                        <td>65</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/countryCode">countryCode</a></td>
                        <td>${page.occRawModel.countrycode?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>66</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/stateProvince">stateProvince</a></td>
                        <td>${page.occRawModel.stateprovince?if_exists}</td>
                        <td>${page.occModel.stateprovince?if_exists}</td>
                     </tr>
                     <tr>
                        <td>67</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/county">county</a></td>
                        <td>${page.occRawModel.county?if_exists}</td>
                        <td>${page.occModel.county?if_exists}</td>
                     </tr>
                     <tr>
                        <td>68</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/municipality">municipality</a></td>
                        <td>${page.occRawModel.municipality?if_exists}</td>
                        <td>${page.occModel.municipality?if_exists}</td>
                     </tr>
                     <tr>
                        <td>69</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/locality">locality</a></td>
                        <td>${page.occRawModel.locality?if_exists}</td>
                        <td>${page.occModel.locality?if_exists}</td>
                     </tr>
                     <tr class="unused">
                        <td>70</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimLocality">verbatimLocality</a></td>
                        <td>${page.occRawModel.verbatimlocality?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>71</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimElevation">verbatimElevation</a></td>
                        <td>${page.occRawModel.verbatimelevation?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>72</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/minimumElevationInMeters">minimumElevationInMeters</a></td>
                        <td>${page.occRawModel.minimumelevationinmeters?if_exists}</td>
                        <td>${page.occModel.minimumelevationinmeters?if_exists}</td>
                     </tr>
                     <tr>
                        <td>73</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/maximumElevationInMeters">maximumElevationInMeters</a></td>
                        <td>${page.occRawModel.maximumelevationinmeters?if_exists}</td>
                        <td>${page.occModel.maximumelevationinmeters?if_exists}</td>
                     </tr>
                     <tr>
                        <td>74</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimDepth">verbatimDepth</a></td>
                        <td>${page.occRawModel.verbatimdepth?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>75</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/minimumDepthInMeters">minimumDepthInMeters</a></td>
                        <td>${page.occRawModel.minimumdepthinmeters?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>76</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/maximumDepthInMeters">maximumDepthInMeters</a></td>
                        <td>${page.occRawModel.maximumdepthinmeters?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>77</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/minimumDistanceAboveSurfaceInMeters">minimumDistanceAboveSurfaceInMeters</a></td>
                        <td>${page.occRawModel.minimumdistanceabovesurfaceinmeters?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>78</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/maximumDistanceAboveSurfaceInMeters">maximumDistanceAboveSurfaceInMeters</a></td>
                        <td>${page.occRawModel.maximumdistanceabovesurfaceinmeters?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>79</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/locationAccordingTo">locationAccordingTo</a></td>
                        <td>${page.occRawModel.locationaccordingto?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>80</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/locationRemarks">locationRemarks</a></td>
                        <td>${page.occRawModel.locationremarks?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>81</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimCoordinates">verbatimCoordinates</a></td>
                        <td>${page.occRawModel.verbatimcoordinates?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>82</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimLatitude">verbatimLatitude</a></td>
                        <td>${page.occRawModel.verbatimlatitude?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>83</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimLongitude">verbatimLongitude</a></td>
                        <td>${page.occRawModel.verbatimlongitude?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>84</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimCoordinateSystem">verbatimCoordinateSystem</a></td>
                        <td>${page.occRawModel.verbatimcoordinatesystem?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>85</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimSRS">verbatimSRS</a></td>
                        <td>${page.occRawModel.verbatimsrs?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>86</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/decimalLatitude">decimalLatitude</a></td>
                        <td>${page.occRawModel.decimallatitude?if_exists}</td>
                        <td>${safeNumber(page.occModel.decimallatitude!"","")}</td>
                     </tr>
                     <tr>
                        <td>87</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/decimalLongitude">decimalLongitude</a></td>
                        <td>${page.occRawModel.decimallongitude?if_exists}</td>
                        <td>${safeNumber(page.occModel.decimallongitude!"","")}</td>
                     </tr>
                     <tr>
                        <td>88</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/geodeticDatum">geodeticDatum</a></td>
                        <td>${page.occRawModel.geodeticdatum?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>89</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/coordinateUncertaintyInMeters">coordinateUncertaintyInMeters</a></td>
                        <td>${page.occRawModel.coordinateuncertaintyinmeters?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>90</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/coordinatePrecision">coordinatePrecision</a></td>
                        <td>${page.occRawModel.coordinateprecision?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>91</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/pointRadiusSpatialFit">pointRadiusSpatialFit</a></td>
                        <td>${page.occRawModel.pointradiusspatialfit?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>92</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/footprintWKT">footprintWKT</a></td>
                        <td>${page.occRawModel.footprintwkt?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>93</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/footprintSRS">footprintSRS</a></td>
                        <td>${page.occRawModel.footprintsrs?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>94</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/footprintSpatialFit">footprintSpatialFit</a></td>
                        <td>${page.occRawModel.footprintspatialfit?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>95</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/georeferencedBy">georeferencedBy</a></td>
                        <td>${page.occRawModel.georeferencedby?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>96</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/georeferencedDate">georeferencedDate</a></td>
                        <td>${page.occRawModel.georeferenceddate?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>97</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/georeferenceProtocol">georeferenceProtocol</a></td>
                        <td>${page.occRawModel.georeferenceprotocol?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>98</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/georeferenceSources">georeferenceSources</a></td>
                        <td>${page.occRawModel.georeferencesources?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>99</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/georeferenceVerificationStatus">georeferenceVerificationStatus</a></td>
                        <td>${page.occRawModel.georeferenceverificationstatus?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>100</td>
                        <td>location</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/georeferenceRemarks">georeferenceRemarks</a></td>
                        <td>${page.occRawModel.georeferenceremarks?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>101</td>
                        <td>identification</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/identificationID">identificationID</a></td>
                        <td>${page.occRawModel.identificationid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>102</td>
                        <td>identification</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/identifiedBy">identifiedBy</a></td>
                        <td>${page.occRawModel.identifiedby?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>103</td>
                        <td>identification</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/dateIdentified">dateIdentified</a></td>
                        <td>${page.occRawModel.dateidentified?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>104</td>
                        <td>identification</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/identificationReferences">identificationReferences</a></td>
                        <td>${page.occRawModel.identificationreferences?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>105</td>
                        <td>identification</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/identificationVerificationStatus">identificationVerificationStatus</a></td>
                        <td>${page.occRawModel.identificationverificationstatus?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>106</td>
                        <td>identification</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/identificationRemarks">identificationRemarks</a></td>
                        <td>${page.occRawModel.identificationremarks?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>107</td>
                        <td>identification</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/identificationQualifier">identificationQualifier</a></td>
                        <td>${page.occRawModel.identificationqualifier?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>108</td>
                        <td>identification</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/typeStatus">typeStatus</a></td>
                        <td>${page.occRawModel.typestatus!}</td>
                        <td> ${page.occModel.typestatus!}</td>
                     </tr>
                     <tr class="unused">
                        <td>109</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/taxonID">taxonID</a></td>
                        <td>${page.occRawModel.taxonid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>110</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/scientificNameID">scientificNameID</a></td>
                        <td>${page.occRawModel.scientificnameid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>111</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/acceptedNameUsageID">acceptedNameUsageID</a></td>
                        <td>${page.occRawModel.acceptednameusageid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>112</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/parentNameUsageID">parentNameUsageID</a></td>
                        <td>${page.occRawModel.parentnameusageid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>113</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/originalNameUsageID">originalNameUsageID</a></td>
                        <td>${page.occRawModel.originalnameusageid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>114</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/nameAccordingToID">nameAccordingToID</a></td>
                        <td>${page.occRawModel.nameaccordingtoid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>115</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/namePublishedInID">namePublishedInID</a></td>
                        <td>${page.occRawModel.namepublishedinid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>116</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/namePublishedInYear">namePublishedInYear</a></td>
                        <td>${page.occRawModel.namepublishedinyear?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>117</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/taxonConceptID">taxonConceptID</a></td>
                        <td>${page.occRawModel.taxonconceptid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>118</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/scientificName">scientificName</a></td>
                        <td>${page.occRawModel.scientificname?if_exists}</td>
                        <td>${page.occModel.scientificname?if_exists}</td>
                     </tr>
                     <tr>
                        <td>119</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/acceptedNameUsage">acceptedNameUsage</a></td>
                        <td>${page.occRawModel.acceptednameusage?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>120</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/parentNameUsage">parentNameUsage</a></td>
                        <td>${page.occRawModel.parentnameusage?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>121</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/originalNameUsage">originalNameUsage</a></td>
                        <td>${page.occRawModel.originalnameusage?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>122</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/nameAccordingTo">nameAccordingTo</a></td>
                        <td>${page.occRawModel.nameaccordingto?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>123</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/namePublishedIn">namePublishedIn</a></td>
                        <td>${page.occRawModel.namepublishedin?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>124</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/higherClassification">higherClassification</a></td>
                        <td>${page.occRawModel.higherclassification?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>125</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/kingdom">kingdom</a></td>
                        <td>${page.occRawModel.kingdom?if_exists}</td>
                        <td>${page.occModel.kingdom?if_exists}</td>
                     </tr>
                     <tr>
                        <td>126</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/phylum">phylum</a></td>
                        <td>${page.occRawModel.phylum?if_exists}</td>
                        <td>${page.occModel.phylum?if_exists}</td>
                     </tr>
                     <tr>
                        <td>127</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/class">class</a></td>
                        <td>${page.occRawModel._class?if_exists}</td>
                        <td>${page.occModel._class?if_exists}</td>
                     </tr>
                     <tr>
                        <td>128</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/order">order</a></td>
                        <td>${page.occRawModel._order?if_exists}</td>
                        <td>${page.occModel._order?if_exists}</td>
                     </tr>
                     <tr>
                        <td>129</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/family">family</a></td>
                        <td>${page.occRawModel.family?if_exists}</td>
                        <td>${page.occModel.family?if_exists}</td>
                     </tr>
                     <tr>
                        <td>130</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/genus">genus</a></td>
                        <td>${page.occRawModel.genus?if_exists}</td>
                        <td>${page.occModel.genus?if_exists}</td>
                     </tr>
                     <tr class="unused">
                        <td>131</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/subgenus">subgenus</a></td>
                        <td>${page.occRawModel.subgenus?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>132</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/specificEpithet">specificEpithet</a></td>
                        <td>${page.occRawModel.specificepithet?if_exists}</td>
                        <td>${page.occModel.specificepithet?if_exists}</td>
                     </tr>
                     <tr>
                        <td>133</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/infraspecificEpithet">infraspecificEpithet</a></td>
                        <td>${page.occRawModel.infraspecificepithet?if_exists}</td>
                        <td>${page.occModel.infraspecificepithet?if_exists}</td>
                     </tr>
                     <tr>
                        <td>134</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/taxonRank">taxonRank</a></td>
                        <td>${page.occRawModel.taxonrank?if_exists}</td>
                        <td>${page.occModel.taxonrank?if_exists}</td>
                     </tr>
                     <tr class="unused">
                        <td>135</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/verbatimTaxonRank">verbatimTaxonRank</a></td>
                        <td>${page.occRawModel.verbatimtaxonrank?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>136</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/scientificNameAuthorship">scientificNameAuthorship</a></td>
                        <td>${page.occRawModel.scientificnameauthorship?if_exists}</td>
                        <td>${page.occModel.scientificnameauthorship?if_exists}</td>
                     </tr>
                     <tr class="unused">
                        <td>137</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/vernacularName">vernacularName</a></td>
                        <td>${page.occRawModel.vernacularname?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>138</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/nomenclaturalCode">nomenclaturalCode</a></td>
                        <td>${page.occRawModel.nomenclaturalcode?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>139</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/taxonomicStatus">taxonomicStatus</a></td>
                        <td>${page.occRawModel.taxonomicstatus?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>140</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/nomenclaturalStatus">nomenclaturalStatus</a></td>
                        <td>${page.occRawModel.nomenclaturalstatus?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr>
                        <td>141</td>
                        <td>taxon</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/taxonRemarks">taxonRemarks</a></td>
                        <td>${page.occRawModel.taxonremarks?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>142</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/geologicalContextID">geologicalContextID</a></td>
                        <td>${page.occRawModel.geologicalcontextid?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>143</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/earliestEonOrLowestEonothem">earliestEonOrLowestEonothem</a></td>
                        <td>${page.occRawModel.earliesteonorlowesteonothem?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>144</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/latestEonOrHighestEonothem">latestEonOrHighestEonothem</a></td>
                        <td>${page.occRawModel.latesteonorhighesteonothem?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>145</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/earliestEraOrLowestErathem">earliestEraOrLowestErathem</a></td>
                        <td>${page.occRawModel.earliesteraorlowesterathem?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>146</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/latestEraOrHighestErathem">latestEraOrHighestErathem</a></td>
                        <td>${page.occRawModel.latesteraorhighesterathem?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>147</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/earliestPeriodOrLowestSystem">earliestPeriodOrLowestSystem</a></td>
                        <td>${page.occRawModel.earliestperiodorlowestsystem?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>148</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/latestPeriodOrHighestSystem">latestPeriodOrHighestSystem</a></td>
                        <td>${page.occRawModel.latestperiodorhighestsystem?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>149</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/earliestEpochOrLowestSeries">earliestEpochOrLowestSeries</a></td>
                        <td>${page.occRawModel.earliestepochorlowestseries?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>150</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/latestEpochOrHighestSeries">latestEpochOrHighestSeries</a></td>
                        <td>${page.occRawModel.latestepochorhighestseries?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>151</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/earliestAgeOrLowestStage">earliestAgeOrLowestStage</a></td>
                        <td>${page.occRawModel.earliestageorloweststage?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>152</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/latestAgeOrHighestStage">latestAgeOrHighestStage</a></td>
                        <td>${page.occRawModel.latestageorhigheststage?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>153</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/lowestBiostratigraphicZone">lowestBiostratigraphicZone</a></td>
                        <td>${page.occRawModel.lowestbiostratigraphiczone?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>154</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/highestBiostratigraphicZone">highestBiostratigraphicZone</a></td>
                        <td>${page.occRawModel.highestbiostratigraphiczone?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>155</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/lithostratigraphicTerms">lithostratigraphicTerms</a></td>
                        <td>${page.occRawModel.lithostratigraphicterms?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>156</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/group">group</a></td>
                        <td>${page.occRawModel.group?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>157</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/formation">formation</a></td>
                        <td>${page.occRawModel.formation?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>158</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/member">member</a></td>
                        <td>${page.occRawModel.member?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                     <tr class="unused">
                        <td>159</td>
                        <td>geological</td>
                        <td><a href="http://rs.tdwg.org/dwc/terms/bed">bed</a></td>
                        <td>${page.occRawModel.bed?if_exists}</td>
                        <td class="unused"></td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <!-- END DWC TAB-->
            <!-- NAME TAB -->
            <div id="name">
               <ul>
                  <li><a href="#" class="bhl_hide">${rc.getMessage("occpage.other.biodiversity.heritage.library")}</a></li>
                  <li><a href="#" class="eol_hide">${rc.getMessage("occpage.other.enciclopedia.of.life")}</a></li>
                  <li><a href="#" class="colif_hide">${rc.getMessage("occpage.other.catalog.of.life")}</a></li>
                  <#if page.occModel.hastypestatus?? && page.occModel.hastypestatus>
                  <h2>${rc.getMessage("occpage.group.typestatus")}</h2>
                  <p>${page.occModel.typestatus!}</p>
                  </#if>
               </ul>
               <!-- BHL PAGE-->
               <div class="bhl">
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
               <!-- END BHL PAGE-->		
               <!-- EOL PAGE-->
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
               <!-- END EOL PAGE-->	   
               <!-- COLIF PAGE-->
               <div class="colif">
                  <#assign species = "<i>${page.occModel.scientificname?if_exists}</i>"> 
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
               </div>
               <!-- END COLIF PAGE-->
            </div>
            <!-- END NAME TAB-->	
            <!-- CONTATO TAB -->
            <div id="contact">
               <h1>${page.data.resource_name!}</h1>
               <h2>${rc.getMessage("resourcecontact.header")}</h2>
               <table>
                  <tbody>
                     <tr>
                        <th>${rc.getMessage("resourcecontact.name")}</th>
                        <td>${page.data.name!}</td>
                     </tr>
                     <tr>
                        <th>${rc.getMessage("resourcecontact.position")}</th>
                        <td>${page.data.position_name!}</td>
                     </tr>
                     <tr>
                        <th>${rc.getMessage("resourcecontact.organization")}</th>
                        <td>${page.data.organization_name!}</td>
                     </tr>
                     <tr>
                        <th>${rc.getMessage("resourcecontact.address")}</th>
                        <td>${page.data.address!}, ${page.data.city!}, ${page.data.administrative_area!}, ${page.data.postal_code!}, ${page.data.country!}</td>
                     </tr>
                     <tr>
                        <th>${rc.getMessage("resourcecontact.email")}</th>
                        <td>
                           <#if page.data.email?has_content>
                           <a href="mailto:${page.data.email}">${page.data.email}</a>
                           </#if>
                        </td>
                     </tr>
                     <tr>
                        <th>${rc.getMessage("resourcecontact.telephone")}</th>
                        <td>${page.data.phone!}</td>
                     </tr>
                  </tbody>
               </table>
               <h2>Send a message to the publisher about: </h2>
               <form method="POST" id="sendmailform" name="sendmailform">
                  ${rc.getMessage("resourcecontact.name")}: <input type="text" name="name" style="width: 45%;"/></br>
                  ${rc.getMessage("resourcecontact.email")}: <input type="text" name="email" style="width: 45%;"/></br>
                  ${rc.getMessage("resourcecontact.message")}: <textarea form="sendmailform" id="message" name="message" cols="100" placeholder=${rc.getMessage("resourcecontact.tip")} style="height: 250px; width: 100%;"></textarea></br>
				  <input type="hidden" name ="subject" value=${rc.getMessage("resourcecontact.subject")}>
				  <input type="hidden" name ="domainName" value=${domainName}>
                  <input type="submit" value=${rc.getMessage("resourcecontact.submit")} style="width:10%;float:right">
               </form>
            </div>
            <!-- END CONTATO TAB -->
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
   <script src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
   <@jsAsset fileName="explorer" version=page.currentVersion! useMinified=page.useMinified/>
   <@jsAsset fileName="explorer.portal" version=page.currentVersion! useMinified=page.useMinified/>
   <script>
      $(function() {
        EXPLORER.details.setupSingleOccurrenceMap('occpage_map',${safeNumber(page.occModel.decimallatitude!"","undefined")},${safeNumber(page.occModel.decimallongitude!"","undefined")},${coordinateuncertaintyinmeters?c});
      });
   </script>
</content>
