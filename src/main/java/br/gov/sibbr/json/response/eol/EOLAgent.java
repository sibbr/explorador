package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * POJO for EOLAgent object
 * 
 * @author pedro
 * 
 */
public class EOLAgent {

	private String fullName;
	private String homepage;
	private String role;

	/**
	 * Class base constructor
	 */
	public EOLAgent(String fullName, String homepage, String role) {
		setFullName(fullName);
		setHomepage(homepage);
		setRole(role);
	}

	/**
	 * Process json array into agent data
	 * 
	 * @param json
	 * @return
	 */
	public static List<EOLAgent> processJSON(JSONArray json) {
		List<EOLAgent> agents = new ArrayList<EOLAgent>();
		try {
			for (int i = 0; i < json.length(); i++) {
				JSONObject item = (JSONObject) json.get(i);

				String fullName = "";
				if (!item.isNull("full_name"))
					fullName = (String) item.get("full_name");

				String homepage = "";
				if (!item.isNull("homepage"))
					homepage = (String) item.get("homepage");

				String role = "";
				if (!item.isNull("role"))
					role = (String) item.get("role");

				agents.add(new EOLAgent(fullName, homepage, role));
			}
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
		return agents;
	}

	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "\n";
		output += " fullName: " + getFullName();
		output += " homepage: " + getHomepage();
		output += " role: " + getRole();
		return output;
	}

	/**
	 * @return the fullName
	 */
	public String getFullName() {
		return fullName;
	}

	/**
	 * @param fullName
	 *            the fullName to set
	 */
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	/**
	 * @return the homepage
	 */
	public String getHomepage() {
		return homepage;
	}

	/**
	 * @param homepage
	 *            the homepage to set
	 */
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role
	 *            the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
}
