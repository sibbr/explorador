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