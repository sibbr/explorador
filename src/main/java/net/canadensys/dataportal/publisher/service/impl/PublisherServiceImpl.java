package net.canadensys.dataportal.publisher.service.impl;

import java.util.List;

import net.canadensys.dataportal.occurrence.dao.PublisherDAO;
import net.canadensys.dataportal.occurrence.model.PublisherModel;
import net.canadensys.dataportal.publisher.service.PublisherService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implementation of the Publishers service layer
 * 
 * @author Pedro Guimarães
 */
@Service("PublisherService")
public class PublisherServiceImpl implements PublisherService {

	@Autowired
	private PublisherDAO PublisherDAO;

	/**
	 * Fetch Publisher given its auto_id:
	 */
	@Override
	@Transactional(readOnly = true)
	public PublisherModel loadPublisher(String auto_id) {
		return PublisherDAO.load(Integer.valueOf(auto_id));
	}

	/**
	 * PublisherModel will be cached after calling this method.
	 * Those models are assumed to be 'almost static' so the current cache invalidation is handled by CacheInvalidationScheduled.
	 * This could potentially cause an issue if a PublisherModel is updated and no harvest are achieved.
	 */
	@Override
	@Transactional(readOnly = true)
	public List<PublisherModel> loadPublishers() {
		return PublisherDAO.loadPublishers();	
	}
}
