package br.gov.sibbr.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Set;

import org.json.JSONException;
import org.json.JSONObject;

import br.gov.sibbr.json.response.bhl.BHLResponse;
import br.gov.sibbr.json.response.eol.EOLResponse;

/**
 * Facade to assist in JSON requests from external APIs.
 * 
 * @author Pedro Guimarães
 * 
 */
public class JSONProcessor {

	// Define API base url address:
	private static final String bhlURL = "http://www.biodiversitylibrary.org/api2/httpquery.ashx?";
	private static final String eolURL = "http://eol.org/api/search/1.0.json?";
	private static final String nameCheckURL = "http://localhost:8080/dataquality-services/api/ocorrencia/busca/";

	/**
	 * Main test method
	 * 
	 * @param args
	 */
	public static void main(String args[]) {
		String name = "Casearia sylvestris";
		/*
		 * // Teste de consulta dos dados a partir da taxonomia na BHL:
		 * BHLResponse bhlresp = new BHLResponse("Casearia sylvestris");
		 * System.out.println("Before page processing:");
		 * System.out.println(bhlresp.toString());
		 * System.out.println("After page processing:");
		 * System.out.println(bhlresp.toString());
		 */
		// Teste de consulta dos dados a partir da taxonomia na EoL:

		EOLResponse eolresp = new EOLResponse(name);
		System.out.println("Results for " + name + ":");
		System.out.println(eolresp.toString());
		System.out.println(eolresp.getResults().toString());
	}

	/**
	 * For BHL, first, query taxon name to get reference's NameBankID :
	 * 
	 * @param scientificName
	 * @return json response object
	 */
	public static JSONObject fetchBHLFromTaxa(String scientificName) {
		// Set API request parameters:
		HashMap<String, String> parameters = new HashMap<String, String>();
		parameters.put("op", "NameSearch");
		parameters.put("name", scientificName.replace(" ", "+"));
		parameters.put("apikey", "0b33c0fb-f19b-4a93-9c56-5d35e99d03a3");
		parameters.put("format", "json");

		// JSON response object:
		JSONObject json = null;

		// Mount full API URL adding parameters:
		String mountedUrl = mountUrl(getBhlUrl(), parameters);
		try {
			json = readJsonFromUrl(mountedUrl);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}

	/** Second, query NameBankID to get reference pages and info: **/
	public static JSONObject fetchBHLPages(String nameBankId) {
		String mountedUrl = "";
		// JSON response object:
		JSONObject json = null;
		if (!nameBankId.equalsIgnoreCase("") && !nameBankId.equals(null)) {
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("op", "NameGetDetail");
			params.put("namebankid", nameBankId);
			params.put("apikey", "0b33c0fb-f19b-4a93-9c56-5d35e99d03a3");
			params.put("format", "json");
			mountedUrl = mountUrl(getBhlUrl(), params);
			try {
				json = readJsonFromUrl(mountedUrl);
			}
			catch (IOException e) {
				e.printStackTrace();
			}
			catch (JSONException e) {
				e.printStackTrace();
			}
		}
		return json;
	}

	/**
	 * For EoL, first, query taxon name to get result's id:
	 * 
	 * @param scientificName
	 *            provided from occurrence taxa
	 * @return json response object
	 */
	public static JSONObject fetchEOLFromTaxa(String scientificName) {
		// Set API request parameters:
		HashMap<String, String> parameters = new HashMap<String, String>();
		// Replace white spaces with '+':
		parameters.put("q", scientificName.replace(" ", "+"));
		parameters.put("exact", "true");

		// JSON response object:
		JSONObject json = null;

		// Mount full API URL adding parameters:
		String mountedUrl = mountUrl(getEolUrl(), parameters);
		try {
			json = readJsonFromUrl(mountedUrl);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}

	/** Second, query NameBankID to get reference pages and info: **/
	public static JSONObject fetchEOLPages(String id) {
		// Set API pages url:
		String url = "http://eol.org/api/pages/1.0.json?";
		// JSON response object:
		JSONObject json = null;

		// Sanity check:
		if (!id.equalsIgnoreCase("") && !id.equals(null)) {
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("id", id);
			params.put("common_names", "true");
			params.put("synonyms", "true");
			params.put("images", "100");
			params.put("videos", "100");
			params.put("sounds", "100");
			params.put("details", "true");
			url = mountUrl(url, params);
			try {
				json = readJsonFromUrl(url);
			}
			catch (IOException e) {
				e.printStackTrace();
			}
			catch (JSONException e) {
				e.printStackTrace();
			}
		}
		return json;
	}

	/**
	 * Access name check service to find name information given an occurrence's dwcaid 
	 * @param dwcaid
	 * @return
	 */
	public static JSONObject fetchNameCheck(String dwcaid) {
		// JSON response object:
		JSONObject json = null;

		// Mount full API URL adding parameters:
		String mountedUrl = getNameCheckUrl() + dwcaid;
		try {
			json = readJsonFromUrl(mountedUrl);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		catch (JSONException e) {
			e.printStackTrace();
		}
		return json;
	}
	
	/**
	 * Reads characters to string from reader
	 * 
	 * @param rd
	 * @return
	 * @throws IOException
	 */
	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}

	/**
	 * Read data from JSON request into JSONObject
	 * 
	 * @param url
	 * @return
	 * @throws IOException
	 * @throws JSONException
	 */
	private static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			// Treat cases when response is just an array:
			if (jsonText.charAt(0) == '[') {
				jsonText = "{Result:" + jsonText + "}";
			}	
			JSONObject json = new JSONObject(jsonText);
			return json;
		}
		finally {
			is.close();
		}
	}

	/**
	 * Mounts full url path to API from base url and parameters
	 * 
	 * @param baseUrl
	 * @param params
	 * @return
	 */
	private static String mountUrl(String baseUrl, HashMap<String, String> params) {
		String url = baseUrl;
		Set<String> keys = params.keySet();
		int counter = 0;
		for (String key : keys) {
			if (counter > 0)
				url += "&" + key + "=" + params.get(key);
			else
				url += key + "=" + params.get(key);
			counter++;
		}
		return url;
	}

	/**
	 * Return BHL base url
	 * 
	 * @return
	 */
	public static String getBhlUrl() {
		return bhlURL;
	}

	/**
	 * Return BHL base url
	 * 
	 * @return
	 */
	public static String getEolUrl() {
		return eolURL;
	}

	public static String getNameCheckUrl() {
		return nameCheckURL;
	}
}
// EOF