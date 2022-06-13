package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.AdminBoardDAO;
import com.web.f5.vo.AdminBoardVO;

public class AdminBoardServiceImpl implements AdminBoardService {

	@Autowired
	private AdminBoardDAO adminBoardDAO;
	
	@Override
	public List<Object> getListResult(int startCount, int endCount) {
		
		return adminBoardDAO.select(startCount, endCount);
	}

	@Override
	public int getListCount() {
		
		return adminBoardDAO.execTotalCount();
	}

	@Override
	public Object getContent(String id) {
		
		return adminBoardDAO.select(id);
	}

	@Override
	public int getDeleteResult(String id) {
		
		return adminBoardDAO.delete(id);
	}

	@Override
	public List<AdminBoardVO> getLimitList() {
		
		return adminBoardDAO.select();
	}

	@Override
	public int getSearchCount(String search_type, String search) {
		
		return adminBoardDAO.searchCount(search_type, search);
	}

	@Override
	public ArrayList<AdminBoardVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		return adminBoardDAO.getSearchJSONResult(startCount, endCount, search, search_type);
	}

	@Override
	public List<Object> getSearchList(int startCount, int endCount, String search, String search_type) {
		
		return adminBoardDAO.getSearchList(startCount, endCount, search, search_type);
	}

	@Override
	public int getInsertResult(Object obj) {return 0;}

	@Override
	public int getUpdateResult(Object obj) {return 0;}

	@Override
	public void getInsertPageview(String pageName) {
		
		adminBoardDAO.getInsertPageview(pageName);
	}

	@Override
	public int getTotalPV() {
		
		return adminBoardDAO.getTotalPV();
	}

	@Override
	public int getTodayPV() {
		
		return adminBoardDAO.getTodayPV();
	}
}
