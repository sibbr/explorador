package net.canadensys.dataportal.publisher.service;

import java.util.List;

import net.canadensys.dataportal.occurrence.model.PublisherInformationModel;

/**
 * PublisherService layer interface to access Publisher related data. This interface handles only high-level methods.
 * 
 * @author Pedro Guimarães
 * 
 */
public interface PublisherService {

	/**
	 * Load all Publishers on the database
	 * 
	 * @param sourcefileid
	 * @return
	 */
	public List<PublisherInformationModel> loadPublishers();
	
	/**
	 * Load a PublisherModel from its auto_id
	 * @param auto_id
	 * @return
	 */
	public PublisherInformationModel loadPublisher(String auto_id);
}
