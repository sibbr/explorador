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
</head>
<div id="body">
	<a id="main-content"></a>
	<div id="content" class="clear_fix no_side_bar">
		<h1>${rc.getMessage("publisherspage.publisherlist")}</h1>
		<table class="sortable">
			<thead>
				<tr>
					<th class="sorttable_alpha" scope="col">${rc.getMessage("publisherspage.publishername")}</th>
					<th class="sorttable_alpha" scope="col">${rc.getMessage("publisherspage.amountofrecords")}</th>
					<th class="sorttable_numerical" scope="col" style="float:right">${rc.getMessage("publisherspage.logo")}</th>
				</tr>
			</thead>
			<tbody>
				<#if page.publishers?has_content>
					<#list page.publishers as publisher>
						<#if (publisher.getRecord_count()?has_content)>
							<tr>
								<td><a href="${rc.getContextPath()}/${rc.getMessage("publisherspage.publisherlink")}/${publisher.getAuto_id()}" target"_self">${publisher.getName()}</a></td>
								<td>${publisher.getRecord_count()}</td>
								<td><img src="${publisher.getLogo_url()}" style="height: 70px; float: right"></td>							
							</tr>
						</#if>
					</#list>
				</#if>
			</tbody>
		</table>
		<h1>${rc.getMessage("publisherspage.distribution")}</h1>
		<div id="map" style="width: 100%; height: 480px"></div>
	    <script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
	    <script>
	    	var map = L.map('map').setView([-16.0, -50.0], 4);
	    	L.tileLayer('https://{s}.tiles.mapbox.com/v3/{id}/{z}/{x}/{y}.png', {
	        	maxZoom: 18,
	            id: 'examples.map-i875mjb7'
	        }).addTo(map);
	        <#list page.publishers as publisher>
	    		<#assign latitude = publisher.getDecimallatitude()?string?replace(",",".")>
	    		<#assign longitude = publisher.getDecimallongitude()?string?replace(",",".")>
	    		<#assign link = "<a href=" + "'" + rc.getMessage("publisherspage.publisherlink.map") + publisher.getAuto_id() + "'" + ">" + publisher.getName() + "</a>">
	    		<#assign popuptxt = "</br>" + rc.getMessage("publisherspage.recordnumber") + " " + publisher.getRecord_count()?string>
	   	        new L.marker([${latitude}, ${longitude}]).bindPopup("${link} ${popuptxt}").addTo(map);
	        </#list>
   	        map.on('click', onMarkerClick);
	        function onMarkerClick(e) {
	           marker.openPopup();
	        }        
	    </script>
	   	<#if ((page.totalpublishers!0) >= page.pageSize)>
	   		<#assign p = (page.currentPage!1)?number>
			<@pages 1..page.totalPages p />
		</#if>
   	</div>
</div>