package br.gov.sibbr.json.response.model;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import br.gov.sibbr.util.JSONProcessor;

/**
 * Controller for modelling a JSON "Results" object to the BHL API response adding corresponding pages.
 * 
 * @author Pedro GUimarães
 * 
 */
public class BHLResultsElement {

	// Useful data form JSON response:
	private String NameBankID;
	private String NameConfirmed;
	private String EOLID;
	private String Titles;
	// List of related pages to the given nameBankId:
	private List<BHLPage> bhlPages;

	/**
	 * Constructor to build the object with the given parameters and load related pages
	 * @param nameBankID
	 * @param nameConfirmed
	 * @param EOLID
	 * @param Titles
	 */
	public BHLResultsElement(String nameBankID, String nameConfirmed,
			String EOLID, String Titles) {
		setBhlPages(new ArrayList<BHLPage>());
		setNameBankID(nameBankID);
		setNameConfirmed(nameConfirmed);
		setEOLID(EOLID);
		setTitles(Titles);
		// Fetch pages data about references to a given nameBankID:
		loadPages();
	}

	/**
	 * Load all related pages data by making a secondary call to the BHL API and filling the pages list to the given object's nameBankId
	 */
	public void loadPages() {
		String nameBankId = getNameBankID();
		if (!nameBankId.equalsIgnoreCase("") && !nameBankId.equals(null)) {
			JSONObject json = JSONProcessor.fetchBHLPages(getNameBankID());
			JSONObject result = new JSONObject();
			JSONArray titles, items, pages;
			String shortTitle = "";
			String publisherName = "";
			String publicationDate = "";
			String pageId = "";
			try {
				result = (JSONObject) json.get("Result");
				titles = result.getJSONArray("Titles");
				// Set titles data loop:
				for (int i = 0; i < titles.length(); i++) {
					JSONObject element = (JSONObject) titles.get(i);
					if (!element.isNull("ShortTitle"))
						shortTitle = (String) element.get("ShortTitle");

					if (!element.isNull("PublisherName"))
						publisherName = (String) element.get("PublisherName");

					if (!element.isNull("PublicationDate"))
						publicationDate = (String) element
								.get("PublicationDate");

					// Set items data loop for titles:
					if (!element.isNull("Items")) {
						items = element.getJSONArray("Items");
						for (int j = 0; j < items.length(); j++) {
							JSONObject item = items.getJSONObject(j);
							pages = item.getJSONArray("Pages");
							// Set pages data loop for items:
							for (int k = 0; k < pages.length(); k++) {
								JSONObject page = pages.getJSONObject(k);
								if (!page.isNull("PageID")) {
									pageId = page.get("PageID").toString();
									// Add BHLPage to BHLResultsElement
									// (BankNameId)
									getBhlPages().add(
											new BHLPage(pageId, shortTitle,
													publisherName,
													publicationDate));
								}
							}
						}
					}
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Getters and setters for class objects:
	 * @return
	 */
	public String getNameBankID() {
		return NameBankID;
	}

	public void setNameBankID(String nameBankID) {
		NameBankID = nameBankID;
	}

	public String getNameConfirmed() {
		return NameConfirmed;
	}

	public void setNameConfirmed(String nameConfirmed) {
		NameConfirmed = nameConfirmed;
	}

	public String getEOLID() {
		return EOLID;
	}

	public void setEOLID(String eOLID) {
		EOLID = eOLID;
	}

	public String getTitles() {
		return Titles;
	}

	public void setTitles(String titles) {
		Titles = titles;
	}

	public List<BHLPage> getBhlPages() {
		return bhlPages;
	}

	public void setBhlPages(List<BHLPage> bhlPages) {
		this.bhlPages = bhlPages;
	}

	/**
	 * Default toString() method:
	 */
	public String toString() {
		String output = "";
		output += " NameBankID: " + getNameBankID();
		output += " NameConfirmed: " + getNameConfirmed();
		output += " EOLID: " + getEOLID();
		output += " Titles: " + getTitles();
		for (BHLPage p : getBhlPages()) {
			output += "\n *** PageID: " + p.getPageId();
			output += "\n *** ShortTitle: " + p.getShortTitle();
			output += "\n *** PublisherName: " + p.getPublisherName();
			output += "\n *** PublicationDate: " + p.getPublicationDate();
		}
		output += "\n";
		return output;
	}
}//EOF