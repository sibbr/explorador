package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import br.gov.sibbr.util.JSONProcessor;

/**
 * Controller for JSON responses to the EOL API
 * 
 * @author Pedro Guimarães
 * 
 */
public class EOLResponse {

	// List of results returned by initial query (fetch data from taxon name)
	private List<EOLResultsElement> results;

	/**
	 * Constructor starts process given a Scientific Name, calling
	 * parseEOLJSONForTaxa. Obs.: Has to be "Species+Infraspecific" [without
	 * space " " characters]
	 * 
	 * @param scientificName
	 */
	public EOLResponse(String scientificName) {
		// Initialize results array list:
		setResults(new ArrayList<EOLResultsElement>());
		// Fetch json from API given a taxon name:
		JSONObject json = JSONProcessor.fetchEOLFromTaxa(scientificName);
		// Process data for pages:
		parseEOLJSONForTaxa(json);
	}

	/**
	 * Process JSON data filling POJO objects for the result items
	 * 
	 * @param json
	 */
	private void parseEOLJSONForTaxa(JSONObject json) {
		JSONArray results;
		try {
			results = (JSONArray) json.get("results");
			// Implemented to one exact match, can be easily extended to more
			// results by changing the API query paramenter exact to "false":
			for (int i = 0; i < results.length(); i++) {
				JSONObject element = (JSONObject) results.get(i);
				String id = "";
				if (!element.isNull("id"))
					id = element.get("id").toString();

				String title = "";
				if (!element.isNull("title"))
					title = (String) element.get("title");

				String link = "";
				if (!element.isNull("link"))
					link = (String) element.get("link");

				getResults().add(
				// Calls the methods to fetch data and fill with info from
				// results:
						new EOLResultsElement(id, title, link));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Return results object
	 * 
	 * @return
	 */
	public List<EOLResultsElement> getResults() {
		return results;
	}

	/**
	 * Set results object
	 * 
	 * @param results
	 */
	public void setResults(List<EOLResultsElement> results) {
		this.results = results;
	}

	/**
	 * Default toString()
	 */
	public String toString() {
		String results = "";
		for (EOLResultsElement element : getResults()) {
			results += element.toString() + "\n";
		}
		return results;
	}
} // EOF