<title>${rc.getMessage("publisherspage.title")}</title>
<div id="body">
	<div id="content" class="clear_fix no_side_bar">
		<#if page.publisher?has_content>
			<h1>${page.publisher.getName()!}</h1>
			<#if page.publisher?has_content>
				<#assign info = page.publisher>
				<h2>${rc.getMessage("publisherpage.information")} (${info.getRecord_count()} ${rc.getMessage("publisherpage.records")})</h2>
			    <#if info.getLogo_url()?has_content>
			    	<a href="${info.getLogo_url()}" target="_blank" style="float: right;">
						<img src="${info.getLogo_url()}">
				    </a>
			    </#if>
				<#if info.getName()?has_content>
			    	${info.getName()}
			    </#if>
			    <#if info.getDescription()?has_content>
				   <b>${rc.getMessage("publisherpage.description")}:</b> ${info.getDescription()}</br>
			    </#if>
			    <#if info.getHomepage()?has_content>
				   <b>${rc.getMessage("publisherpage.homepage")}:</b> ${info.getHomepage()}</br>
			    </#if>
			    <h2>${rc.getMessage("publisherpage.contactinformation")}</h2>
			    <#if info.getEmail()?has_content>
			   		<b>${rc.getMessage("publisherpage.email")}:</b> ${info.getEmail()}</br>
				</#if>
			    <#if info.getPhone()?has_content>
					<b>${rc.getMessage("publisherpage.phone")}:</b> ${info.getPhone()}</br>
			   	</#if>
			   	<#if info.getAddress()?has_content>
					<b>${rc.getMessage("publisherpage.address")}:</b> ${info.getAddress()}</br>
				</#if>
				<#if info.getCity()?has_content>
					<b>${rc.getMessage("publisherpage.city")}:</b> ${info.getCity()}</br>
				</#if>
				<#if info.getAdministrative_area()?has_content>
				   <b>${rc.getMessage("publisherpage.department")}:</b> ${info.getAdministrative_area()}</br>
			    </#if>
		    	<#if info.getPostal_code()?has_content>
			    	<b>${rc.getMessage("publisherpage.postalcode")}:</b> ${info.getPostal_code()}
			    </#if>
			<#else>
			<h2>Sorry, no information found about this dataset.</h2>
			</#if>
		</#if>	
	</div>
</div>	