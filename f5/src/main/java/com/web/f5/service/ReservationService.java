package com.web.f5.service;

import java.util.ArrayList;

import com.web.f5.vo.ReservationVO;

public interface ReservationService {

	public int insertResult(ReservationVO vo);
	public String getcuCountResult(String rDate,String storeIdx,int rTime);
	public int getTNumber(String rDate,String storeIdx,int rTime);
}
