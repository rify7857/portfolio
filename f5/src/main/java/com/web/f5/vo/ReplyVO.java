package com.web.f5.vo;

public class ReplyVO {
	String replyIdx, boardIdx, memberId, replyContent,
	replyDate, replyUpdateDate, replyRecommendCheck;
	int recoCount, derecoCount;

	public int getDerecoCount() {
		return derecoCount;
	}

	public void setDerecoCount(int derecoCount) {
		this.derecoCount = derecoCount;
	}

	public int getRecoCount() {
		return recoCount;
	}

	public void setRecoCount(int recoCount) {
		this.recoCount = recoCount;
	}

	public String getreplyIdx() {
		return replyIdx;
	}

	public String getReplyRecommendCheck() {
		return replyRecommendCheck;
	}

	public void setReplyRecommendCheck(String replyRecommendCheck) {
		this.replyRecommendCheck = replyRecommendCheck;
	}

	public void setreplyIdx(String replyIdx) {
		this.replyIdx = replyIdx;
	}

	public String getboardIdx() {
		return boardIdx;
	}

	public void setboardIdx(String boardIdx) {
		this.boardIdx = boardIdx;
	}

	public String getmemberId() {
		return memberId;
	}

	public void setmemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getreplyContent() {
		return replyContent;
	}

	public void setreplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getreplyDate() {
		return replyDate;
	}

	public void setreplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public String getreplyUpdateDate() {
		return replyUpdateDate;
	}

	public void setreplyUpdateDate(String replyUpdateDate) {
		this.replyUpdateDate = replyUpdateDate;
	}
	
	
	
}
