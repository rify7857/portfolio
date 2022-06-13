package com.web.f5.vo;

public class AdminQuestionVO {

	String questionIdx;
	String memberId;
	String questionProceed;
	String questionDate;
	String questionTitle;
	String questionContent;
	String questionAnswer;
	String memberEmail;
	int rno;
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getQuestionAnswer() {
		return questionAnswer;
	}
	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer = questionAnswer;
	}
	public String getQuestionIdx() {
		return questionIdx;
	}
	public void setQuestionIdx(String qeustionIdx) {
		this.questionIdx = qeustionIdx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getQuestionProceed() {
		return questionProceed;
	}
	public void setQuestionProceed(String questionProceed) {
		this.questionProceed = questionProceed;
	}
	public String getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
}
