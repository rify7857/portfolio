package com.web.f5.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.CEODAO;

public class CEOServiceImpl implements CEOService{
	
	@Autowired
	private CEODAO CeoDao;
	@Override
	public String selectStore(String memberId) {
		// TODO Auto-generated method stub
		return CeoDao.selectStore(memberId);
	}
}
