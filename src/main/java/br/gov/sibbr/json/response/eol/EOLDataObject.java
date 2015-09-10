package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

/**
 * POJO for EOL Data Object
 * 
 * @author pedro
 * 
 */
public class EOLDataObject {

	private String identifier;
	private String dataObjectVersionID;
	private String dataType;
	private String vettedStatus;
	private String dataRating;
	private String mimeType;
	private String title;
	private String language;
	private String license;
	private String rights;
	private String rightsHolder;
	private String source;
	private String description;
	private List<EOLAgent> agents = new ArrayList<EOLAgent>();

	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "\n";
		output += " identifier: " + getIdentifier();
		output += " dataObjectVersionID: " + getDataObjectVersionID();
		output += " dataType: " + getDataType();
		output += " vettedStatus " + getVettedStatus();
		output += " dataRating: " + getDataRating();
		output += " mimeType: " + getMimeType();
		output += " title: " + getTitle();
		output += " language: " + getLanguage();
		output += " license: " + getLicense();
		output += " rights: " + getRights();
		output += " rightsHolder: " + getRightsHolder();
		output += " source: " + getSource();
		output += " description: " + getDescription();
		output += "\n Agents:";
		for (EOLAgent a : getAgents())
			output += a.toString();
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
	 * @return the dataObjectVersionID
	 */
	public String getDataObjectVersionID() {
		return dataObjectVersionID;
	}

	/**
	 * @param dataObjectVersionID
	 *            the dataObjectVersionID to set
	 */
	public void setDataObjectVersionID(String dataObjectVersionID) {
		this.dataObjectVersionID = dataObjectVersionID;
	}

	/**
	 * @return the dataType
	 */
	public String getDataType() {
		return dataType;
	}

	/**
	 * @param dataType
	 *            the dataType to set
	 */
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	/**
	 * @return the vettedStatus
	 */
	public String getVettedStatus() {
		return vettedStatus;
	}

	/**
	 * @param vettedStatus
	 *            the vettedStatus to set
	 */
	public void setVettedStatus(String vettedStatus) {
		this.vettedStatus = vettedStatus;
	}

	/**
	 * @return the dataRating
	 */
	public String getDataRating() {
		return dataRating;
	}

	/**
	 * @param dataRating
	 *            the dataRating to set
	 */
	public void setDataRating(String dataRating) {
		this.dataRating = dataRating;
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

	/**
	 * @return the license
	 */
	public String getLicense() {
		return license;
	}

	/**
	 * @param license
	 *            the license to set
	 */
	public void setLicense(String license) {
		this.license = license;
	}

	/**
	 * @return the rightsHolder
	 */
	public String getRightsHolder() {
		return rightsHolder;
	}

	/**
	 * @param rightsHolder
	 *            the rightsHolder to set
	 */
	public void setRightsHolder(String rightsHolder) {
		this.rightsHolder = rightsHolder;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the agents
	 */
	public List<EOLAgent> getAgents() {
		return agents;
	}

	/**
	 * @param agents
	 *            the agents to set
	 */
	public void setAgents(List<EOLAgent> agents) {
		this.agents = agents;
	}

	/**
	 * @return the rights
	 */
	public String getRights() {
		return rights;
	}

	/**
	 * @param rights
	 *            the rights to set
	 */
	public void setRights(String rights) {
		this.rights = rights;
	}

	/**
	 * @return the source
	 */
	public String getSource() {
		return source;
	}

	/**
	 * @param source
	 *            the source to set
	 */
	public void setSource(String source) {
		this.source = source;
	}

	/**
	 * @return the mimeType
	 */
	public String getMimeType() {
		return mimeType;
	}

	/**
	 * @param mimeType
	 *            the mimeType to set
	 */
	public void setMimeType(String mimeType) {
		this.mimeType = mimeType;
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
}
