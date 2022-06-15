package com.web.f5.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.AdminMemberVO;
import com.web.f5.vo.AdminQuestionVO;
import com.web.f5.vo.BoardVO;
import com.web.f5.vo.MemberVO;
import com.web.f5.vo.StoreVO;

public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace = "mapper.member";

	public int idCheck(String id) {
		return sqlSession.selectOne(namespace + ".id_check", id);
	}

	public int select(MemberVO vo) {
		int result = sqlSession.selectOne(namespace + ".loginCheck", vo);
		return result;
	}

	public int insert(MemberVO vo) {

		return sqlSession.insert(namespace + ".memberInsert", vo);
	}

	public MemberVO select(String memberId) {
		return sqlSession.selectOne(namespace + ".select", memberId);
	}
	public int insertCeo(StoreVO vo, HttpSession session) {
		Map param = new HashMap<String, String>();
		param.put("memberId", session.getAttribute("memberId"));
		param.put("storeIdx", vo.getStoreIdx());
		return sqlSession.insert(namespace+".insertCeo",param);
	}
	
	public int memberUpdate(MemberVO vo) {
		return sqlSession.update(namespace+".memberUpdate",vo);
	}

	public int getBoardCount(String memberId) {
		
		return sqlSession.selectOne(namespace + ".getBoardCount", memberId);
	}

	public List<Object> getBoardList(String memberId) {
		
		return sqlSession.selectList(namespace + ".getBoardList", memberId);
	}

	public List<Object> getQuestionList(String memberId) {
		
		return sqlSession.selectList(namespace + ".getQuestionList", memberId);
	}

	public int getQuestionCount(String memberId) {
		
		return sqlSession.selectOne(namespace +".getQuestionCount", memberId);
	}

	public AdminQuestionVO getQuestionContent(String idx) {
		
		return sqlSession.selectOne(namespace + ".getQuestionContent", idx);
	}

	public int getCEOrequest(String id) {
		
		return sqlSession.update(namespace + ".getCEOrequest", id);
	}

	public int getCEOcancel(String id) {
		
		return sqlSession.update(namespace + ".getCEOcancel", id);
	}
}
