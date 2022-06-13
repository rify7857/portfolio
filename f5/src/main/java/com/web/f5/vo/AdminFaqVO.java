package com.web.f5.vo;

public class AdminFaqVO {

	String faqIdx;
	String faqTitle;
	String faqContent;
	String faqDate;
	String faqUpdateDate;
	int rno;
	
	public String getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(String faqDate) {
		this.faqDate = faqDate;
	}
	public String getFaqUpdateDate() {
		return faqUpdateDate;
	}
	public void setFaqUpdateDate(String faqUpdateDate) {
		this.faqUpdateDate = faqUpdateDate;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getFaqIdx() {
		return faqIdx;
	}
	public void setFaqIdx(String faqIdx) {
		this.faqIdx = faqIdx;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
}
