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