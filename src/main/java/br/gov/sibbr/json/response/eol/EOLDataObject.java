package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * POJO for EOL Data Object
 * @author pedro
 *
 */
public class EOLDataObject {

	private String identifier;
	private String dataObjectVersionID;
	private String dataType;
	private String dataSubtype;
	private String vettedStatus;
	private String dataRating;
	private String subject;
	private String mimeType;
	private String language;
	private String license;
	private String rightsHolder;
	private String description;
	private String eolThumbnail;
	private String source;
	private String mediaURL;
	private String title;
	private List<EOLAgent> agents = new ArrayList<EOLAgent>();

	/**
	 * Class base constructor
	 * @param identifier
	 * @param dataObjectVersionID
	 * @param dataType
	 * @param subject
	 * @param mimeType
	 * @param language
	 * @param license
	 * @param rightsHolder
	 * @param description
	 * @param eolThumbnail
	 * @param source
	 * @param mediaURL
	 * @param agents
	 */
	public EOLDataObject(String identifier, String dataObjectVersionID,
			String dataType, String dataRating, String subject, String mimeType,
			String language, String license, String rightsHolder,
			String description, String eolThumbnail, String source, String mediaURL, String title, List<EOLAgent> agents) {
		setIdentifier(identifier);
		setDataObjectVersionID(dataObjectVersionID);
		setDataType(dataType);
		setDataRating(dataRating);
		setSubject(subject);
		setMimeType(mimeType);
		setLanguage(language);
		setLicense(license);
		setRightsHolder(rightsHolder);
		setDescription(description);
		setEolThumbnail(eolThumbnail);
		setSource(source);
		setMediaURL(mediaURL);
		setTitle(title);
		setAgents(agents);
	}

	public static ArrayList<EOLDataObject> processJSON(JSONArray json) {
		ArrayList<EOLDataObject> dataObjects = new ArrayList<EOLDataObject>();
		try {
			for (int i = 0; i < json.length(); i++) {
				JSONObject item = (JSONObject) json.get(i);

				String identifier = "";
				if (!item.isNull("identifier"))
					identifier = (String) item.get("identifier");

				String dataObjectVersionID = "";
				if (!item.isNull("dataObjectVersionID"))
					dataObjectVersionID = item.get("dataObjectVersionID").toString();

				String dataType = "";
				if (!item.isNull("dataType"))
					dataType = (String) item.get("dataType");

				String dataRating = "";
				if (!item.isNull("dataRating"))
					dataRating = item.get("dataRating").toString();
				
				String subject = "";
				if (!item.isNull("subject"))
					subject = (String) item.get("subject");

				String mimeType = "";
				if (!item.isNull("mimeType"))
					mimeType = (String) item.get("mimeType");

				String language = "";
				if (!item.isNull("language"))
					language = (String) item.get("language");
				
				String license = "";
				if (!item.isNull("license"))
					license = (String) item.get("license");

				String rightsHolder = "";
				if (!item.isNull("rightsHolder"))
					rightsHolder = (String) item.get("rightsHolder");

				String description = "";
				if (!item.isNull("description"))
					description = (String) item.get("description");
				
				String thumb = "";
				if (!item.isNull("eolThumbnailURL"))
					thumb = (String) item.get("eolThumbnailURL");
				
				String source = "";
				if (!item.isNull("source"))
					source = (String) item.get("source");
				
				String mediaUrl = "mediaURL";
				if (!item.isNull("mediaURL"))
					mediaUrl = (String) item.get("mediaURL");
				
				String title= "title";
				if (!item.isNull("title"))
					title = (String) item.get("title");
				
				List<EOLAgent> agents = null;
				if(!item.isNull("agents"))
					agents = EOLAgent.processJSON((JSONArray) item.getJSONArray("agents"));
				
				// Create new Data Object and add to list:
				dataObjects.add(new EOLDataObject(identifier,
						dataObjectVersionID, dataType, dataRating, subject, mimeType, language, license, rightsHolder, description, thumb, source, mediaUrl, title, agents));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return dataObjects;
	}
	
	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "\n";
		output += " identifier: " + getIdentifier();
		output += " dataObjectVersionID: " + getDataObjectVersionID();
		output += " dataType: " + getDataType();
		output += " dataRating: " + getDataRating();
		output += " subject: " + getSubject();
		output += " mimeType: " + getMimeType();
		output += " language: " + getLanguage();
		output += " license: " + getLicense();
		output += " rightsHolder: " + getRightsHolder();
		output += " description: " + getDescription();
		output += " eolThumbnailURL: " + getEolThumbnail();
		output += " source: " + getSource();
		output += " mediaURL: " + getMediaURL();
		output += " title: " + getTitle();
		output += "\n Agents:";
		for (EOLAgent a: getAgents())
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
	 * @return the dataSubtype
	 */
	public String getDataSubtype() {
		return dataSubtype;
	}

	/**
	 * @param dataSubtype
	 *            the dataSubtype to set
	 */
	public void setDataSubtype(String dataSubtype) {
		this.dataSubtype = dataSubtype;
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
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}

	/**
	 * @param subject
	 *            the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
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
	 * @return the eolThumbnail
	 */
	public String getEolThumbnail() {
		return eolThumbnail;
	}

	/**
	 * @param eolThumbnail the eolThumbnail to set
	 */
	public void setEolThumbnail(String eolThumbnail) {
		this.eolThumbnail = eolThumbnail;
	}

	/**
	 * @return the source
	 */
	public String getSource() {
		return source;
	}

	/**
	 * @param source the source to set
	 */
	public void setSource(String source) {
		this.source = source;
	}

	/**
	 * @return the mediaURL
	 */
	public String getMediaURL() {
		return mediaURL;
	}

	/**
	 * @param mediaURL the mediaURL to set
	 */
	public void setMediaURL(String mediaURL) {
		this.mediaURL = mediaURL;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

}
