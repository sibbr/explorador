package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class EOLImage extends EOLDataObject {

	private String eolThumbnail;
	private String mediaURL;
	private String location;

	/**
	 * 
	 * @param identifier
	 * @param dataObjectVersionID
	 * @param dataType
	 * @param vettedStatus
	 * @param dataRating
	 * @param mimeType
	 * @param title
	 * @param language
	 * @param license
	 * @param rights
	 * @param rightsHolder
	 * @param source
	 * @param description
	 * @param mediaURL
	 * @param eolThumbnail
	 * @param location
	 * @param agents
	 */
	public EOLImage(String identifier, String dataObjectVersionID, String dataType, String vettedStatus, String dataRating, String mimeType,
			String title, String language, String license, String rights, String rightsHolder, String source, String description, String mediaURL,
			String eolThumbnail, String location, List<EOLAgent> agents) {
		setIdentifier(identifier);
		setDataObjectVersionID(dataObjectVersionID);
		setDataType(dataType);
		setVettedStatus(vettedStatus);
		setDataRating(dataRating);
		setMimeType(mimeType);
		setTitle(title);
		setLanguage(language);
		setLicense(license);
		setRights(rights);
		setRightsHolder(rightsHolder);
		setSource(source);
		setDescription(description);
		setMediaURL(mediaURL);
		setEolThumbnail(eolThumbnail);
		setLocation(location);
		setAgents(agents);
	}

	public static ArrayList<EOLImage> processJSON(JSONArray json) {
		ArrayList<EOLImage> images = new ArrayList<EOLImage>();
		try {
			for (int i = 0; i < json.length(); i++) {
				JSONObject item = (JSONObject) json.get(i);
				// Check object has mime type:
				if (!item.isNull("mimeType")) {
					String mime = (String) item.get("mimeType");
					// Check this is an image object:
					if (mime.equalsIgnoreCase("image/jpeg")) {
						String identifier = "";
						if (!item.isNull("identifier"))
							identifier = (String) item.get("identifier");

						String dataObjectVersionID = "";
						if (!item.isNull("dataObjectVersionID"))
							dataObjectVersionID = item.get("dataObjectVersionID").toString();

						String dataType = "";
						if (!item.isNull("dataType"))
							dataType = (String) item.get("dataType");

						String vettedStatus = "";
						if (!item.isNull("vettedStatus"))
							vettedStatus = item.get("vettedStatus").toString();

						String dataRating = "";
						if (!item.isNull("dataRating"))
							dataRating = item.get("dataRating").toString();

						String mimeType = "";
						if (!item.isNull("mimeType"))
							mimeType = (String) item.get("mimeType");

						String title = "";
						if (!item.isNull("title"))
							title = (String) item.get("title");

						String language = "";
						if (!item.isNull("language"))
							language = (String) item.get("language");

						String license = "";
						if (!item.isNull("license"))
							license = (String) item.get("license");

						String rights = "";
						if (!item.isNull("rights"))
							rights = (String) item.get("rights");

						String rightsHolder = "";
						if (!item.isNull("rightsHolder"))
							rightsHolder = (String) item.get("rightsHolder");

						String source = "";
						if (!item.isNull("source"))
							source = (String) item.get("source");

						String description = "";
						if (!item.isNull("description"))
							description = (String) item.get("description");

						String mediaUrl = "mediaURL";
						if (!item.isNull("mediaURL"))
							mediaUrl = (String) item.get("mediaURL");

						String thumb = "";
						if (!item.isNull("eolThumbnailURL"))
							thumb = (String) item.get("eolThumbnailURL");

						String location = "";
						if (!item.isNull("location"))
							location = (String) item.get("location");

						List<EOLAgent> agents = null;
						if (!item.isNull("agents"))
							agents = EOLAgent.processJSON((JSONArray) item.getJSONArray("agents"));

						// Create new EOLImage and add to list:
						images.add(new EOLImage(identifier, dataObjectVersionID, dataType, vettedStatus, dataRating, mimeType, title, language,
								license, rights, rightsHolder, source, description, mediaUrl, thumb, location, agents));
					}
				}
			}
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
		return images;
	}

	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "\n";
		output += " title: " + getTitle();
		output += " eolThumbnail: " + getEolThumbnail();
		output += " mediaURL: " + getMediaURL();
		output += " location: " + getLocation();
		output += super.toString();
		return output;
	}

	/**
	 * @return the eolThumbnail
	 */
	public String getEolThumbnail() {
		return eolThumbnail;
	}

	/**
	 * @param eolThumbnail
	 *            the eolThumbnail to set
	 */
	public void setEolThumbnail(String eolThumbnail) {
		this.eolThumbnail = eolThumbnail;
	}

	/**
	 * @return the mediaURL
	 */
	public String getMediaURL() {
		return mediaURL;
	}

	/**
	 * @param mediaURL
	 *            the mediaURL to set
	 */
	public void setMediaURL(String mediaURL) {
		this.mediaURL = mediaURL;
	}

	/**
	 * @return the location
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * @param location
	 *            the location to set
	 */
	public void setLocation(String location) {
		this.location = location;
	}
}
