package net.canadensys.dataportal.resource.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.canadensys.dataportal.occurrence.config.OccurrencePortalConfig;
import net.canadensys.dataportal.occurrence.controller.ControllerHelper;
import net.canadensys.dataportal.occurrence.model.ResourceModel;
import net.canadensys.dataportal.resource.service.ResourceService;
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
	@Qualifier("occurrencePortalConfig")
	private OccurrencePortalConfig appConfig;

	@RequestMapping(value = "/resources", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "resources", translateFormat = "/resources")
	public ModelAndView handleResources(HttpServletRequest request) {
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();
		List<ResourceModel> resources = resourceService.loadResources();
		if (!resources.equals(null)) {
			modelRoot.put("resources", resources);
		}
		else {
			throw new ResourceNotFoundException();
		}
		// Set common stuff
		ControllerHelper.setOccurrenceVariables(request, "resources", null, appConfig, modelRoot);

		return new ModelAndView("resources", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}
}