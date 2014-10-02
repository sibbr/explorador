package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import br.gov.sibbr.util.JSONProcessor;

/**
 * Controller for modelling a JSON "Results" object to the EOL API response
 * adding corresponding pages.
 * 
 * @author Pedro GUimarães
 * 
 */
public class EOLResultsElement {

	// Useful data form JSON response:
	private String id;
	private String title;
	private String link;

	// List of related pages to the given nameBankId:
	private List<EOLPage> pages;

	/**
	 * Constructor to build the object with the given parameters and load
	 * related pages
	 * 
	 * @param id
	 * @param titles
	 * @param link
	 * @param Titles
	 */
	public EOLResultsElement(String id, String title, String link) {
		setPages(new ArrayList<EOLPage>());
		setId(id);
		setTitle(title);
		setLink(link);
		// Fetch pages data about references to a given id:
		loadPages();
	}

	/**
	 * Load all related pages data by making a secondary call to the EOL API and
	 * filling the pages list to the given object's nameBankId
	 */
	public void loadPages() {
		try {
			if (!id.equalsIgnoreCase("") && !id.equals(null)) {
				// Fetch pages JSON result for given id:
				JSONObject json = JSONProcessor.fetchEOLPages(getId());
				// Fetch richness_score:
				String richnessScore = (String) json.get("richness_score").toString();
				// Fetch and process synonyms:
				ArrayList<EOLSynonym> synonyms = EOLSynonym.processJSON(((JSONArray) json.get("synonyms")));
				// Fetch and process vernacular names:
				ArrayList<EOLVernacularName> vernacularNames = EOLVernacularName.processJSON((JSONArray) json.get("vernacularNames"));
				// Fetch and process synonyms:
				ArrayList<EOLTaxonConcept> taxonConcepts = EOLTaxonConcept.processJSON((JSONArray) json.get("taxonConcepts"));
				/** Process Data Objects according to data type: **/
				// Fetch and process images:
				JSONArray dataObjects = (JSONArray) json.get("dataObjects");
				ArrayList<EOLImage> images = EOLImage.processJSON(dataObjects);
				ArrayList<EOLText> texts = EOLText.processJSON(dataObjects);
				ArrayList<EOLAudio> audio = EOLAudio.processJSON(dataObjects);

				// Add new EOLPage to the object page list:
				getPages().add(new EOLPage(id, richnessScore, synonyms, vernacularNames, taxonConcepts, images, texts, audio));
			}
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Default toString() method:
	 */
	public String toString() {
		String output = "";
		output += " id: " + getId();
		output += " title: " + getTitle();
		output += " link: " + getLink();
		output += " \n Pages: ";
		for (EOLPage p : getPages()) {
			output += p.toString();
		}
		output += "\n";
		return output;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the link
	 */
	public String getLink() {
		return link;
	}

	/**
	 * @param link
	 *            the link to set
	 */
	public void setLink(String link) {
		this.link = link;
	}

	/**
	 * @return the eOLPages
	 */
	public List<EOLPage> getPages() {
		return pages;
	}

	/**
	 * @param eOLPages
	 *            the eOLPages to set
	 */
	public void setPages(List<EOLPage> pages) {
		this.pages = pages;
	}
}// EOF