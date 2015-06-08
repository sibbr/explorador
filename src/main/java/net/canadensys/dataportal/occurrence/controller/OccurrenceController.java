package net.canadensys.dataportal.occurrence.controller;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.canadensys.dataportal.occurrence.OccurrenceService;
import net.canadensys.dataportal.occurrence.config.OccurrencePortalConfig;
import net.canadensys.dataportal.occurrence.model.ContactModel;
import net.canadensys.dataportal.occurrence.model.DwcaResourceModel;
import net.canadensys.dataportal.occurrence.model.OccurrenceModel;
import net.canadensys.dataportal.occurrence.model.OccurrenceViewModel;
import net.canadensys.dataportal.occurrence.model.ResourceMetadataModel;
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
import br.gov.sibbr.json.response.namecheck.NameCheckResponse;

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

	// Occurrence view tags
	private static final String VIEW_PARAM = "view";
	private static final String ORIGINAL_VIEW = "original";
	private static final String NAME_VIEW = "name";
	private static final String BHL_VIEW = "bhl";
	private static final String EOL_VIEW = "eol";
	private static final String NAME_VALIDATION_VIEW = "nvv";
	private static final String CONTACT_VIEW = "contact";

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
		DwcaResourceModel resource = occurrenceService.loadResourceModel(occModel.getSourcefileid());
		ResourceMetadataModel resourceInformation = occurrenceService.loadResourceMetadataModel(resource.getGbif_package_id());
		// Load resource contact data:
		Set<ContactModel> contacts = resourceInformation.getContacts();
		ContactModel contact = null;
		if (contacts != null) {
			for (ContactModel rcm : contacts) {
				if (rcm.getRole().equalsIgnoreCase("contact")) {
					contact = rcm;
					break;
				}
			}
		}
		// Get current time to display in citation:
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		Date date = new Date(System.currentTimeMillis());
		if (!occModel.equals(null)) {
			modelRoot.put("occModel", occModel);
			modelRoot.put("occRawModel", occModel.getRawModel());
			modelRoot.put("occViewModel", buildOccurrenceViewModel(occModel));
			modelRoot.put("resource", resource);
			modelRoot.put("information", resourceInformation);
			modelRoot.put("contact", contact);
			modelRoot.put("currentTime", sdf.format(date));
		}
		else {
			throw new ResourceNotFoundException();
		}
		// Set common stuff
		ControllerHelper.setOccurrenceVariables(request, "occurrence", auto_id, appConfig, modelRoot);

		// Load objects depending on the view and forward to the proper view:
		String view = request.getParameter(VIEW_PARAM);
		if (view != null) {
			if (view.equalsIgnoreCase(ORIGINAL_VIEW)) {
				return new ModelAndView("occurrence-original", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
			}
			else if (view.equalsIgnoreCase(NAME_VIEW)) {
				return new ModelAndView("occurrence-name", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
			}
			else if (view.equalsIgnoreCase(BHL_VIEW)) {
				// Add BHL data related to the taxon:
				if (occModel != null) {
					String scientificName = occModel.getScientificname().replace(' ', '+');
					// When register has no scientificName, use Genus:
					if (scientificName.equalsIgnoreCase(" ") || scientificName.equals(null)) {
						String genus = occModel.getGenus().replace(' ', '+');
						modelRoot.put("occBHL", new BHLResponse(genus).getResults());
					}
					// Defaults to use scientific name:
					else {
						modelRoot.put("occBHL", new BHLResponse(scientificName).getResults());
					}
				}
				return new ModelAndView("occurrence-bhl", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
			}
			else if (view.equalsIgnoreCase(EOL_VIEW)) {
				// Add BHL data related to the taxon:
				if (occModel != null) {
					String scientificName = occModel.getScientificname().replace(' ', '+');
					// When register has no scientificName, use Genus:
					if (scientificName.equalsIgnoreCase(" ") || scientificName.equals(null)) {
						String genus = occModel.getGenus().replace(' ', '+');
						modelRoot.put("occEOL", new EOLResponse(genus).getResults());
					}
					// Defaults to use scientific name:
					else {
						modelRoot.put("occEOL", new EOLResponse(scientificName).getResults());
					}
				}
				return new ModelAndView("occurrence-eol", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
			}
			else if (view.equalsIgnoreCase(NAME_VALIDATION_VIEW)) {
				// Add name validation information
				if (occModel != null) {
					modelRoot.put("occNVV", new NameCheckResponse(occModel.getDwcaid()).getNames());
				}
				return new ModelAndView("occurrence-nvv", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
			}
			else if (view.equalsIgnoreCase(CONTACT_VIEW)) {
				return new ModelAndView("occurrence-contact", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
			}
		}
		// Defaults to interpreted view
		return new ModelAndView("occurrence-interpreted", OccurrencePortalConfig.PAGE_ROOT_MODEL_KEY, modelRoot);
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
		OccurrenceModel occModel = occurrenceService.loadOccurrenceModel(auto_id, true);
		ResourceMetadataModel resourceInformationModel = occurrenceService.loadResourceMetadataModel(occModel.getSourcefileid());
		// Get resource contacts:
		Set<ContactModel> contacts = resourceInformationModel.getContacts();

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
		ContactModel contact = null;
		for (ContactModel rcm : contacts) {
			if (rcm.getRole().equalsIgnoreCase("contact")) {
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
			boolean sent = mailSender.sendMessage(mailto, subject, templateData, templateName);
			LOGGER.error("*** Email enviado para o publicador: " + sent);
		}
		// Redirect back to occurrence:

		RedirectView rv = new RedirectView(occurrenceUrl);
		rv.setStatusCode(HttpStatus.MOVED_PERMANENTLY);
		return new ModelAndView(rv);
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
		DwcaResourceModel resource = occurrenceService.loadResourceModel(occModel.getSourcefileid());
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
}