package com.web.f5.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.ReviewVO;

public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.review";

	public ArrayList<ReviewVO> select(int startCount,int endCount ,String storeIdx) {
		Map param = new HashMap<String, String>();
		param.put("start", startCount);
		param.put("end", endCount);
		param.put("storeIdx", storeIdx);
		List<ReviewVO> list= sqlSession.selectList(namespace+".selectlist",param);
		return (ArrayList<ReviewVO>)list;
	}
	
	public int insert(ReviewVO vo) {
		return sqlSession.insert(namespace+".insert",vo);
	}
	public int delete(String reviewIdx) {
		return sqlSession.delete(namespace+".delete",reviewIdx);
	}
	public int update(String reviewIdx,String reviewContent,int reviewScore) {
		Map param = new HashMap<String, String>();
		param.put("reviewIdx", reviewIdx);
		param.put("reviewContent", reviewContent);
		param.put("reviewScore", reviewScore);
		return sqlSession.update(namespace+".update",param);
	}
	
	public ArrayList<ReviewVO> select(String memberId, int endCount, String storeIdx){
		Map param = new HashMap<String, String>();
		param.put("memberId", memberId);
		param.put("end", endCount);
		param.put("storeIdx", storeIdx);
		List<ReviewVO> list= sqlSession.selectList(namespace+".myselectlist",param);
		return (ArrayList<ReviewVO>)list;
	}
	public float getAverageScore(String storeIdx) {
		if(sqlSession.selectOne(namespace+".getAverageScore",storeIdx) == null) {
			return 0;
		}else {
			return sqlSession.selectOne(namespace+".getAverageScore",storeIdx);
		}
		
	}
	public ArrayList<ReviewVO> selectList(String memberId){
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		list = sqlSession.selectList(namespace+".selectList",memberId);
		return (ArrayList<ReviewVO>)list;
	}
}
