package com.web.f5.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class CEODAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	private String namespace = "mapper.ceo";
	
	public String selectStore(String memberId) {
		return sqlsession.selectOne(namespace+".selectStore",memberId);
	}
}
