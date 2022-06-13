package com.web.f5.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.ReplyVO;

public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.reply";
	
	public String reCheck(String replyIdx, String memberId) {
		Map param = new HashMap<String, String>();
		param.put("replyIdx", replyIdx);
		param.put("memberId", memberId);
		return sqlSession.selectOne(namespace+".select_reCheck", param);
	}
	
	// 추천 수
	public int recoCount(String replyRecommendCheck, String replyIdx) {
		Map param = new HashMap<String, String>();
		param.put("replyRecommendCheck", replyRecommendCheck);
		param.put("replyIdx", replyIdx);
		return sqlSession.selectOne(namespace+".reco_count", param);
	}
	
	// 
	public List<String> selectIdx(String boardIdx) {
		return sqlSession.selectList(namespace+".select_idx", boardIdx);
	}
	
	// 추천 삭제
	public int recoDelete(ReplyVO vo) {
		return sqlSession.delete(namespace+".reco_delete", vo);
	}
	
	// 추천 업데이트
	public int recoUpdate(ReplyVO vo) {
		return sqlSession.update(namespace+".reco_update", vo);
	}
	
	// 추천 여부조회
	public int recoCheck(ReplyVO vo) {
		return sqlSession.selectOne(namespace+".reco_check", vo);
	}
	
	// 추천
	public int recoInsert(ReplyVO vo) {
		return sqlSession.insert(namespace+".reco_insert", vo);
	}
	
	// 댓글가져오기
	public ReplyVO selectOne(String replyIdx) {
		return sqlSession.selectOne(namespace+".select", replyIdx);
	}
	
	// 댓글수정
	public int update(ReplyVO vo) {
		return sqlSession.update(namespace+".update", vo);
	}
	
	// 댓글삭제
	public int delete(String replyIdx) {
		return sqlSession.delete(namespace+".delete", replyIdx);
	}
	
	// 댓글리스트
	public List<ReplyVO> select(String boardIdx) {
		return sqlSession.selectList(namespace+".list", boardIdx);
	}
	
	
	// 댓글입력
	public int insert(ReplyVO vo) {
		return sqlSession.insert(namespace+".insert", vo);
	}

}
