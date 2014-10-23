package net.canadensys.dataportal.publisher.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.canadensys.dataportal.occurrence.OccurrenceService;
import net.canadensys.dataportal.occurrence.config.OccurrencePortalConfig;
import net.canadensys.dataportal.occurrence.controller.ControllerHelper;
import net.canadensys.dataportal.occurrence.model.PublisherInformationModel;
import net.canadensys.dataportal.publisher.service.PublisherService;
import net.canadensys.exception.web.ResourceNotFoundException;
import net.canadensys.web.i18n.annotation.I18nTranslation;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller of all Publisher related features of the explorer.
 * 
 * @author Pedro Guimarães
 * 
 */
@Controller
public class PublisherController {

	// get log4j handler
	private static final Logger LOGGER = Logger
			.getLogger(PublisherController.class);

	@Autowired
	private PublisherService publisherService;

	@Autowired
	private OccurrenceService occurrenceService;

	@Autowired
	@Qualifier("occurrencePortalConfig")
	private OccurrencePortalConfig appConfig;

	// Define maximum number of records per page
	private static final int pageSize = 20;

	// Occurrence view tags
	private static final String PAGE_PARAM = "page";
	
	private static final String PAGE_ONE = "1";

	/**
	 * Display a list of all current available Publishers with pagination support.
	 * 
	 */
	@RequestMapping(value = "/publishers", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "publishers", translateFormat = "/publishers")
	public ModelAndView handlePublishers(HttpServletRequest request) {
		List<PublisherInformationModel> publishers = publisherService.loadPublishers();
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();
		String pageNumber = request.getParameter(PAGE_PARAM);
		if (publishers != null) {
			List<PublisherInformationModel> pagePublishers = null;
			// Get total number of Publishers
			int totalPublishers = publishers.size();
			// Provide the number of pages
			int totalPages = (totalPublishers / pageSize) + 1;
			modelRoot.put("totalPublishers", totalPublishers);
			modelRoot.put("totalPages", totalPages);
			modelRoot.put("pageSize", pageSize);
			// A page number has been provided
			if (pageNumber!=null) {
				int page = Integer.parseInt(pageNumber);
				modelRoot.put("currentPage", page);
				// If the page is valid:
				if (page > 0) {
					/**
					 * Logic to load the records to a given page Ex.: Page 4 →
					 * Get From 61 to 80 → Shift interval on the index list is
					 * from 60 final 79
					 */
					int shift = (page - 1) * pageSize;
					// Avoid ouf of bounds by the upper limit:
					if ((shift + pageSize) <= totalPublishers) {
						pagePublishers = publishers.subList(shift, (shift + pageSize));
					} else {
						pagePublishers = publishers.subList(shift, (shift + (totalPublishers-shift) ));
					}
					modelRoot.put("publishers", pagePublishers);
				}
			}
			// No page provided, return first page
			else {
				modelRoot.put("currentPage", PAGE_ONE);
				if (totalPublishers == pageSize) {
					pagePublishers = publishers.subList(0,
						pageSize - 1);
				} else {
					pagePublishers = publishers.subList(0,
							totalPublishers);
				}
				modelRoot.put("publishers", pagePublishers);
			}
		} else {
			throw new ResourceNotFoundException();
		}
		// Set common stuff
		ControllerHelper.setDatasetVariables(request, "publishers", null,
				appConfig, modelRoot);
		
		return new ModelAndView("publishers",
				OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}

	/**
	 * Display a page with information about the current Publisher given its
	 * auto_id value.
	 * 
	 */
	@RequestMapping(value = "/publisher/{auto_id}", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "publisher", translateFormat = "/publisher/{}")
	public ModelAndView handlePublisher(@PathVariable String auto_id,
			HttpServletRequest request) {
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();
		PublisherInformationModel publisher = publisherService
				.loadPublisher(auto_id);
		if (!publisher.equals(null)) {
			modelRoot.put("publisher", publisher);
		} else {
			throw new ResourceNotFoundException();
		}
		// Set common stuff
		ControllerHelper.setDatasetVariables(request, "publisher", auto_id,
				appConfig, modelRoot);

		return new ModelAndView("publisher",
				OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}
}