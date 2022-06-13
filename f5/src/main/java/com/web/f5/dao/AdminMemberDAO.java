package com.web.f5.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.AdminMemberVO;

public class AdminMemberDAO implements AdminObjDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.adminmember";
	
	public int mberTotalCnt() {
		
		return sqlSession.selectOne(namespace + ".mberTotalCnt");
	}
	
	public int mberTodayCnt() {
		
		return sqlSession.selectOne(namespace + ".mberTodayCnt");
	}

	public int getCEOTotal() {
		
		return sqlSession.selectOne(namespace + ".CEOTotal");
	}

	public int getCEORequest() {
		
		return sqlSession.selectOne(namespace + ".CEORequest");
	}
	
	@Override
	public int execTotalCount() {
		
		return sqlSession.selectOne(namespace + ".count");
	}
	
	public int searchCount(String search_type, String search) {
		Map param = new HashMap<String, String>();
		param.put("search", search);
		param.put("search_type", search_type);
		
		return sqlSession.selectOne(namespace + ".searchCount", param);
	}
	
	public int getBlackCount() {
		
		return sqlSession.selectOne(namespace + ".getBlackCount");
	}

	public int getBlackSearchCount(String search_type, String search) {
		
		Map param = new HashMap<String, String>();
		param.put("search_type", search_type);
		param.put("search", search);
		
		return sqlSession.selectOne(namespace + ".getBlackSearchCount", param);
	}
	
	@Override
	public List<Object> select( int startCount, int endCount ) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		return sqlSession.selectList(namespace + ".list", param);
	}

	public List<AdminMemberVO> select() {
		
		return sqlSession.selectList(namespace + ".limitList");
	}

	public List<Object> select(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search", search);
		param.put("search_type", search_type);
		
		return sqlSession.selectList(namespace + ".searchList", param);
	}

	public ArrayList<AdminMemberVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search", search);
		param.put("search_type", search_type);
		
		List<AdminMemberVO> list = new ArrayList<AdminMemberVO>();
		list = sqlSession.selectList(namespace + ".JSONlist", param);
		
		return (ArrayList<AdminMemberVO>) list;
	}

	public List<Object> getCeoListResult(int startCount, int endCount) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		return sqlSession.selectList(namespace + ".ceoList", param);
	}

	public List<Object> getCeoSearchResult(int startCount, int endCount, String search, String search_type) {

		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search_type", search_type);
		param.put("search", search);
		
		return sqlSession.selectList(namespace + ".getCeoSearchResult", param);
	}

	public List<Object> getBlackListResult(int startCount, int endCount) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		return sqlSession.selectList(namespace + ".getBlackListResult", param);
	}

	public List<Object> getBlackMberSearch(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search", search);
		param.put("search_type", search_type);
		
		return sqlSession.selectList(namespace + ".getBlackMberSearch", param);
	}

	public ArrayList<AdminMemberVO> getBlackSearchList(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search", search);
		param.put("search_type", search_type);
		
		List<AdminMemberVO> list = new ArrayList<AdminMemberVO>();
		list = sqlSession.selectList(namespace + ".getBlackSearchList", param);
		
		return (ArrayList<AdminMemberVO>) list;
	}
	
	@Override
	public int insert(Object obj) {
		
		AdminMemberVO vo = (AdminMemberVO) obj;
		
		return sqlSession.insert(namespace + ".memberInsert", vo);
	}
	
	@Override
	public Object select(String id) {
		
		return sqlSession.selectOne(namespace + ".memberContent", id);
	}
	
	@Override
	public int update(Object obj) {
		
		AdminMemberVO vo = (AdminMemberVO) obj;
		
		return sqlSession.update(namespace + ".memberUpdate", vo);
	}
	
	@Override
	public int delete(String id) {
		
		return sqlSession.delete(namespace + ".memberDelete", id);
	}
	
	public int chkMberUpdate(String id, String auth) {
		
		Map param = new HashMap<String, String>();
		param.put("memberId", id);
		param.put("memberAuthority", auth);
		
		return sqlSession.update(namespace + ".chkMberUpdate", param);
	}

	public int getBlackInsert(String id) {
		
		return sqlSession.update(namespace + ".getBlackInsert", id);
	}

	public int getBlackOut(String id) {
		
		return sqlSession.update(namespace + ".getBlackOut", id);
	}

	public int getIdChk(String id) {
		
		return sqlSession.selectOne(namespace + ".getIdChk", id);
	}

	public int getCeoSearchCount(String search_type, String search) {
		
		Map param = new HashMap<String, String>();
		param.put("search_type", search_type);
		param.put("search", search);
		
		return sqlSession.selectOne(namespace + ".getCeoSearchCount", param);
	}

	public ArrayList<AdminMemberVO> getCeoSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search_type", search_type);
		param.put("search", search);
		
		List<AdminMemberVO> list = new ArrayList<AdminMemberVO>();
		list = sqlSession.selectList(namespace + ".getCeoSearchResult", param);
		
		return (ArrayList<AdminMemberVO>) list;
	}

	public int getCeoCount() {
		
		return sqlSession.selectOne(namespace + ".getCeoCount");
	}
}
