package com.web.f5.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;


import com.web.f5.vo.StoreVO;

public class StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.store";
	public int insert(StoreVO vo) {
		return sqlSession.insert(namespace+".insert",vo);
	}
	public StoreVO select(String storeIdx) {
		return sqlSession.selectOne(namespace+".select",storeIdx);
		
	}
	
	public ArrayList<StoreVO> select(int startCount,int endCount) {
		Map<String,Integer> param = new HashMap<String,Integer>();
		param.put("Start", startCount);
		param.put("End", endCount);
		List<StoreVO> list = new ArrayList<StoreVO>();
		list = sqlSession.selectList(namespace+".selectlist",param);
		return (ArrayList<StoreVO>)list;
	}
	public int execTotalCount() {
		return sqlSession.selectOne(namespace+".totalCount");
	}
	public StoreVO getMaxCount(String storeIdx) {
		return sqlSession.selectOne(namespace+".getMaxCount",storeIdx);
	}
	
	public int insertFile(StoreVO vo) {
		return sqlSession.insert(namespace+".insertFile",vo);
	}
	public String getStoreIdx() {
		return sqlSession.selectOne(namespace+".selectStoreIdx");
	}
	public StoreVO selectSufiles(String storeIdx){
		return sqlSession.selectOne(namespace+".selectSufiles",storeIdx);
	}
}
