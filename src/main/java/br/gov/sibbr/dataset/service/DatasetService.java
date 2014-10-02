package br.gov.sibbr.dataset.service;

import java.util.List;

import net.canadensys.dataportal.occurrence.model.ResourceInformationModel;
import net.canadensys.dataportal.occurrence.model.ResourceModel;

/**
 * OccurrenceService layer interface to access occurrence related data. This interface handles only high-level methods.
 * 
 * @author canadensys
 * 
 */
public interface DatasetService {

	/**
	 * Load a resource model based on the resource_uuid.
	 * 
	 * @return
	 */
	public ResourceModel loadResource(String resource_uuid);

	/**
	 * Load a list with all the resources available.
	 * @return
	 */
	public List<ResourceModel> loadResources();

	/**
	 * Load a ResourceInformationModel based on the resource_uuid
	 * 
	 * @param resource_uuid
	 * @return
	 */
	public ResourceInformationModel loadResourceInformationModel(String resource_uuid);
}
