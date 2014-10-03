package net.canadensys.dataportal.occurrence.controller;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.canadensys.dataportal.occurrence.OccurrenceService;
import net.canadensys.dataportal.occurrence.config.OccurrencePortalConfig;
import net.canadensys.dataportal.occurrence.model.OccurrenceModel;
import net.canadensys.dataportal.occurrence.model.OccurrenceViewModel;
import net.canadensys.dataportal.occurrence.model.ResourceContactModel;
import net.canadensys.dataportal.occurrence.model.ResourceInformationModel;
import net.canadensys.dataportal.occurrence.model.ResourceModel;
import net.canadensys.exception.web.ResourceNotFoundException;
import net.canadensys.mail.TemplateMailSender;
import net.canadensys.web.i18n.I18nUrlBuilder;
import net.canadensys.web.i18n.annotation.I18nTranslation;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.mail.javamail.ConfigurableMimeFileTypeMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.RedirectView;

import br.gov.sibbr.json.response.bhl.BHLResponse;
import br.gov.sibbr.json.response.eol.EOLResponse;

/**
 * Controller of all occurrence related features of the occurrence portal.
 * Occurrence related excludes the search functionality. This controller must be
 * stateless.
 * 
 * @author canadensys
 * 
 */
@Controller
public class OccurrenceController {

	// get log4j handler
	private static final Logger LOGGER = Logger.getLogger(OccurrenceController.class);
	private static final ConfigurableMimeFileTypeMap MIME_TYPE_MAP = new ConfigurableMimeFileTypeMap();

	// separators
	private static final String ASSOCIATED_SEQUENCES_SEPARATOR = "|";
	private static final String ASSOCIATED_SEQUENCES_PROVIDER_SEPARATOR = ":";

	// IPT variable
	private static final String IPT_ARCHIVE_PATTERN = "/archive.do?r=";
	private static final String IPT_RESOURCE_PATTERN = "/resource.do?r=";

	@Autowired
	private OccurrenceService occurrenceService;
	
	@Autowired
	@Qualifier("occurrencePortalConfig")
	private OccurrencePortalConfig appConfig;

	@Autowired
	@Qualifier("templateMailSender")
	private TemplateMailSender mailSender;

	@RequestMapping(value = "/occurrences/{auto_id}", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "occurrence", translateFormat = "/occurrences/{}")
	public ModelAndView handleOccurrencePerResource(@PathVariable String auto_id, HttpServletRequest request) {
		OccurrenceModel occModel = occurrenceService.loadOccurrenceModel(auto_id, true);
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();
		ResourceModel resource = occurrenceService.loadResourceModel(occModel.getSourcefileid());
		ResourceInformationModel resourceInformation = occurrenceService.loadResourceInformationModel(resource.getResource_uuid());
		// Load resource contact data:
		Set<ResourceContactModel> contacts = resourceInformation.getContacts();
		ResourceContactModel contact = null;
		if (contacts != null) {
			for (ResourceContactModel rcm : contacts) {
				if (rcm.getContact_type().equalsIgnoreCase("contact")) {
					contact = rcm;
					break;
				}
			}
			if (contact == null) {
				LOGGER.error("*** NULL contact!");
			}
		}
		if (!occModel.equals(null)) {
			modelRoot.put("occModel", occModel);
			modelRoot.put("occRawModel", occModel.getRawModel());
			modelRoot.put("occViewModel", buildOccurrenceViewModel(occModel));
			modelRoot.put("information", resourceInformation);
			modelRoot.put("contact", contact);
		}
		else {
			throw new ResourceNotFoundException();
		}
		// Set common stuff
		ControllerHelper.setOccurrenceVariables(request, "occurrence", auto_id, appConfig, modelRoot);

		// Add BHL data related to the taxon:
		if (occModel != null) {
			String scientificName = occModel.getScientificname().replace(' ', '+');
			// When register has no scientificName, use Genus:
			if (scientificName.equalsIgnoreCase(" ") || scientificName.equals(null)) {
				String genus = occModel.getGenus().replace(' ', '+');
				modelRoot.put("occBHL", new BHLResponse(genus).getResults());
				modelRoot.put("occEOL", new EOLResponse(genus).getResults());
			}
			// Defaults to use scientific name:
			else {
				modelRoot.put("occBHL", new BHLResponse(scientificName).getResults());
				modelRoot.put("occEOL", new EOLResponse(scientificName).getResults());
			}
		}
		return new ModelAndView("occurrence", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}

	/**
	 * Resource contact message sending form.
	 * 
	 * @param ipt
	 *            resource identifier (sourcefileid).
	 * @return
	 */
	@RequestMapping(value = "/occurrences/{auto_id}", method = RequestMethod.POST)
	@I18nTranslation(resourceName = "occurrence", translateFormat = "/occurrences/{}")
	public ModelAndView handleResourceContactMsg(@PathVariable String auto_id, HttpServletRequest request) {
		String sourceFileId = (String) request.getSession().getAttribute("sourceFileId");
		ResourceInformationModel resourceInformationModel = occurrenceService.loadResourceInformationModel(sourceFileId);
		// Get resource contacts:
		Set<ResourceContactModel> contacts = resourceInformationModel.getContacts();

		// URL from the previous URL accessed that led to the contact form:
		Locale locale = RequestContextUtils.getLocale(request);
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();

		// Get full URL:
		String occurrenceUrl = I18nUrlBuilder.generateI18nResourcePath(locale.getLanguage(),
				OccurrencePortalConfig.I18N_TRANSLATION_HANDLER.getTranslationFormat("occurrence"), new String[] { auto_id });
		String domainName = request.getParameter("domainName");
		occurrenceUrl = domainName + request.getContextPath() + occurrenceUrl;
		// Set common stuff
		ControllerHelper.setPageHeaderVariables(request, "contact", new String[] { auto_id }, appConfig, modelRoot);

		Map<String, Object> templateData = new HashMap<String, Object>();
		ResourceContactModel contact = null;
		for (ResourceContactModel rcm : contacts) {
			if (rcm.getContact_type().equalsIgnoreCase("contact")) {
				contact = rcm;
				// Add contacts information
				modelRoot.put("contact", contact);
				break;
			}
		}

		String mailto = contact.getEmail();
		String nameto = contact.getName();

		if (mailto != null && !mailto.equalsIgnoreCase("")) {
			String namefrom = request.getParameter("name");
			String mailfrom = request.getParameter("email");
			String message = request.getParameter("message");
			// Later change to fetch from properties file
			// (resourcecontact.subject).
			String subject = request.getParameter("subject");
			templateData.put("subject", subject);
			templateData.put("mailto", mailto);
			templateData.put("nameto", nameto);
			templateData.put("mailfrom", mailfrom);
			templateData.put("namefrom", namefrom);
			templateData.put("message", message);
			templateData.put("occurrenceUrl", occurrenceUrl);
			templateData.put("time", new SimpleDateFormat("EEEE, dd-MM-yyyy HH:mm z", locale).format(new Date()));
			String templateName = appConfig.getContactEmailTemplateName(locale);
			mailSender.sendMessage(mailto, subject, templateData, templateName);
		}
		// Redirect back to occurrence:

		RedirectView rv = new RedirectView(occurrenceUrl);
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return new ModelAndView(rv);
	}

	/**
	 * Redirect this URL to a search on an IPT resource. We support this to have
	 * a clean URL to an IPT resource.
	 * 
	 * @param iptResource
	 * @return
	 */
	@RequestMapping(value = "/resources/{iptResource}", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "resource", translateFormat = "/resources/{}")
	public ModelAndView handleIptResource(@PathVariable String iptResource, HttpServletRequest request) {
		if (!occurrenceService.resourceExists(iptResource)) {
			throw new ResourceNotFoundException();
		}
		Locale locale = RequestContextUtils.getLocale(request);
		String searchUrl = I18nUrlBuilder.generateI18nResourcePath(locale.getLanguage(),
				OccurrencePortalConfig.I18N_TRANSLATION_HANDLER.getTranslationFormat("search"), (String) null);
		RedirectView rv = new RedirectView(request.getContextPath() + searchUrl + "?iptresource=" + iptResource);
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		ModelAndView mv = new ModelAndView(rv);
		return mv;
	}

	/**
	 * Build and fill A OccurrenceViewModel based on a OccurrenceModel.
	 * 
	 * @param occModel
	 * @return OccurrenceViewModel instance, never null
	 */
	public OccurrenceViewModel buildOccurrenceViewModel(OccurrenceModel occModel) {
		OccurrenceViewModel occViewModel = new OccurrenceViewModel();

		// handle media
		if (StringUtils.isNotEmpty(occModel.getAssociatedmedia())) {
			// assumes that data are coming from harvester
			String[] media = occModel.getAssociatedmedia().split("; ");
			for (String currentMedia : media) {
				if (MIME_TYPE_MAP.getContentType(currentMedia).startsWith("image")) {
					occViewModel.addImage(currentMedia);
				}
				else {
					occViewModel.addOtherMedia(currentMedia);
				}
			}
		}

		// handle associated sequences
		if (StringUtils.isNotEmpty(occModel.getAssociatedsequences())) {
			String[] sequences = StringUtils.split(occModel.getAssociatedsequences(), ASSOCIATED_SEQUENCES_SEPARATOR);

			String seqProvider, seqId, seqProviderUrlFormat;
			for (String currentSequence : sequences) {
				seqProvider = StringUtils.substringBefore(currentSequence, ASSOCIATED_SEQUENCES_PROVIDER_SEPARATOR).trim().toLowerCase();
				seqId = StringUtils.substringAfter(currentSequence, ASSOCIATED_SEQUENCES_PROVIDER_SEPARATOR).trim();
				seqProviderUrlFormat = appConfig.getSequenceProviderUrlFormat(seqProvider);

				// set display name if defined, otherwise keep extracted name
				if (appConfig.getSequenceProviderDisplayName(seqProvider) != null) {
					seqProvider = appConfig.getSequenceProviderDisplayName(seqProvider);
				}

				if (seqProvider != null && seqId != null) {
					if (StringUtils.isBlank(seqProviderUrlFormat)) {
						occViewModel.addAssociatedSequenceLink(seqProvider, seqId, "");
					}
					else {
						occViewModel.addAssociatedSequenceLink(seqProvider, seqId, MessageFormat.format(seqProviderUrlFormat, seqId));
					}
				}
				else {
					LOGGER.warn("associatedSequences [" + occModel.getAssociatedsequences() + "] cannot be parsed.");
				}
			}
		}

		// handle data source page URL (url to the resource page)
		ResourceModel resource = occurrenceService.loadResourceModel(occModel.getSourcefileid());
		if (resource != null) {
			if (StringUtils.contains(resource.getArchive_url(), IPT_ARCHIVE_PATTERN)) {
				occViewModel.setDataSourcePageURL(StringUtils.replace(resource.getArchive_url(), IPT_ARCHIVE_PATTERN, IPT_RESOURCE_PATTERN));
			}
			// Add data source name to view:
			occViewModel.setDataSourceName(resource.getName());
		}
		return occViewModel;
	}

	/**
	 * Feedback page with form to receive comments
	 * 
	 * @param
	 * @return
	 */
	@RequestMapping(value = "/feedback", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "feedback", translateFormat = "/feedback")
	public ModelAndView handleFeedback(HttpServletRequest request) {
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();
		String previousURL = (String) request.getAttribute("previousURL");
		modelRoot.put("previousURL", previousURL);
		request.setAttribute("previousURL", request.getRequestURL());
		ControllerHelper.setPageHeaderVariables(request, "feedback", new String[] {}, appConfig, modelRoot);
		return new ModelAndView("feedback", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
	}

	/**
	 * Resource contact message feedback sending form.
	 * 
	 * @param ipt
	 *            resource identifier (sourcefileid).
	 * @return
	 */
	@RequestMapping(value = "/feedback", method = RequestMethod.POST)
	@I18nTranslation(resourceName = "feedback", translateFormat = "/feedback")
	public ModelAndView handleFeedbackMsg(HttpServletRequest request) {
		// URL from the previous URL accessed that led to the contact form:
		Locale locale = RequestContextUtils.getLocale(request);
		HashMap<String, Object> modelRoot = new HashMap<String, Object>();

		// Set common stuff
		ControllerHelper.setPageHeaderVariables(request, "feedback", new String[] {}, appConfig, modelRoot);

		Map<String, Object> templateData = new HashMap<String, Object>();

		String namefrom = request.getParameter("name");
		String mailfrom = request.getParameter("email");
		String message = request.getParameter("message");
		String subject = request.getParameter("subject");
		String mailto = request.getParameter("mailto");
		LOGGER.error("*** " + subject);
		templateData.put("mailfrom", mailfrom);
		templateData.put("namefrom", namefrom);
		templateData.put("message", message);
		templateData.put("time", new SimpleDateFormat("EEEE, dd-MM-yyyy HH:mm z", locale).format(new Date()));
		String templateName = appConfig.getContactEmailTemplateName(locale);
		mailSender.sendMessage(mailto, subject, templateData, templateName);

		// Redirect back to main page
		RedirectView rv = new RedirectView(request.getContextPath());
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return new ModelAndView(rv);
	}
	
	/**
	 * Display a list with pagination of all current available resources.
	 * 
	 */
	@RequestMapping(value = "/datasets}", method = RequestMethod.GET)
	@I18nTranslation(resourceName = "datasets", translateFormat = "/datasets")
	public ModelAndView handleResources(HttpServletRequest request) {
		System.out.println("Entered here!");
		LOGGER.error("*** Entered handleResources <3!");
		/**
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
		*/
		return null;
	}
}