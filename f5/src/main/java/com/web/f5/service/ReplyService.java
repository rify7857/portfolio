package com.web.f5.service;

import java.util.List;

import com.web.f5.vo.RecommendVO;
import com.web.f5.vo.ReplyVO;

public interface ReplyService {
	ReplyVO getSelectOne(String replyIdx);
	List<ReplyVO> getSelectList(String boardIdx);
	int getUpdateResult(ReplyVO vo);
	int getInsertResult(ReplyVO vo);
	int getDeleteResult(String replyIdx);
	int getRecoInsertResult(ReplyVO vo);
	int getRecoCheckResult(ReplyVO vo);
	int getRecoUpdateResult(ReplyVO vo);
	int getRecoDeleteResult(ReplyVO vo);
	List<String> getSelectIdxList(String boardIdx);
	int getRecoCountResult(String replyRecommendCheck, String replyIdx);
	String getSelectReCheck(String replyIdx, String memberId);
}
