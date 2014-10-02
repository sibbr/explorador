package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * POJO for EOL Vernacular Names
 * 
 * @author pedro
 * 
 */
public class EOLTaxonConcept {

	private String identifier;
	private String scientificName;
	private String accordingTo;
	private String canonicalForm;
	private String taxonRank;

	public EOLTaxonConcept(String identifier, String scientificName, String accordingTo, String canonicalForm, String taxonRank) {
		setIdentifier(identifier);
		setScientificName(scientificName);
		setAccordingTo(accordingTo);
		setCanonicalForm(canonicalForm);
		setTaxonRank(taxonRank);
	}

	public static ArrayList<EOLTaxonConcept> processJSON(JSONArray json) {
		ArrayList<EOLTaxonConcept> taxonConcepts = new ArrayList<EOLTaxonConcept>();
		try {
			for (int i = 0; i < json.length(); i++) {
				JSONObject item = (JSONObject) json.get(i);

				String identifier = "";
				if (!item.isNull("identifier"))
					identifier = (String) item.get("identifier").toString();

				String scientificName = "";
				if (!item.isNull("scientificName"))
					scientificName = (String) item.get("scientificName");

				String accordingTo = "";
				if (!item.isNull("nameAccordingTo"))
					accordingTo = (String) item.get("nameAccordingTo");

				String canonicalForm = "";
				if (!item.isNull("canonicalForm"))
					canonicalForm = (String) item.get("canonicalForm");

				String taxonRank = "";
				if (!item.isNull("taxonRank"))
					taxonRank = (String) item.get("taxonRank");

				taxonConcepts.add(new EOLTaxonConcept(identifier, scientificName, accordingTo, canonicalForm, taxonRank));
			}
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
		return taxonConcepts;
	}

	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "";
		output += " identifier: " + getIdentifier();
		output += " scientific name: " + getScientificName();
		output += " according to: " + getAccordingTo();
		output += " canonical form: " + getCanonicalForm();
		output += " taxonRank: " + getTaxonRank();
		return output;
	}

	/**
	 * @return the identifier
	 */
	public String getIdentifier() {
		return identifier;
	}

	/**
	 * @param identifier
	 *            the identifier to set
	 */
	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}

	/**
	 * @return the scientificName
	 */
	public String getScientificName() {
		return scientificName;
	}

	/**
	 * @param scientificName
	 *            the scientificName to set
	 */
	public void setScientificName(String scientificName) {
		this.scientificName = scientificName;
	}

	/**
	 * @return the accordingTo
	 */
	public String getCanonicalForm() {
		return canonicalForm;
	}

	/**
	 * @param accordingTo
	 *            the accordingTo to set
	 */
	public void setCanonicalForm(String canonicalForm) {
		this.canonicalForm = canonicalForm;
	}

	/**
	 * @return the accordingTo
	 */
	public String getAccordingTo() {
		return accordingTo;
	}

	/**
	 * @param accordingTo
	 *            the accordingTo to set
	 */
	public void setAccordingTo(String accordingTo) {
		this.accordingTo = accordingTo;
	}

	/**
	 * @return the taxonRank
	 */
	public String getTaxonRank() {
		return taxonRank;
	}

	/**
	 * @param taxonRank
	 *            the taxonRank to set
	 */
	public void setTaxonRank(String taxonRank) {
		this.taxonRank = taxonRank;
	}
}
