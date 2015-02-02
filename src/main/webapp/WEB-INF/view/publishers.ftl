<#ftl strip_whitespace=true>
<#include "inc/functions.ftl">
<#include "inc/paging.ftl">
<#include "inc/global-functions.ftl">
<head>
<title>${rc.getMessage("publisherspage.title")}</title>
<@cssAsset fileName="occportal" version=page.currentVersion! useMinified=false/>
<@jsLibAsset libName="sorttable.js"/>

<!-- Leaflet related configuration-->
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" />
<link href='https://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v0.0.3/leaflet.fullscreen.css' rel='stylesheet' />
</head>
<div id="body">
	<a id="main-content"></a>
  	<div class="boxcontent">
	    <div id="content" class="clear_fix no_side_bar">
			<h1>${rc.getMessage("publisherspage.publisherlist",  [page.totalPublishers])}</h1>
			<div id="map" style="width: 100%; height: 480px"></div>
	      <script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
		  <script src='https://api.tiles.mapbox.com/mapbox.js/plugins/leaflet-fullscreen/v0.0.3/Leaflet.fullscreen.min.js'></script>
	      <script>
		    	var map = L.map('map').setView([-16.0, -50.0], 4);
				
		    	L.tileLayer('https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
		        	maxZoom: 18,
		            id: 'examples.map-i875mjb7'
		        }).addTo(map);
				
				var institute = L.icon({
				    iconUrl: 'http://buriti.lncc.br/wordpress/wp-content/themes/portal/img/markers/marker-7.png',
				    iconAnchor:   [17, 42], // point of the icon which will correspond to marker's location
				});	
				
		        <#list page.allPublishers as publisher>
		        	<#if publisher.getDecimallatitude()?has_content>
			    		<#assign latitude = publisher.getDecimallatitude()?string?replace(",",".")>
			    	</#if>
		        	<#if publisher.getDecimallongitude()?has_content>
			    		<#assign longitude = publisher.getDecimallongitude()?string?replace(",",".")>
			    	</#if>	
		    		<#assign link = "<a href=" + "'" + rc.getMessage("publisherspage.publisherlink.map") + publisher.getAuto_id() + "'" + ">" + publisher.getName() + "</a>">
		    		<#assign popuptxt = "</br>" + rc.getMessage("publisherspage.recordnumber") + " " + publisher.getRecord_count()?string>
		   	        new L.marker([${latitude}, ${longitude}], {icon: institute}).bindPopup("${link} ${popuptxt}").addTo(map);
							
		        </#list>
				L.control.fullscreen().addTo(map);
	   	        map.on('click', onMarkerClick);
		        function onMarkerClick(e) {
		           marker.openPopup();
		        }        
		    </script>
		    </br>
			<table id="results" class="sortable">
				<thead>
					<tr>
						<th align="center" class="sorttable_numerical"  scope="col">${rc.getMessage("publisherspage.logo")}</th>
						<th align="center" class="sorttable_alpha" scope="col">${rc.getMessage("publisherspage.publishername")}</th>
						<th align="center" class="sorttable_alpha" scope="col">${rc.getMessage("publisherspage.amountofrecords")}</th>
					</tr>
				</thead>
				<tbody>
					<#if page.publishers?has_content>
				  		<#list page.publishers as publisher>
				  			<#if (publisher.getRecord_count()?has_content)>
				  				<tr>
				     				<td align="center" valign="middle"><img src="${publisher.getLogo_url()}" alt="${publisher.getName()}" align="middle" style="height: 70px;" /></td>
				    				<td><a href="${rc.getContextPath()}/${rc.getMessage("publisherspage.publisherlink")}/${publisher.getAuto_id()}" target="_self">${publisher.getName()}</a></td>
				    				<td><a href="${rc.getContextPath()}/${rc.getMessage("publisherspage.occurrencelink")}${publisher.getName()}" target="_blank">${publisher.getRecord_count()}</a></td>
				  				</tr>
				  			</#if>
				  		</#list>
					</#if>
				</tbody>
			</table>
			<#if ((page.totalPublishers!0) >= page.pageSize)>
			<#assign p = (page.currentPage!1)?number>
			<@pages 1..page.totalPages p />
			</#if>
		</div>
	</div>
</div>