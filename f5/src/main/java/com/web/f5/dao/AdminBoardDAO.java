package com.web.f5.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.AdminBoardVO;

public class AdminBoardDAO implements AdminObjDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.adminboard";
	
	@Override
	public List<Object> select(int startCount, int endCount) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		return sqlSession.selectList(namespace + ".list", param);
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
	
	@Override
	public Object select(String idx) {
		
		return sqlSession.selectOne(namespace + ".boardContent", idx);
	}

	@Override
	public int delete(String idx) {
		
		return sqlSession.delete(namespace + ".boardDelete", idx);
	}

	public List<AdminBoardVO> select() {
		
		return sqlSession.selectList(namespace + ".limitList");
	}

	public ArrayList<AdminBoardVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search", search);
		param.put("search_type", search_type);
		
		List<AdminBoardVO> list = new ArrayList<AdminBoardVO>();
		list = sqlSession.selectList(namespace + ".getSearchJSONResult", param);
		
		return (ArrayList<AdminBoardVO>) list;
	}

	public List<Object> getSearchList(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search_type", search_type);
		param.put("search", search);
		
		return sqlSession.selectList(namespace + ".getSearchList", param);
	}

	@Override
	public int insert(Object obj) {return 0;}

	@Override
	public int update(Object obj) {return 0;}

	public void getInsertPageview(String pageName) {
		
		sqlSession.insert(namespace + ".getInsertPageview", pageName);
	}

	public int getTotalPV() {
		
		return sqlSession.selectOne(namespace + ".getTotalPV");
	}

	public int getTodayPV() {
		
		return sqlSession.selectOne(namespace + ".getTodayPV");
	}
}
