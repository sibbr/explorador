package br.gov.sibbr.json.response.model;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import br.gov.sibbr.util.JSONProcessor;

/**
 * Controller for JSON responses to the BHL API
 * 
 * @author Pedro Guimarães
 * 
 */
public class BHLResponse {

	// List of results returned by initial query (fetch data from taxon name)
	private List<BHLResultsElement> results;

	/**
	 * Constructor starts process given a Scientific Name, calling parseBHLJSONForTaxa. Obs.: Has to be "Species+Infraspecific" [without space " " characters]
	 * @param scientificName
	 */
	public BHLResponse(String scientificName) {
		// Initialize results array list:
		setResults(new ArrayList<BHLResultsElement>());

		// Fetch json from API given a taxon name:
		JSONObject json = JSONProcessor.fetchBHLFromTaxa(scientificName);

		parseBHLJSONForTaxa(json);
	}

	/**
	 * Process JSON data filling POJO objects for the result items
	 * @param json
	 */
	private void parseBHLJSONForTaxa(JSONObject json) {
		JSONArray results;
		try {
			results = (JSONArray) json.get("Result");
			for (int i = 0; i < results.length(); i++) {
				JSONObject element = (JSONObject) results.get(i);

				String nameBankId = "";
				if (!element.isNull("NameBankID"))
					nameBankId = (String) element.get("NameBankID");

				String nameConfirmed = "";
				if (!element.isNull("NameConfirmed"))
					nameConfirmed = (String) element.get("NameConfirmed");

				String eolid = "";
				if (!element.isNull("EOLID"))
					eolid = (String) element.get("EOLID");

				String titles = "";
				if (!element.isNull("Titles"))
					titles = (String) element.get("Titles");

				getResults().add(
						new BHLResultsElement(nameBankId, nameConfirmed, eolid,
								titles));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Return results object
	 * @return
	 */
	public List<BHLResultsElement> getResults() {
		return results;
	}

	/**
	 * Set results object
	 * @param results
	 */
	public void setResults(List<BHLResultsElement> results) {
		this.results = results;
	}

	/**
	 * Default toString()
	 */
	public String toString() {
		String results = "";
		for (BHLResultsElement element : getResults()) {
			results += element.toString() + "\n";
		}
		return results;
	}
} //EOF