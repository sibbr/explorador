package net.canadensys.dataportal.dataset.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.canadensys.dataportal.occurrence.OccurrenceService;
import net.canadensys.dataportal.occurrence.config.OccurrencePortalConfig;
import net.canadensys.dataportal.occurrence.controller.ControllerHelper;
import net.canadensys.dataportal.occurrence.model.ResourceModel;
import net.canadensys.exception.web.ResourceNotFoundException;
import net.canadensys.web.i18n.annotation.I18nTranslation;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Controller of all occurrence related features of the occurrence portal.
 * Occurrence related excludes the search functionality. This controller must be
 * stateless.
 * 
 * @author canadensys
 * 
 */
@Controller
public class DatasetController {

	// get log4j handler
	private static final Logger LOGGER = Logger.getLogger(DatasetController.class);

	@Autowired
	private OccurrenceService occurrenceService;
	
	@Autowired
	@Qualifier("occurrencePortalConfig")
	private OccurrencePortalConfig appConfig;

	/**
	 * Display a list with pagination of all current available resources.
	 * 
	 */
	@RequestMapping(value = "/datasets}", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "datasets", translateFormat = "/datasets")
	public ModelAndView handleResources(HttpServletRequest request) {
		List<ResourceModel> resources = occurrenceService.loadResources();
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();
		if (!resources.equals(null)) {
			modelRoot.put("resources", resources);
		}
		else {
			LOGGER.error("ResourceNotFoundException at DatasetController.handleResource()");
			throw new ResourceNotFoundException();
		}
		// Set common stuff
		ControllerHelper.setDatasetVariables(request, "dataset", null, appConfig, modelRoot);

		return new ModelAndView("dataset", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}
}