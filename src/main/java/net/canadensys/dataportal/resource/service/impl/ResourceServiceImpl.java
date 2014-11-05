package net.canadensys.dataportal.resource.service.impl;

import java.util.ArrayList;
import java.util.List;

import net.canadensys.dataportal.occurrence.dao.ResourceDAO;
import net.canadensys.dataportal.occurrence.dao.ResourceInformationDAO;
import net.canadensys.dataportal.occurrence.model.ResourceModel;
import net.canadensys.dataportal.resource.service.ResourceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of the resources service layer
 * 
 * @author Pedro Guimarães
 */
@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private ResourceDAO resourceDAO;

	@Autowired
	private ResourceInformationDAO resourceInformationDAO;
	
	/**
	 * Fetch resource given its auto_id:
	 */
	@Override
	@Transactional(readOnly = true)
	public ResourceModel loadResource(String auto_id) {
		return resourceDAO.load(auto_id);
	}

	/**
	 * ResourceModel will be cached after calling this method.
	 * Those models are assumed to be 'almost static' so the current cache invalidation is handled by CacheInvalidationScheduled.
	 * This could potentially cause an issue if a ResourceModel is updated and no harvest are achieved.
	 */
	@Override
	@Transactional(readOnly = true)
	public List<ResourceModel> loadResources() {
		return resourceDAO.loadResources();
	}
	
	public List<ResourceModel> filterResourcesWithoutRecords(List<ResourceModel> resources) {
		ArrayList<ResourceModel> filledResources = new ArrayList<ResourceModel>();
		for(ResourceModel resource: resources) {
			if (resource.getRecord_count() > 0) {
				filledResources.add(resource);
			}	
		}
		return filledResources;
	}
}
