<#include "inc/functions.ftl">
<#include "inc/global-functions.ftl">
<#include "inc/tip.ftl">
<head>
<title>${rc.getMessage("occpage.title")}</title>
<@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- JQUERY LOAD BHL AND EOL -->
<script type="text/javascript">
$(document).ready(function(){
	$("#nvvlink").click(function(evento){
		evento.preventDefault();
		$("#servicecontent").html("<div id='load' style='width: 100%;position:relative; top: 80px;vertical-align: middle;height:200px;margin: auto 0;text-align:center;'><img src='http://buriti.lncc.br/wordpress/wp-content/themes/portal/img/carregando.gif'/><p>${rc.getMessage("occpage.name.loading")} - <strong>${rc.getMessage("occpage.other.namecheck")}</strong></div>");
		$("#servicecontent").load("?view=nvv #nvvcontent");
	});
})
$(document).ready(function(){
	$("#bhllink").click(function(evento){
		evento.preventDefault();
		$("#servicecontent").html("<div id='load' style='width: 100%;position:relative; top: 80px;vertical-align: middle;height:200px;margin: auto 0;text-align:center;'><img src='http://buriti.lncc.br/wordpress/wp-content/themes/portal/img/carregando.gif'/><p>${rc.getMessage("occpage.name.loading")} - <strong>${rc.getMessage("occpage.other.biodiversity.heritage.library")}</strong></div>");
		$("#servicecontent").load("?view=bhl #bhlcontent");
	});
})
$(document).ready(function(){
	$("#eollink").click(function(evento){
		evento.preventDefault();
		$("#servicecontent").html("<div id='load' style='width: 100%;position:relative; top: 80px;vertical-align: middle;height:200px;margin: auto 0;text-align:center;'><img src='http://buriti.lncc.br/wordpress/wp-content/themes/portal/img/carregando.gif'/><p>${rc.getMessage("occpage.name.loading")} - <strong>${rc.getMessage("occpage.other.enciclopedia.of.life")}</strong></div>");
	  	  $('#servicecontent').append("<scr" + "ipt type='text/javascript' src='/explorador/assets/js/lib/sorttable.js'></scr" + "ipt>");
          $("#servicecontent").load("?view=eol #eolcontent");
	});
})
</script>
<!-- END JQUERY LOAD BHL AND EOL -->
<style>
.boxcontent {margin: 0 0 20px;background: rgb(255,255,255);border-radius: 0px 5px 5px 5px;-webkit-box-shadow: rgb(240,240,240) 3px 0px 3px 2px;box-shadow: rgb(223,223,223) 3px 0px 3px 2px;border-right: 1px solid #ddd;border-left: 1px solid #ddd;	  border-top: none!important;}
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
          <div id="servicecontent"></div>
        </div>
        <!-- CONTACT TAB -->
        <div id="contact"></div>
      </div>
    </div>
    <!-- END TAB content_tab --> 
  </div>
  <#-- content --> </div>
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