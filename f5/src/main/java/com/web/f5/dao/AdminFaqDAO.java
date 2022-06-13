package com.web.f5.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.AdminFaqVO;

public class AdminFaqDAO implements AdminObjDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.adminfaq";
	
	@Override
	public int execTotalCount() {
		
		return sqlSession.selectOne(namespace + ".count");
	}
	
	public int getSearchCount(String search_type, String search) {
		
		Map param = new HashMap<String, String>();
		param.put("search", search);
		param.put("search_type", search_type);
		
		return sqlSession.selectOne(namespace + ".searchCount", param);
	}
	
	@Override
	public List<Object> select(int startCount, int endCount) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		return sqlSession.selectList(namespace + ".list", param);
	}

	public List<Object> Searchselect(int startCount, int endCount) {

		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		return sqlSession.selectList(namespace + ".searchList", param);
	}

	public List<Object> getSearchListResult(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search", search);
		param.put("search_type", search_type);
		
		return sqlSession.selectList(namespace + ".getSearchListResult", param);
	}

	public ArrayList<AdminFaqVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search_type", search_type);
		param.put("search", search);
		
		List<AdminFaqVO> list = new ArrayList<AdminFaqVO>();
		list = sqlSession.selectList(namespace + ".getSearchJSONResult", param);
		
		return (ArrayList<AdminFaqVO>) list;
	}
	
	@Override
	public int insert(Object obj) {
		
		AdminFaqVO vo = (AdminFaqVO) obj;
		
		return sqlSession.insert(namespace + ".faqInsert", vo);
	}

	@Override
	public Object select(String idx) {
		
		return sqlSession.selectOne(namespace + ".faqContent", idx);
	}

	@Override
	public int update(Object obj) {
		
		AdminFaqVO vo = (AdminFaqVO) obj;
		
		return sqlSession.update(namespace + ".faqUpdate", vo);
	}

	@Override
	public int delete(String idx) {
		
		return sqlSession.delete(namespace + ".faqDelete", idx);
	}
}
