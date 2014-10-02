package br.gov.sibbr.json.response.eol;

import java.util.ArrayList;
import java.util.List;

public class EOLPage {

	private String id;
	private String richnessScore;
	private List<EOLSynonym> synonyms;
	private List<EOLVernacularName> vernacularNames;
	private List<EOLTaxonConcept> taxonConcepts;
	private List<EOLImage> images;
	private List<EOLText> texts;
	private List<EOLAudio> audio;

	/**
	 * Basic constructor for POJO
	 */
	public EOLPage(String id, String richnessScore, ArrayList<EOLSynonym> syonyms, ArrayList<EOLVernacularName> vernacularNames,
			ArrayList<EOLTaxonConcept> taxonConcepts, ArrayList<EOLImage> images, ArrayList<EOLText> texts, ArrayList<EOLAudio> audio) {
		setId(id);
		setRichnessScore(richnessScore);
		setSynonyms(syonyms);
		setVernacularNames(vernacularNames);
		setTaxonConcepts(taxonConcepts);
		setImages(images);
		setTexts(texts);
		setAudio(audio);
	}

	/**
	 * Default toString method
	 */
	public String toString() {
		String output = "\n";
		output += " PageId: " + getId();
		output += " Richness Score: " + getRichnessScore();
		output += "\n \t Synonyms: " + getSynonyms().size() + "\n";
		for (EOLSynonym s : getSynonyms())
			output += s.toString();
		output += "\n \t Vernacular Names: " + getVernacularNames().size() + "\n";
		for (EOLVernacularName v : getVernacularNames())
			output += v.toString();
		output += "\n \t Taxon Concepts: " + getTaxonConcepts().size() + "\n";
		for (EOLTaxonConcept t : getTaxonConcepts())
			output += t.toString();
		output += "\n \t Images: " + getImages().size() + "\n";
		for (EOLImage i : getImages())
			output += i.toString();
		output += "\n \t Texts: " + getTexts().size() + "\n";
		for (EOLText t : getTexts())
			output += t.toString();
		output += "\n \t Audio: " + getTexts().size() + "\n";
		for (EOLAudio a : getAudio())
			output += a.toString();
		return output;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the richnessScore
	 */
	public String getRichnessScore() {
		return richnessScore;
	}

	/**
	 * @param richnessScore
	 *            the richnessScore to set
	 */
	public void setRichnessScore(String richnessScore) {
		this.richnessScore = richnessScore;
	}

	/**
	 * @return the synonyms
	 */
	public List<EOLSynonym> getSynonyms() {
		return synonyms;
	}

	/**
	 * @param synonyms
	 *            the synonyms to set
	 */
	public void setSynonyms(List<EOLSynonym> synonyms) {
		this.synonyms = synonyms;
	}

	/**
	 * @return the vernacularNames
	 */
	public List<EOLVernacularName> getVernacularNames() {
		return vernacularNames;
	}

	/**
	 * @param vernacularNames
	 *            the vernacularNames to set
	 */
	public void setVernacularNames(List<EOLVernacularName> vernacularNames) {
		this.vernacularNames = vernacularNames;
	}

	/**
	 * @return the taxonConcepts
	 */
	public List<EOLTaxonConcept> getTaxonConcepts() {
		return taxonConcepts;
	}

	/**
	 * @param taxonConcepts
	 *            the taxonConcepts to set
	 */
	public void setTaxonConcepts(List<EOLTaxonConcept> taxonConcepts) {
		this.taxonConcepts = taxonConcepts;
	}

	/**
	 * @return the dataObjects
	 */
	public List<EOLImage> getImages() {
		return images;
	}

	/**
	 * @param dataObjects
	 *            the dataObjects to set
	 */
	public void setImages(List<EOLImage> images) {
		this.images = images;
	}

	/**
	 * @return the texts
	 */
	public List<EOLText> getTexts() {
		return texts;
	}

	/**
	 * @param texts
	 *            the texts to set
	 */
	public void setTexts(List<EOLText> texts) {
		this.texts = texts;
	}

	/**
	 * @return the audio
	 */
	public List<EOLAudio> getAudio() {
		return audio;
	}

	/**
	 * @param audio
	 *            the audio to set
	 */
	public void setAudio(List<EOLAudio> audio) {
		this.audio = audio;
	}

} // EOF
