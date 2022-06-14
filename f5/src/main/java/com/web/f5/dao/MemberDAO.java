package com.web.f5.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.AdminMemberVO;
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
}
