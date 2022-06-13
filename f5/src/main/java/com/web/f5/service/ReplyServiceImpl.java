package com.web.f5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.ReplyDAO;
import com.web.f5.vo.RecommendVO;
import com.web.f5.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO replyDao;
	
	@Override
	public int getInsertResult(ReplyVO vo) {
		return replyDao.insert(vo);
	}

	@Override
	public List<ReplyVO> getSelectList(String boardIdx) {
		return replyDao.select(boardIdx);
	}

	@Override
	public int getDeleteResult(String replyIdx) {
		return replyDao.delete(replyIdx);
	}

	@Override
	public ReplyVO getSelectOne(String replyIdx) {
		return replyDao.selectOne(replyIdx);
	}

	@Override
	public int getUpdateResult(ReplyVO vo) {
		return replyDao.update(vo);
	}

	@Override
	public int getRecoInsertResult(ReplyVO vo) {
		return replyDao.recoInsert(vo);
	}

	@Override
	public int getRecoCheckResult(ReplyVO vo) {
		return replyDao.recoCheck(vo);
	}

	@Override
	public int getRecoUpdateResult(ReplyVO vo) {
		return replyDao.recoUpdate(vo);
	}

	@Override
	public int getRecoDeleteResult(ReplyVO vo) {
		return replyDao.recoDelete(vo);
	}

	@Override
	public List<String> getSelectIdxList(String boardIdx) {
		return replyDao.selectIdx(boardIdx);
	}

	@Override
	public int getRecoCountResult(String replyRecommendCheck, String replyIdx) {
		return replyDao.recoCount(replyRecommendCheck, replyIdx);
	}

	@Override
	public String getSelectReCheck(String replyIdx, String memberId) {
		return replyDao.reCheck(replyIdx, memberId);
	}

	
	
}
