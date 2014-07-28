package br.gov.sibbr.json.response.model;

public class BHLPage {
	
	private String pageId;
	private String shortTitle;
	private String publisherName;
	private String publicationDate;
	
	/**
	 * Basic constructor for POJO
	 */
	public BHLPage(String pageId, String shortTitle, String publisherName, String publicationDate) {
		setPageId(pageId);
		setShortTitle(shortTitle);
		setPublisherName(publisherName);
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
	
	public String getPageId() {
		return pageId;
	}
	public void setPageId(String pageId) {
		this.pageId = pageId;
	}
	public String getShortTitle() {
		return shortTitle;
	}
	public void setShortTitle(String shortTitle) {
		this.shortTitle = shortTitle;
	}
	public String getPublisherName() {
		return publisherName;
	}
	public void setPublisherName(String publisherName) {
		this.publisherName = publisherName;
	}
	public String getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}
} //EOF
