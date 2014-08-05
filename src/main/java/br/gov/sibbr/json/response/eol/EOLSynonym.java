package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * POJO for EOL Synonyms
 * 
 * @author pedro
 * 
 */
public class EOLSynonym {

	private String synonym;
	private String relationship;

	public EOLSynonym(String synonym, String relationship) {
		setSynonym(synonym);
		setRelationship(relationship);
	}

	public static ArrayList<EOLSynonym> processJSON(JSONArray json) {
		ArrayList<EOLSynonym> synonyms = new ArrayList<EOLSynonym>();
		try {
			for (int i  = 0 ; i< json.length() ; i++) {
				JSONObject item = (JSONObject) json.get(i);
				
				String synonym = ""; 
				if (!item.isNull("synonym"))
					synonym = (String) item.get("synonym");
				String relationship = ""; 
				if (!item.isNull("relationship"))
					relationship = (String) item.get("relationship");
				synonyms.add(new EOLSynonym(synonym, relationship));
			}
		} catch(JSONException e) {
			e.printStackTrace();
		}
		return synonyms;
	}

	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "\n";
		output += " synonym: " + getSynonym();
		output += " relationship: " + getRelationship();
		return output;
	}
	
	public String getSynonym() {
		return synonym;
	}

	public void setSynonym(String synonym) {
		this.synonym = synonym;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
}
