package com.web.f5.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.ReservationDAO;
import com.web.f5.vo.ReservationVO;

public class ReservationServiceImpl implements ReservationService{

	@Autowired
	ReservationDAO reservationDao;
	
	public int insertResult(ReservationVO vo) {
		return reservationDao.insert(vo);
	}
	@Override
	public String getcuCountResult(String rDate, String storeIdx, int rTime) {
		// TODO Auto-generated method stub
		return reservationDao.getcuCount(storeIdx, rDate, rTime);
	}
	@Override
	public int getTNumber(String rDate, String storeIdx, int rTime) {
		// TODO Auto-generated method stub
		return reservationDao.getTNumber(storeIdx, rDate, rTime);
	}
}
