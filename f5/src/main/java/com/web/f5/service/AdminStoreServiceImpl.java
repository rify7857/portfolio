package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.AdminStoreDAO;
import com.web.f5.vo.AdminStoreVO;
import com.web.f5.vo.ReviewVO;

public class AdminStoreServiceImpl implements AdminStoreService{

	@Autowired
	private AdminStoreDAO adminStoreDAO;

	public int getListCount() {
		
		return adminStoreDAO.execTotalCount();
	}

	@Override
	public ArrayList<ReviewVO> getReview(int startCount, int endCount, String storeIdx) {
		
		return adminStoreDAO.getReview(startCount, endCount, storeIdx);
	}

	@Override
	public List<Object> getListResult(int startCount, int endCount) {
		
		return adminStoreDAO.getListResult(startCount, endCount);
	}

	@Override
	public List<Object> getSearchList(int startCount, int endCount, String search, String search_type) {
		
		return adminStoreDAO.getSearchList(startCount, endCount, search, search_type);
	}

	@Override
	public AdminStoreVO getContent(String id) {
		
		return adminStoreDAO.getContent(id);
	}

	@Override
	public int getReviewCount(String id) {
		
		return adminStoreDAO.getReviewCount(id);
	}

	@Override
	public int getUpdateResult(Object obj) {
		return 0;
	}

	@Override
	public int getDeleteResult(String id) {
		return 0;
	}

	@Override
	public int getInsertResult(Object obj) {
		return 0;
	}

	@Override
	public int getSearchCount(String search_type, String search) {
		return adminStoreDAO.getSearchCount(search_type, search);
	}

	@Override
	public int getReviewDelete(String idx, String ridx) {
		
		return adminStoreDAO.getReviewDelete(idx, ridx);
	}

	@Override
	public int getStoreDelete(String idx) {
		
		return adminStoreDAO.getStoreDelete(idx);
	}

	@Override
	public ArrayList<AdminStoreVO> getsearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		return adminStoreDAO.getSearchJSONResult(startCount, endCount, search, search_type);
	}
}
