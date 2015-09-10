package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class EOLText extends EOLDataObject {

	private String subject;

	/**
	 * 
	 * @param identifier
	 * @param dataObjectVersionID
	 * @param dataType
	 * @param vettedStatus
	 * @param dataRating
	 * @param subject
	 * @param mimeType
	 * @param title
	 * @param language
	 * @param license
	 * @param rights
	 * @param rightsHolder
	 * @param source
	 * @param description
	 * @param agents
	 */
	public EOLText(String identifier, String dataObjectVersionID,
			String dataType, String vettedStatus, String dataRating,
			String subject, String mymeType, String title, String language,
			String license, String rights, String rightsHolder, String source,
			String description, List<EOLAgent> agents) {
		setIdentifier(identifier);
		setDataObjectVersionID(dataObjectVersionID);
		setDataType(dataType);
		setVettedStatus(vettedStatus);
		setDataRating(dataRating);
		setSubject(subject);
		setLanguage(language);
		setLicense(license);
		setRights(rights);
		setRightsHolder(rightsHolder);
		setSource(source);
		setDescription(description);
		setAgents(agents);
	}

	public static ArrayList<EOLText> processJSON(JSONArray json) {
		ArrayList<EOLText> images = new ArrayList<EOLText>();
		try {
			for (int i = 0; i < json.length(); i++) {
				JSONObject item = (JSONObject) json.get(i);
				// Check object has mime type:
				if (isText(item)) {

					String identifier = "";
					if (!item.isNull("identifier"))
						identifier = (String) item.get("identifier");

					String dataObjectVersionID = "";
					if (!item.isNull("dataObjectVersionID"))
						dataObjectVersionID = item.get("dataObjectVersionID")
								.toString();

					String dataType = "";
					if (!item.isNull("dataType"))
						dataType = (String) item.get("dataType");

					String vettedStatus = "";
					if (!item.isNull("vettedStatus"))
						vettedStatus = item.get("vettedStatus").toString();

					String dataRating = "";
					if (!item.isNull("dataRating"))
						dataRating = item.get("dataRating").toString();

					String subject = "";
					if (!item.isNull("subject"))
						subject = (String) item.get("subject");

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

					List<EOLAgent> agents = null;
					if (!item.isNull("agents"))
						agents = EOLAgent.processJSON((JSONArray) item
								.getJSONArray("agents"));

					// Create new EOLImage and add to list:
					images.add(new EOLText(identifier, dataObjectVersionID,
							dataType, vettedStatus, dataRating, subject,
							mimeType, title, language, license, rights,
							rightsHolder, source, description, agents));
				}
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return images;
	}

	/**
	 * Check this item is an text object
	 * 
	 * @param item
	 * @return
	 */
	public static boolean isText(JSONObject item) {
		try {
			if (item.has("mimeType") && !item.isNull("mimeType")) {
				String mime = (String) item.get("mimeType");
				if (mime.equalsIgnoreCase("text/html")) {
					return true;
				}
			} else {
				if (item.has("dataType") && !item.isNull("dataType")) {
					String type = (String) item.get("dataType");
					if (type.equalsIgnoreCase("http://purl.org/dc/dcmitype/Text")) {
						return true;
					}
				}
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "\n";
		output += " subject: " + getSubject();
		output += super.toString();
		return output;
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
}
