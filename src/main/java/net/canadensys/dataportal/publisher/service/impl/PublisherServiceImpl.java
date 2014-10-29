package net.canadensys.dataportal.publisher.service.impl;

import java.util.ArrayList;
import java.util.List;

import net.canadensys.dataportal.occurrence.dao.PublisherInformationDAO;
import net.canadensys.dataportal.occurrence.model.PublisherInformationModel;
import net.canadensys.dataportal.publisher.controller.PublisherController;
import net.canadensys.dataportal.publisher.service.PublisherService;

import org.apache.log4j.Logger;
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

	// get log4j handler
		private static final Logger LOGGER = Logger
				.getLogger(PublisherServiceImpl.class);
	
	@Autowired
	private PublisherInformationDAO PublisherInformationDAO;

	/**
	 * Fetch Publisher given its auto_id:
	 */
	@Override
	@Transactional(readOnly = true)
	public PublisherInformationModel loadPublisher(String auto_id) {
		return PublisherInformationDAO.load(Integer.valueOf(auto_id));
	}

	/**
	 * PublisherInformationModel will be cached after calling this method.
	 * Those models are assumed to be 'almost static' so the current cache invalidation is handled by CacheInvalidationScheduled.
	 * This could potentially cause an issue if a PublisherModel is updated and no harvest are achieved.
	 */
	@Override
	@Transactional(readOnly = true)
	public List<PublisherInformationModel> loadPublishers() {
		List<PublisherInformationModel> publishers = new ArrayList<PublisherInformationModel>();
		for (PublisherInformationModel publisher: PublisherInformationDAO.loadPublishers()) {
			LOGGER.error(publisher.getName());
			if (!publishers.contains(publisher))
				publishers.add(publisher);
		}
		return publishers;
	}
}
