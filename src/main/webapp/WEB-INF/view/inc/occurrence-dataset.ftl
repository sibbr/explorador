<div >
   <#assign species = "<i>${page.occModel.scientificname?if_exists}</i>"> 
   <!-- Catalog of Life -->		
   <h1>${page.information.getResource_name()!}</h1>
   <h2>Information:</h2>
   <#if page.information.getResource_logo_url()?has_content>
   <a href="${page.information.getResource_logo_url()}" target="_blank" style="float:right;">
   	 <img src="${page.information.getResource_logo_url()}">
   </a></br>
   </#if>
   <#if page.information.get_abstract()?has_content>
   		<b>Abstract:</b> ${page.information.get_abstract()!}</br>
   </#if>
   <#if page.information.getTitle()?has_content>
	   <b>Title:</b> ${page.information.getTitle()!}</br>
   </#if>   
   <#if page.information.getResource_uuid()?has_content>
   <b>UUID:</b> <a href="${page.information.getResource_uuid()}" target="_blank">${page.information.getResource_uuid()}</a></br>
   </#if>   
   <#if page.information.getCollection_identifier()?has_content>
	   <b>Collection identifier:</b> ${page.information.getCollection_identifier()!}</br>
   </#if>
   <#if page.information.getParent_collection_identifier()?has_content>
   		<b>Parent collection identifier:</b> ${page.information.getParent_collection_identifier()!}</br>
   </#if>
   <#if page.information.getCollection_name()?has_content>
		<b>Collection name:</b> ${page.information.getCollection_name()!}</br>
   </#if>		
   <#if page.information.getPublication_date()?has_content>
	   <b>Publication date:</b> ${page.information.getPublication_date()!}</br>
   </#if>
   <#if page.information.getKeyword()?has_content>
	   <b>Keywords:</b> ${page.information.getKeyword()}</br>
   </#if>
   <#if page.information.getKeyword_thesaurus()?has_content>
	   <b>Keyword Thesaurus:</b> ${page.information.getKeyword_thesaurus()}</br>
   </#if>
   <#if page.information.getAlternate_identifier()?has_content>
	   <b>Alternate identifier:</b> <a href="${page.information.getAlternate_identifier()}" target:"_blank">${page.information.getAlternate_identifier()}</a>
   </#if>
   <h2>Licencing and rights</h2>
   <#if page.information.getCitation()?has_content>
       <b>Citation:</b> ${page.information.getCitation()!}</br>
   </#if>
   <#if page.information.getIntellectual_rights()?has_content>
	   <b>Intellectual rights:</b> ${page.information.getIntellectual_rights()!}</br>
   </#if>	   
</div>