package br.gov.sibbr.json.response.namecheck;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import br.gov.sibbr.util.JSONProcessor;

public class NameCheckResponse {

	ArrayList<OrtographicValidation> names = new ArrayList<OrtographicValidation>();

	public NameCheckResponse(String dwcaid) {
		parseOrtographicValidation(JSONProcessor.fetchNameCheck(dwcaid));
	}

	public void parseOrtographicValidation(JSONObject json) {
		JSONArray results;
		try {
			results = (JSONArray) json.get("Result");
			for (int i = 0; i < results.length(); i++) {
				JSONObject element = (JSONObject) results.get(i);

				String classificacaoSuperior = "";
				if (!element.isNull("classificacaoSuperior"))
					classificacaoSuperior = (String) element
							.get("classificacaoSuperior");

				String fonteAvaliadora = "";
				if (!element.isNull("fonteAvaliadora"))
					fonteAvaliadora = (String) element.get("fonteAvaliadora");

				Boolean nomeFoiEncontrado = false;
				if (!element.isNull("nomeFoiEncontrado")) {
					nomeFoiEncontrado = (Boolean) element
							.get("nomeFoiEncontrado");
				}

				Boolean nomeFoiFornecido = false;
				if (!element.isNull("nomeFoiFornecido")) {
					nomeFoiFornecido = (Boolean) element
							.get("nomeFoiFornecido");
				}

				Boolean eSinonimo = false;
				if (!element.isNull("eSinonimo")) {
					eSinonimo = (Boolean) element.get("eSinonimo");
				}

				String nomeCientifico = "";
				if (!element.isNull("nomeCientifico"))
					nomeCientifico = (String) element.get("nomeCientifico");

				String taxonRank = "";
				if (!element.isNull("taxonRank"))
					taxonRank = (String) element.get("taxonRank");

				String eSinonimoDe = "";
				if (!element.isNull("eSinonimoDe"))
					eSinonimoDe = (String) element.get("eSinonimoDe");

				names.add(new OrtographicValidation(classificacaoSuperior,
						fonteAvaliadora, nomeFoiEncontrado, nomeFoiFornecido,
						eSinonimo, nomeCientifico, taxonRank, eSinonimoDe));
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<OrtographicValidation> getNames() {
		return names;
	}
}
