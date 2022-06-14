package com.web.f5.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.vo.ReservationVO;

public class ReservationDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "mapper.reservation";
	
	public int insert(ReservationVO vo) {
		return sqlSession.insert(namespace+".insert",vo);
	}
	public String getcuCount(String storeIdx, String rDate, int rTime) {
		Map param = new HashMap<String, String>();
		param.put("storeIdx", storeIdx);
		param.put("rDate", rDate);
		param.put("rTime", rTime);
		String result = sqlSession.selectOne(namespace+".getCuCount",param);
		if(result == null) {
			return "0";
		}else {
			return result;
		}
	}
	public int getTNumber(String storeIdx, String rDate, int rTime) {
		Map param = new HashMap<String, String>();
		param.put("storeIdx", storeIdx);
		param.put("rDate", rDate);
		param.put("rTime", rTime);
		int result = sqlSession.selectOne(namespace+".getTNumber",param);

			return result;
	}
	public ArrayList<ReservationVO> select(String memberId) {
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		list = sqlSession.selectList(namespace+".selectList",memberId);
		return (ArrayList<ReservationVO>)list;
	}
}
