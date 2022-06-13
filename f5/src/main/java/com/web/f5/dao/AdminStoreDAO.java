package com.web.f5.dao;

import java.net.MulticastSocket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.AdminStoreVO;
import com.web.f5.vo.ReviewVO;

public class AdminStoreDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.adminstore";

	public int execTotalCount() {
		
		return sqlSession.selectOne(namespace + ".count");
	}

	public ArrayList<ReviewVO> getReview(int startCount, int endCount, String storeIdx) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("storeIdx", storeIdx);
		
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		list = sqlSession.selectList(namespace + ".getReview", param);
		
		return (ArrayList<ReviewVO>) list;
	}

	public List<Object> getListResult(int startCount, int endCount) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		return sqlSession.selectList(namespace + ".list", param);
	}

	public List<Object> getSearchList(int startCount, int endCount, String search, String search_type) {
		
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search", search);
		param.put("search_type", search_type);
		
		return sqlSession.selectList(namespace + ".getSearchList", param);
	}

	public AdminStoreVO getContent(String id) {
		
		return sqlSession.selectOne(namespace + ".getContent", id);
	}

	public int getReviewCount(String id) {
		
		return sqlSession.selectOne(namespace + ".getReviewCount", id);
	}

	public int getReviewDelete(String idx, String ridx) {
		
		Map param = new HashMap<String, String>();
		param.put("storeIdx", idx);
		param.put("reviewIdx", ridx);
		
		return sqlSession.delete(namespace + ".getReviewDelete", param);
	}

	public int getStoreDelete(String idx) {
		
		return sqlSession.delete(namespace + ".getStoreDelete", idx);
	}

	public int getSearchCount(String search_type, String search) {
		
		Map param = new HashMap<String, String>();
		param.put("search", search);
		param.put("search_type", search_type);
		
		return sqlSession.selectOne(namespace + ".getSearchCount", param);
	}

	public ArrayList<AdminStoreVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		System.out.println("1"+startCount);
		System.out.println("2"+endCount);
		System.out.println("3"+search);
		System.out.println("4"+search_type);
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("search", search);
		param.put("search_type", search_type);
		
		List<AdminStoreVO> list = new ArrayList<AdminStoreVO>();
		list = sqlSession.selectList(namespace + ".getSearchList", param);
		
		return (ArrayList<AdminStoreVO>) list;
	}
}
