package net.canadensys.dataportal.resource.service;

import java.util.List;

import net.canadensys.dataportal.occurrence.model.ResourceModel;

/**
 * ResourceService layer interface to access resource related data. This interface handles only high-level methods.
 * 
 * @author Pedro Guimarães
 * 
 */
public interface ResourceService {

	/**
	 * Load all resources on the database
	 * 
	 * @param sourcefileid
	 * @return
	 */
	public List<ResourceModel> loadResources();
	
	/**
	 * Load a ResourceModel from its auto_id
	 * @param auto_id
	 * @return
	 */
	public ResourceModel loadResource(String auto_id);
	
	/**
	 * Return a subset with only resources that already have records 
	 * @param resources
	 * @return
	 */
	public List<ResourceModel> filterResourcesWithoutRecords(List<ResourceModel> resources);
}
