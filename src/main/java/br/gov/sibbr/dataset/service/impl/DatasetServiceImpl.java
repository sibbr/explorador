package br.gov.sibbr.dataset.service.impl;

import java.util.List;

import net.canadensys.dataportal.occurrence.dao.ResourceDAO;
import net.canadensys.dataportal.occurrence.dao.ResourceInformationDAO;
import net.canadensys.dataportal.occurrence.model.ResourceInformationModel;
import net.canadensys.dataportal.occurrence.model.ResourceModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.gov.sibbr.dataset.service.DatasetService;

/**
 * Implementation of the Occurrence service layer
 * 
 * @author Pedro Guimarães
 */
@Service("datasetService")
public class DatasetServiceImpl implements DatasetService {

	@Autowired
	private ResourceInformationDAO resourceInformationDAO;

	@Autowired
	private ResourceDAO resourceDAO;

	@Override
	@Transactional(readOnly = true)
	public ResourceModel loadResource(String resource_uuid) {
		return resourceDAO.load(resource_uuid);
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ResourceModel> loadResources() {
		return resourceDAO.loadResources();
	}
	
	@Override
	@Transactional(readOnly = true)
	public ResourceInformationModel loadResourceInformationModel(String resourceUuid){
		return resourceInformationDAO.load(resourceUuid);
	}
}
