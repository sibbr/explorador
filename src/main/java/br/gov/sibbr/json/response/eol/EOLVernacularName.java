package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * POJO for EoL vernacular names information
 * 
 * @author pedro
 * 
 */
public class EOLVernacularName {

	private String vernacularName;
	private String language;

	/**
	 * Class base constructor
	 * 
	 * @param vernacularName
	 * @param language
	 */
	public EOLVernacularName(String vernacularName, String language) {
		setVernacularName(vernacularName);
		setLanguage(language);
	}

	/**
	 * Process JSON array of vernacular names
	 * 
	 * @param json
	 * @return
	 */
	public static ArrayList<EOLVernacularName> processJSON(JSONArray json) {
		ArrayList<EOLVernacularName> vernacularNames = new ArrayList<EOLVernacularName>();
		try {
			for (int i = 0; i < json.length(); i++) {
				JSONObject item = (JSONObject) json.get(i);

				String vernacularName = "";
				if (!item.isNull("vernacularName"))
					vernacularName = (String) item.get("vernacularName");
				String language = "";
				if (!item.isNull("language"))
					language = (String) item.get("language");
				vernacularNames.add(new EOLVernacularName(vernacularName, language));
			}
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
		return vernacularNames;
	}

	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "";
		output += " vernacularName: " + getVernacularName();
		output += " language: " + getLanguage();
		return output;
	}

	/**
	 * @return the vernacularName
	 */
	public String getVernacularName() {
		return vernacularName;
	}

	/**
	 * @param vernacularName
	 *            the vernacularName to set
	 */
	public void setVernacularName(String vernacularName) {
		this.vernacularName = vernacularName;
	}

	/**
	 * @return the language
	 */
	public String getLanguage() {
		return language;
	}

	/**
	 * @param language
	 *            the language to set
	 */
	public void setLanguage(String language) {
		this.language = language;
	}
}
