<title>${rc.getMessage("publisherspage.title")}</title>
<div id="body">
	<div id="content" class="clear_fix no_side_bar">
		<#if page.publisher?has_content>
			<h1>${page.publisher.getName()!}</h1>
			<#if page.information?has_content>
				<h2>${rc.getMessage("publisherpage.information")}</h2>
			    <#if page.information.getpublisher_logo_url()?has_content>
			    	<a href="${page.information.getpublisher_logo_url()}" target="_blank" style="float: right;">
						<img src="${page.information.getpublisher_logo_url()}">
				    </a>
			    </#if>
			    <#if page.information.getTitle()?has_content>
				   <b>${rc.getMessage("publisherpage.title")}:</b> ${page.information.getTitle()!}</br>
			    </#if>   
			    <#if page.information.get_abstract()?has_content>
			   		<b>${rc.getMessage("publisherpage.abstract")}:</b> ${page.information.get_abstract()!}</br>
			    </#if>
			    <#if page.information.getpublisher_uuid()?has_content>
			   		<b>${rc.getMessage("publisherpage.uuid")}:</b>
			   		<a href="http://www.gbif.org/dataset/${page.information.getpublisher_uuid()}" target="_blank">${page.information.getpublisher_uuid()}</a></br>
			    </#if>   
			    <#if page.information.getCollection_identifier()?has_content>
				   <b>${rc.getMessage("publisherpage.collectionidentifier")}:</b> ${page.information.getCollection_identifier()!}</br>
			    </#if>
			    <#if page.information.getParent_collection_identifier()?has_content>
			   		<b>${rc.getMessage("publisherpage.parentcollectionidentifier")}:</b> ${page.information.getParent_collection_identifier()!}</br>
				</#if>
			    <#if page.information.getCollection_name()?has_content>
					<b>${rc.getMessage("publisherpage.collectionname")}:</b> ${page.information.getCollection_name()!}</br>
			   	</#if>
			   	<#if page.information.getPublication_date()?has_content>
					<b>${rc.getMessage("publisherpage.publicationdate")}:</b> ${page.information.getPublication_date()!}</br>
				</#if>
				<#if page.information.getKeyword()?has_content>
					<b>${rc.getMessage("publisherpage.keywords")}:</b> ${page.information.getKeyword()}</br>
				</#if>
				<#if page.information.getKeyword_thesaurus()?has_content>
				   <b>${rc.getMessage("publisherpage.keywordthesaurus")}:</b> ${page.information.getKeyword_thesaurus()}</br>
			    </#if>
			    <#if page.information.getAlternate_identifier()?has_content>
			    <b>${rc.getMessage("publisherpage.alternateidentifier")}:</b> ${page.information.getAlternate_identifier()}
			    </#if>
		    
			    <h2>${rc.getMessage("publisherpage.licensingandrights")}</h2>
			    <div style=" border: 1px solid #a8a7a5; border-radius: 5px; background-color: #D9ECE0; width: 80%; padding: 10px; margin: auto; text-align: center">
			    	${rc.getMessage("publisherpage.license.description")}
			    </div>
			    </br>
				<b>${rc.getMessage("publisherpage.intellectualrights")}:</b>
			    <#if page.information.getIntellectual_rights()?has_content>
			    	 ${page.information.getIntellectual_rights()!}
				<#else>
					${rc.getMessage("publisherpage.defaultintellectualrights")}
			    </#if>
			    </br>
   			    <b>${rc.getMessage("publisherpage.citation")}:</b>
				<#if page.information.getCitation()?has_content>
		    		${page.information.getCitation()!}
			    <#else>
			    	<#assign link = rc.getMessage("publisherpage.publisher")> 
			    	${rc.getMessage("publisherpage.defaultcitation")}:</br></br>
			    	<div style=" border: 1px solid #a8a7a5; border-radius: 5px; background-color: #D9ECE0; width: 80%; padding: 10px; margin: auto; text-align: center">
				    	${page.information.getTitle()!}, ${page.information.getPublication_date()!}.</br>
				    	${rc.getMessage("publisherpage.accessedon")} <a href="${rc.getContextPath()}/${link}/${page.publisher.getId()}" target="_blank"> ${domainName}${rc.getContextPath()}/${link}/${page.publisher.getId()} </a>, ${rc.getMessage("publisherpage.on")} ${page.currentTime}.
				    </div>	   	
				</#if>
				</br>
			<#else>
			<h2>Sorry, no information found about this dataset.</h2>
			</#if>
		</#if>	
	</div>
</div>	