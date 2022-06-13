package com.web.f5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.BoardDAO;
import com.web.f5.vo.BoardVO;
import com.web.f5.vo.RecommendVO;

public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDao;
	
	
	@Override
	public int getInsertResult(BoardVO vo) {
		return boardDao.insert(vo);
	}


	@Override
	public List<BoardVO> getSelectList(String boardCategory, int startCount, int endCount) {
		return boardDao.select(boardCategory, startCount, endCount);
	}
	
	@Override
	public List<BoardVO> getSearchSelectList(String boardCategory, int startCount, int endCount, String search,
			String search_type) {
		return boardDao.searchList(boardCategory, startCount, endCount, search, search_type);
	}


	@Override
	public BoardVO getContentList(String boardIdx) {
		return boardDao.selectContent(boardIdx);
	}


	@Override
	public int getContentUpdate(BoardVO vo) {
		return boardDao.update(vo);
	}


	@Override
	public int getDeleteResult(String boardIdx) {
		return boardDao.delete(boardIdx);
	}


	@Override
	public void getUpdateHits(String boardIdx) {
		boardDao.update_hits(boardIdx);
		
	}


	@Override
	public int getRecoInsertResult(RecommendVO vo) {
		return boardDao.recoInsert(vo);
	}


	@Override
	public int getRecoCheckResult(String boardIdx, String memberId) {
		return boardDao.recoCheck(boardIdx, memberId);
	}


	@Override
	public int getRecoUpdateResult(RecommendVO vo) {
		return boardDao.recoUpdate(vo);
	}


	@Override
	public int getRecoDeleteResult(RecommendVO vo) {
		return boardDao.recoDelete(vo);
	}


	@Override
	public int getRecoCountResult(String boardRecommendCheck, String boardIdx) {
		return boardDao.recoCount(boardRecommendCheck, boardIdx);
	}


	@Override
	public RecommendVO getRecoSelect(String boardIdx, String memberId) {
		return boardDao.recoSelect(boardIdx, memberId);
	}


	@Override
	public int getListCount(String boardCategory) {
		return boardDao.execTotalCount(boardCategory);
	}


	public int getBoardSearchCount(String search, String search_type, String boardCategory) {
		return boardDao.getCountResult(search, search_type, boardCategory);
	}


	@Override
	public int getCeoCheck(String memberId) {
		return boardDao.getCeoResult(memberId);
	}


	@Override
	public int getFileUpdateResult(BoardVO vo) {
		return boardDao.getFileUpdteResult(vo);
	}


	


	

}
