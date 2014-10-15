package net.canadensys.dataportal.resource.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.canadensys.dataportal.occurrence.OccurrenceService;
import net.canadensys.dataportal.occurrence.config.OccurrencePortalConfig;
import net.canadensys.dataportal.occurrence.controller.ControllerHelper;
import net.canadensys.dataportal.occurrence.model.ResourceInformationModel;
import net.canadensys.dataportal.occurrence.model.ResourceModel;
import net.canadensys.dataportal.resource.service.ResourceService;
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
 * Controller of all resource related features of the explorer.
 * 
 * @author Pedro Guimarães
 * 
 */
@Controller
public class ResourceController {

	// get log4j handler
	private static final Logger LOGGER = Logger.getLogger(ResourceController.class);

	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private OccurrenceService occurrenceService;

	@Autowired
	@Qualifier("occurrencePortalConfig")
	private OccurrencePortalConfig appConfig;

	/**
	 * Display a list with pagination of all current available resources.
	 * 
	 */
	@RequestMapping(value = "/resources", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "resources", translateFormat = "/resources")
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
		ControllerHelper.setDatasetVariables(request, "resources", null, appConfig, modelRoot);

		return new ModelAndView("resources", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}
	
	/**
	 * Display a page with information about the current resource given its auto_id value.
	 * 
	 */
	@RequestMapping(value = "/resource/{auto_id}", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "resource", translateFormat = "/resource/{}")
	public ModelAndView handleResource(@PathVariable String auto_id, HttpServletRequest request) {
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();
		ResourceModel resource = occurrenceService.loadResourceModelByAutoId(auto_id);
		ResourceInformationModel information = occurrenceService.loadResourceInformationModel(resource.getResource_uuid());
		// Get current time to display in citation:
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		Date date = new Date(System.currentTimeMillis());
		if (!resource.equals(null) && !information.equals(null)) {
			modelRoot.put("resource", resource);
			modelRoot.put("information", information);
			modelRoot.put("currentTime", sdf.format(date)); 
		}
		else {
			LOGGER.error("ResourceNotFoundException at ResourceController.handleResource()");
			throw new ResourceNotFoundException();
		}
		// Set common stuff
		ControllerHelper.setDatasetVariables(request, "resource", auto_id, appConfig, modelRoot);

		return new ModelAndView("resource", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}
}