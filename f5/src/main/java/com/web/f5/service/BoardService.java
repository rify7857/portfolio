package com.web.f5.service;

import java.util.List;

import com.web.f5.vo.BoardVO;
import com.web.f5.vo.RecommendVO;

public interface BoardService {
	
	void getUpdateHits(String boardIdx);
	int getDeleteResult(String boardIdx);
	int getContentUpdate(BoardVO vo);
	BoardVO getContentList(String boardIdx);
	List<BoardVO> getSelectList(String boardCategoty, int startCount, int endCount);
	int getInsertResult(BoardVO vo);
	int getRecoInsertResult(RecommendVO vo);
	int getRecoCheckResult(String boardIdx, String memberId);
	int getRecoUpdateResult(RecommendVO vo);
	int getRecoDeleteResult(RecommendVO vo);
	int getRecoCountResult(String boardRecommendCheck, String boardIdx);
	RecommendVO getRecoSelect(String boardIdx, String memberId);
	int getListCount(String boardCategory);
	int getBoardSearchCount(String search, String search_type, String boardCategory);
	List<BoardVO> getSearchSelectList(String boardCategory, int startCount, int endCount, String search, String search_type);
	int getCeoCheck(String memberId);
	int getFileUpdateResult(BoardVO vo);
}
