package net.canadensys.dataportal.occurrence.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import net.canadensys.dataportal.occurrence.OccurrenceService;
import net.canadensys.dataportal.occurrence.config.OccurrencePortalConfig;
import net.canadensys.dataportal.occurrence.model.OccurrenceModel;
import net.canadensys.exception.web.ResourceNotFoundException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

/**
 * Controller of all occurrence related features of the occurrence portal.
 * Occurrence related excludes the search functionality.
 * This controller must be stateless.
 * @author canadensys
 *
 */
@Controller
public class OccurrenceController {
	
	//get log4j handler
	private static final Logger LOGGER = Logger.getLogger(OccurrenceController.class);
	
	private static String VIEW_PARAM = "view";
	private static String DWC_VIEW_NAME = "dwc";
	
	@Autowired
	private OccurrenceService occurrenceService;
	
	@Autowired
	@Qualifier("occurrencePortalConfig")
	private OccurrencePortalConfig appConfig;
	
	/**
	 * Redirect this URL to a search on search on this dataset.
	 * We support this to have a clean URL to the dataset
	 * @param dataset
	 * @return
	 */
	@RequestMapping(value="/d/{dataset}", method=RequestMethod.GET)
	public ModelAndView handleDataset(@PathVariable String dataset){

		if(!occurrenceService.datasetExists(dataset)){
			throw new ResourceNotFoundException();
		}
		
		RedirectView rv = new RedirectView(appConfig.getRootURL()+"search?dataset="+dataset);
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		ModelAndView mv = new ModelAndView(rv);
		return mv;
	}
	
	/**
	 * Occurrence page
	 * @param dataset
	 * @param occurrenceId
	 * @param request needs to get some parameters and Locale
	 * @return
	 */
	@RequestMapping(value="/d/{dataset}/{occurrenceId}", method=RequestMethod.GET)
	public ModelAndView handleOccurrence(@PathVariable String dataset,@PathVariable String occurrenceId, HttpServletRequest request){
		OccurrenceModel occModel = occurrenceService.loadOccurrenceModel(dataset,occurrenceId,true);
		HashMap<String,Object> modelRoot = new HashMap<String,Object>();
		
		if(occModel != null){
			modelRoot.put("occModel", occModel);
			modelRoot.put("occRawModel",occModel.getRawModel());
		}
		else{
			throw new ResourceNotFoundException();
		}

		Locale locale = RequestContextUtils.getLocale(request);
		//Set common stuff (GoogleAnalytics, language, ...)
		ControllerHelper.setPageHeaderVariables(request, locale, appConfig, modelRoot);
		
		//handle view stuff
		String view = request.getParameter(VIEW_PARAM);
		if(DWC_VIEW_NAME.equalsIgnoreCase(view)){
			return new ModelAndView("occurrence-dwc","root",modelRoot);
		}
		return new ModelAndView("occurrence","root",modelRoot);
	}
}
