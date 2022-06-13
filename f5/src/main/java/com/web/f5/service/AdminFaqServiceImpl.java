package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.AdminFaqDAO;
import com.web.f5.vo.AdminFaqVO;

public class AdminFaqServiceImpl implements AdminFaqService {

	@Autowired
	private AdminFaqDAO adminFaqDAO;
	
	@Override
	public List<Object> getListResult(int startCount, int endCount) {
		
		return adminFaqDAO.select(startCount, endCount);
	}

	@Override
	public List<Object> getSearchResult(int startCount, int endCount) {
		
		return adminFaqDAO.Searchselect(startCount, endCount);
	}
	@Override
	public int getListCount() {
		
		return adminFaqDAO.execTotalCount();
	}

	@Override
	public Object getContent(String idx) {
		
		return adminFaqDAO.select(idx);
	}

	@Override
	public int getUpdateResult(Object obj) {
		
		AdminFaqVO vo = (AdminFaqVO) obj;
		
		return adminFaqDAO.update(vo);
	}

	@Override
	public int getDeleteResult(String idx) {
		
		return adminFaqDAO.delete(idx);
	}

	@Override
	public int getInsertResult(Object obj) {
		
		AdminFaqVO vo = (AdminFaqVO) obj;
		
		return adminFaqDAO.insert(vo);
	}

	@Override
	public int getSearchCount(String search_type, String search) {
		
		return adminFaqDAO.getSearchCount(search_type, search);
	}

	@Override
	public List<Object> getsearchListResult(int startCount, int endCount, String search, String search_type) {
		
		return adminFaqDAO.getSearchListResult(startCount, endCount, search, search_type);
	}

	@Override
	public ArrayList<AdminFaqVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		return adminFaqDAO.getSearchJSONResult(startCount, endCount, search, search_type);
	}
}
