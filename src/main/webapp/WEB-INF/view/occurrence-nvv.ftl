<div id="nvvcontent">
	<h2>${rc.getMessage("occpage.other.namecheck")}</h2>
	<p>${rc.getMessage("occpage.nvv.description1")}</p>
	<p>${rc.getMessage("occpage.nvv.description2")}</p>
	<p>${rc.getMessage("occpage.nvv.description3")}</p>
	<small>${rc.getMessage("occpage.nvv.description4")}</small>
	</br></br>
	<#if page.occNVV?has_content>
		<table id="results" class="sortable">
			<thead>
				<tr>
					<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.nvv.scientificname")}</th>
						<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.nvv.source")}</th>
						<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.nvv.higherrank")}</th>
						<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.nvv.found")}</th>
						<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.nvv.publishertaxonrank")}</th>
						<th class="sorttable_alpha" scope="col">${rc.getMessage("occpage.nvv.referencetaxonrank")}</th>
						<th class="sorttable_aplha" scope="col">${rc.getMessage("occpage.nvv.synonym")}</th>
					</tr>
			</thead>
			<tbody>
			   	<#list page.occNVV as result>
			   		<#if result.getNome()?has_content>
				   		<#if result.getNivelTaxonomico()?has_content>	
					   		<tr>
				           		<td>${result.getNome()!}</td>
				           		<td><#if result.getFonteAvaliadora()?has_content>${result.getFonteAvaliadora()?lower_case?cap_first}</#if></td>
								<td>
								<#if result.getClassificacaoSuperior()?has_content>
									${result.getClassificacaoSuperior()!}
								<#else>
									${rc.getMessage("occpage.nvv.none")}
								</#if>
								</td>
				           		<td>
				           			<#if result.getIsNomeEncontrado()?has_content>
				           				<#if result.getIsNomeEncontrado()>
				           					${rc.getMessage("occpage.nvv.yes")}
				           				<#else>
				           					${rc.getMessage("occpage.nvv.no")}
				           				</#if>
				           			</#if>
				           		</td>
				           		<td><#if page.occModel.getTaxonrank()?has_content>${page.occModel.getTaxonrank()?lower_case?cap_first}</#if></td>
				           		<td><#if result.getNivelTaxonomico()?has_content>${result.getNivelTaxonomico()?cap_first}</#if></td>
								<td>
				           			<#if result.getIsSinonimo()>
				         					<#if result.getSinonimoDe()?has_content>${result.getSinonimoDe()!}</#if>
				         				<#else>
				          				${rc.getMessage("occpage.nvv.none")}
				          			</#if>
				          		</td>
				          	</tr>
				    	</#if>
			   		</#if>
				</#list>
			</tbody>
		</table>	
	<#else>
		<li>${rc.getMessage("occpage.not.available")}</li>
	</#if>	
</div>