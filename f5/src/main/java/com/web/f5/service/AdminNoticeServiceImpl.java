package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.AdminNoticeDAO;
import com.web.f5.vo.AdminNoticeVO;

public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeDAO adminNoticeDAO;
	
	@Override
	public int getListCount() {
		
		return adminNoticeDAO.execTotalCount();
	}
	
	@Override
	public int getSearchCount(String search_type, String search) {
		
		return adminNoticeDAO.searchCount(search_type, search);
	}
	@Override
	public List<Object> getListResult(int startCount, int endCount) {
		
		return adminNoticeDAO.select(startCount, endCount);
	}

	@Override
	public int getInsertResult(Object obj) {
		
		AdminNoticeVO vo = (AdminNoticeVO) obj;
		
		return adminNoticeDAO.insert(vo);
	}

	@Override
	public Object getContent(String idx) {
		
		return adminNoticeDAO.select(idx);
	}

	@Override
	public int getUpdateResult(Object obj) {
		
		AdminNoticeVO vo = (AdminNoticeVO) obj;
		
		return adminNoticeDAO.update(vo);
	}

	@Override
	public int getDeleteResult(String idx) {
		
		return adminNoticeDAO.delete(idx);
	}

	@Override
	public List<AdminNoticeVO> getLimitList() {
		
		return adminNoticeDAO.select();
	}

	@Override
	public List<Object> getSearchListResult(int startCount, int endCount, String search, String search_type) {
		
		return adminNoticeDAO.select(startCount, endCount, search, search_type);
	}

	@Override
	public ArrayList<AdminNoticeVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		return adminNoticeDAO.getSearchJSONResult(startCount, endCount, search, search_type);
	}
}
