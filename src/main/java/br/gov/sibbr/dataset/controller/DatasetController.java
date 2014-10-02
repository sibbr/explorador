package br.gov.sibbr.dataset.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.canadensys.dataportal.occurrence.config.OccurrencePortalConfig;
import net.canadensys.dataportal.occurrence.controller.ControllerHelper;
import net.canadensys.dataportal.occurrence.model.ResourceInformationModel;
import net.canadensys.dataportal.occurrence.model.ResourceModel;
import net.canadensys.exception.web.ResourceNotFoundException;
import net.canadensys.mail.TemplateMailSender;
import net.canadensys.web.i18n.annotation.I18nTranslation;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.gov.sibbr.dataset.service.DatasetService;

/**
 * Controller of all dataset related features of the occurrence portal.
 * 
 * @author Pedro Guimarães
 * 
 */
@Controller
public class DatasetController {

	// get log4j handler
	private static final Logger LOGGER = Logger.getLogger(DatasetController.class);

	@Autowired
	private DatasetService datasetService;

	@Autowired
	@Qualifier("datasetPortalConfig")
	private OccurrencePortalConfig appConfig;

	@Autowired
	@Qualifier("templateMailSender")
	private TemplateMailSender mailSender;

	/**
	 * Display a list with pagination of all current available resources.
	 * 
	 */
	@RequestMapping(value = "/datasets}", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "dataset", translateFormat = "/datasets")
	public ModelAndView handleResources(HttpServletRequest request) {
		LOGGER.error("*** Entered handleResources <3!");
		List<ResourceModel> resources = datasetService.loadResources();
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
	
	/**
	 * Display the page with informations regarding the dataset.
	 * @param auto_id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/datasets/{auto_id}", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "dataset", translateFormat = "/datasets/{}")
	public ModelAndView handleResource(@PathVariable String auto_id, HttpServletRequest request) {
		ResourceModel resourceModel = datasetService.loadResource(auto_id);
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();
		ResourceInformationModel resourceInformation = datasetService.loadResourceInformationModel(resourceModel.getResource_uuid());

		if (!resourceModel.equals(null)) {
			modelRoot.put("resourceModel", resourceModel);
			modelRoot.put("resourceInformation", resourceInformation);
		}
		else {
			LOGGER.error("ResourceNotFoundException at DatasetController.handleResource()");
			throw new ResourceNotFoundException();
		}
		// Set common stuff
		ControllerHelper.setOccurrenceVariables(request, "dataset", auto_id, appConfig, modelRoot);

		return new ModelAndView("dataset", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}
}