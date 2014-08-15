package br.gov.sibbr.json.response.bhl;

public class BHLPage {
	
	private String pageId;
	private String shortTitle;
	private String publisherName;
	private String publisherPlace;
	private String publicationDate;
	
	/**
	 * Basic constructor for POJO
	 */
	public BHLPage(String pageId, String shortTitle, String publisherName, String publisherPlace, String publicationDate) {
		setPageId(pageId);
		setShortTitle(shortTitle);
		setPublisherName(publisherName);
		setPublisherPlace(publisherPlace);
		setPublicationDate(publicationDate);
	}
	
	public String toString() {
		String output = "";
		output += " PageId: " + getPageId();
		output += " - Short title: " + getShortTitle();
		output += " - Publisher name: " + getPublisherName();
		output += " - Publication date: " + getPublicationDate();
		return output;
	}

	/**
	 * @return the pageId
	 */
	public String getPageId() {
		return pageId;
	}

	/**
	 * @param pageId the pageId to set
	 */
	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	/**
	 * @return the shortTitle
	 */
	public String getShortTitle() {
		return shortTitle;
	}

	/**
	 * @param shortTitle the shortTitle to set
	 */
	public void setShortTitle(String shortTitle) {
		this.shortTitle = shortTitle;
	}

	/**
	 * @return the publisherName
	 */
	public String getPublisherName() {
		return publisherName;
	}

	/**
	 * @param publisherName the publisherName to set
	 */
	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}

	/**
	 * @return the publisherPlace
	 */
	public String getPublisherPlace() {
		return publisherPlace;
	}

	/**
	 * @param publisherPlace the publisherPlace to set
	 */
	public void setPublisherPlace(String publisherPlace) {
		this.publisherPlace = publisherPlace;
	}

	/**
	 * @return the publicationDate
	 */
	public String getPublicationDate() {
		return publicationDate;
	}

	/**
	 * @param publicationDate the publicationDate to set
	 */
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}
} //EOF
